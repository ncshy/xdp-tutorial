/* SPDX-License-Identifier: GPL-2.0 */
#include <stddef.h>
#include <linux/bpf.h>
#include <linux/in.h>
#include <linux/in6.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/ipv6.h>
#include <linux/ip.h>
#include <linux/icmpv6.h>
#include <linux/icmp.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>
/* Defines xdp_stats_map from packet04 */
#include "../common/xdp_stats_kern_user.h"
#include "../common/xdp_stats_kern.h"

/* Header cursor to keep track of current parsing position */
struct hdr_cursor {
	void *pos;
};

struct vlan_hdr {
	__be16	h_vlan_TCI;
	__be16	h_vlan_encapsulated_proto;
};

/* Parse for VLAN tags */
static __always_inline int isvlan(__u16 proto) 
{
	return !!(proto == ETH_P_8021Q || proto == ETH_P_8021AD);	//Why is the double negation done? 
}

/* Packet parsing helpers.
 *
 * Each helper parses a packet header, including doing bounds checking, and
 * returns the type of its contents if successful, and -1 otherwise.
 *
 * For Ethernet and IP headers, the content type is the type of the payload
 * (h_proto for Ethernet, nexthdr for IPv6), for ICMP it is the ICMP type field.
 * All return values are in host byte order.
 */
static __always_inline int parse_ethhdr(struct hdr_cursor *nh,
					void *data_end,
					struct ethhdr **ethhdr)
{
	struct ethhdr *eth = nh->pos;
	int hdrsize = sizeof(*eth);
	int l3_proto;

	/* Byte-count bounds check; check if current pointer + size of header
	 * is after data_end.
	 */
	if (nh->pos + hdrsize > data_end)
		return -1;

	nh->pos += hdrsize;
	*ethhdr = eth;

	l3_proto = eth->h_proto;
	
	/* Check for VLAN tags */
	int vlan = isvlan(bpf_ntohs(eth->h_proto)); /* network-byte-order */

	if (vlan) {
		bpf_printk("Parsing vlan hdr\n");
		struct vlan_hdr *vhdr = nh->pos;
		int hdrsize = sizeof(*vhdr);

		if (nh->pos + hdrsize > data_end)
			return -1;
	
		nh->pos += hdrsize;
		l3_proto = vhdr->h_vlan_encapsulated_proto;		
	}
	bpf_printk("l3_proto is %04x\n", l3_proto);
	return l3_proto;
}

static __always_inline int parse_ip4hdr(struct hdr_cursor *nh,
					void *data_end,
					struct iphdr **ip4hdr)
{

	struct iphdr *ip4 = nh->pos;      // The iphdr always contains only 20 bytes
	if (nh->pos + sizeof(*ip4) > data_end)
		return -1;
	int hdrsize = (ip4->ihl)*4;      // The actual iphdr can include options, and it's reflected in ihl.
	bpf_printk("ip hdr size %d\n", hdrsize);

	if (nh->pos + hdrsize > data_end)
		return -1;

	nh->pos += hdrsize;
	*ip4hdr = ip4;
	
	return ip4->protocol;
	
}

/* Assignment 2: Implement and use this */
static __always_inline int parse_ip6hdr(struct hdr_cursor *nh,
					void *data_end,
					struct ipv6hdr **ip6hdr)
{
	struct ipv6hdr *ip6 = nh->pos;
	int hdrsize = sizeof(*ip6);

	if (nh->pos + hdrsize > data_end)
		return -1;

	nh->pos += hdrsize;
	*ip6hdr = ip6;

	return ip6->nexthdr;
}

static __always_inline int parse_icmphdr(struct hdr_cursor *nh,
					void *data_end,
					struct icmphdr **icmp4hdr)
{
	struct icmphdr *icmp4 = nh->pos;
	int hdrsize = sizeof(*icmp4);

	if (nh->pos + hdrsize > data_end)
		return -1;

	*icmp4hdr = icmp4;

	return icmp4->un.echo.sequence;	// 2 byte field
}
/* Assignment 3: Implement and use this */
static __always_inline int parse_icmp6hdr(struct hdr_cursor *nh,
					void *data_end,
					struct icmp6hdr **icmp6hdr)
{
	struct icmp6hdr *icmp6 = nh->pos;
	int hdrsize = sizeof(*icmp6);

	if (nh->pos + hdrsize > data_end)
		return -1;

	*icmp6hdr = icmp6;

	return icmp6->icmp6_sequence;	// 2 byte field
}

SEC("xdp")
int  xdp_parser_func(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth;
	struct ipv6hdr *ip6;
	struct icmp6hdr *icmp6;

	struct iphdr *ip4;
	struct icmphdr *icmp4;

	/* Default action XDP_PASS, imply everything we couldn't parse, or that
	 * we don't want to deal with, we just pass up the stack and let the
	 * kernel deal with it.
	 */
	__u32 action = XDP_PASS; /* Default action */

        /* These keep track of the next header type and iterator pointer */
	struct hdr_cursor nh;
	int nh_type;

	/* Start next header cursor position at data start */
	nh.pos = data;

	/* Packet parsing in steps: Get each header one at a time, aborting if
	 * parsing fails. Each helper function does sanity checking (is the
	 * header type in the packet correct?), and bounds checking.
	 */
	bpf_printk("Parsing eth hdr\n");
	nh_type = parse_ethhdr(&nh, data_end, &eth);
	if (nh_type < 0)
		return -1;
	if (nh_type != bpf_htons(ETH_P_IPV6) && nh_type != bpf_htons(ETH_P_IP))
		goto out;

	if (nh_type == bpf_htons(ETH_P_IPV6)) {
		bpf_printk("Parsing ipv6 hdr\n");
		/* Assignment additions go below here */
		nh_type = parse_ip6hdr(&nh, data_end, &ip6);
		if (nh_type < 0)
			return -1;
		bpf_printk("ipv6 nxthdr type is %d\n", nh_type);
		if (nh_type != IPPROTO_ICMPV6)  //IPPROTO_* defined as enum in linux/in6.h ; No ntohs since nexthdr is __u8 so network and host representation are same.
			goto out;

		bpf_printk("Parsing icmpv6 hdr\n");
		nh_type = parse_icmp6hdr(&nh, data_end, &icmp6);
		if (nh_type < 0)
			return -1;
		bpf_printk("icmp6 seq number is %d\n", bpf_ntohs(nh_type));
		if (bpf_ntohs(nh_type) % 2 == 1)  // nh_type is __be16 so network and host representation should be made consistent.
			goto out;
	} else {
		bpf_printk("Parsing ipv4 hdr\n");
		
		nh_type = parse_ip4hdr(&nh, data_end, &ip4);
		if (nh_type < 0)
			return -1;
		bpf_printk("ipv4 protocol type is %d\n", nh_type);
		if (nh_type != IPPROTO_ICMP)  //IPPROTO_* defined as enum in linux/in.h ; No ntohs since protocol is __u8 so network and host representation are same.
			goto out;
		bpf_printk("Parsing icmp hdr\n");
		nh_type = parse_icmphdr(&nh, data_end, &icmp4);
		if (nh_type < 0)
			return -1;
		bpf_printk("icmp seq number is %d\n", bpf_ntohs(nh_type));
		if (bpf_ntohs(nh_type) % 2 == 1)  // nh_type is __be16 so network and host representation should be made consistent.
			goto out;
			
	}
	action = XDP_DROP;

out:
	return xdp_stats_record_action(ctx, action); /* read via xdp_stats */
}

char _license[] SEC("license") = "GPL";
