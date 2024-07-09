/* SPDX-License-Identifier: GPL-2.0 */
#include <stddef.h>
#include <linux/bpf.h>
#include <linux/in.h>
#include <linux/in6.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/ipv6.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/icmpv6.h>
#include <linux/icmp.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>
/* Defines xdp_stats_map from packet04 */
#include "../common/xdp_stats_kern_user.h"
#include "../common/xdp_stats_kern.h"

#ifndef memcpy
#define memcpy(dest, src, n) __builtin_memcpy((dest), (src), (n))
#endif

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

// The parsing helper functions from the packet01 lesson have moved here
//#include "../common/parsing_helpers.h"

/* Pops the outermost VLAN tag off the packet. Returns the popped VLAN ID on
 * success or -1 on failure.
 */
static __always_inline int vlan_tag_pop(struct xdp_md *ctx, struct ethhdr *eth)
{
	
	void *data_end = (void *)(long)ctx->data_end;
	void *data;
	struct ethhdr eth_cpy;
	struct vlan_hdr *vlh;
	__be16 h_proto;
	__u8 *curr;

	curr = (__u8 *)eth;
	
	int vlid = -1;

	/* Still need to do bounds checking */
	if (curr + sizeof(*eth) > data_end)
		return -1;
	
	vlh = (struct vlan_hdr *)(curr + sizeof(*eth));
	curr = (__u8 *)vlh;
	if (curr + sizeof(*vlh) > data_end)
		return -1;
	/* Save vlan ID for returning, h_proto for updating Ethernet header */
	bpf_printk("Obtain VLAN id and proto \n");
	vlid = bpf_ntohs(vlh->h_vlan_TCI) & 0x0fff;
	h_proto = vlh->h_vlan_encapsulated_proto;
	/* Make a copy of the outer Ethernet header before we cut it off */
	memcpy(&eth_cpy , eth, sizeof(*eth));
	/* Actually adjust the head pointer */
	bpf_xdp_adjust_head(ctx, sizeof(*vlh));
	/* Need to re-evaluate data *and* data_end and do new bounds checking
	 * after adjusting head
	 */
	data = (void*)(long)ctx->data;
	data_end = (void *)(long)ctx->data_end;
	/* Copy back the old Ethernet header and update the proto type */
	if (data + sizeof(eth_cpy) > data_end)
		return -1;
	memcpy(data, &eth_cpy, sizeof(eth_cpy));
	eth = data;

	eth->h_proto = h_proto;

	bpf_printk("VLID: %d\n", vlid);
	return vlid;
}

/* Pushes a new VLAN tag after the Ethernet header. Returns 0 on success,
 * -1 on failure.
 */
static __always_inline int vlan_tag_push(struct xdp_md *ctx,
					 struct ethhdr *eth, int vlid)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data;
	struct ethhdr ether_copy;
	struct vlan_hdr vlh;
	struct vlan_hdr *vlhdr;
	__be16 h_proto;
	__u8 *curr;
	int vlh_space;

	curr = (__u8 *)eth;
	if (curr + sizeof(*eth) > data_end)
		return -1;
	/* Save ether type to later update in the VLAN header */
	h_proto = eth->h_proto;

	/* Fill up vlan header details */
	//vlh.h_vlan_TCI &= 0xf000;
	vlh.h_vlan_TCI = bpf_htons(vlid);
	bpf_printk("VLID: %d\n", bpf_ntohs(vlh.h_vlan_TCI));
	vlh.h_vlan_encapsulated_proto = h_proto;

	/* Save ether header in a local copy */
	memcpy(&ether_copy, data, sizeof(ether_copy));
	/* Create space for vlan header */
	vlh_space = (int)-sizeof(vlh);
	bpf_xdp_adjust_head(ctx, vlh_space);

	data = (void*)(long)ctx->data;
	data_end = (void *)(long)ctx->data_end;

	curr = (__u8 *)data;
	if (curr + sizeof(*eth) > data_end)
		return -1;

	/* Adding VLAN header after Ether header */
	eth = (struct ethhdr *)data;
	eth->h_proto = bpf_htons(ETH_P_8021Q);	

	vlhdr = (struct vlan_hdr *)(curr + sizeof(*eth));
	curr = (__u8 *)vlhdr;
	if (curr + sizeof(*vlhdr) > data_end)
		return -1;

	memcpy(vlhdr, &vlh, sizeof(*vlhdr));		

	return 0;
}

static __always_inline int parse_tcphdr(struct hdr_cursor *nh,
					void *data_end,
					struct tcphdr **tcphdr)
{
	struct tcphdr *tcph = nh->pos;
	int hdrsize = sizeof(*tcph);

	if (nh->pos + hdrsize > data_end)
		return -1;

	tcph->dest = bpf_htons(bpf_ntohs(tcph->dest) - 1);
	nh->pos += hdrsize;
	*tcphdr = tcph;

	return 0;
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

static __always_inline int parse_ipv6hdr(struct hdr_cursor *nh,
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


/* Implement assignment 1 in this section */
SEC("xdp")
int xdp_port_rewrite_func(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;


	/* These keep track of the next header type and iterator pointer */
	struct hdr_cursor nh;
	int nh_type;
	nh.pos = data;

	struct ethhdr *eth;

	/* Packet parsing in steps: Get each header one at a time, aborting if
	 * parsing fails. Each helper function does sanity checking (is the
	 * header type in the packet correct?), and bounds checking.
	 */
	nh_type = parse_ethhdr(&nh, data_end, &eth);
	if (nh_type < 0)
		return -1;
	if (nh_type == bpf_htons(ETH_P_IPV6)) {
		struct ipv6hdr *ip6;

		bpf_printk("Parsing ipv6 hdr \n");
		nh_type = parse_ipv6hdr(&nh, data_end, &ip6);
	    if (nh_type < 0)
			return -1;
		if (nh_type == IPPROTO_TCP) {
			bpf_printk("Parsing TCP hdr \n");
			struct tcphdr *tcph;
			nh_type = parse_tcphdr(&nh, data_end, &tcph);
	    	if (nh_type < 0)
				return -1;
		}
	}

	return XDP_PASS;
}

/* VLAN swapper; will pop outermost VLAN tag if it exists, otherwise push a new
 * one with ID 1. Use this for assignments 2 and 3.
 */
SEC("xdp")
int xdp_vlan_swap_func(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;

	/* These keep track of the next header type and iterator pointer */
	struct hdr_cursor nh;
	int nh_type;
	nh.pos = data;

	struct ethhdr *eth;
	bpf_printk("Parsing Eth hdr \n");
	nh_type = parse_ethhdr(&nh, data_end, &eth);
	if (nh_type < 0)
		return XDP_PASS;

	/* Assignment 2 and 3 will implement these. For now they do nothing */
	if (isvlan(bpf_ntohs(eth->h_proto)))
		vlan_tag_pop(ctx, eth);
	else
		vlan_tag_push(ctx, eth, 2);

	return XDP_PASS;
}

/* Solution to the parsing exercise in lesson packet01. Handles VLANs and legacy
 * IP (via the helpers in parsing_helpers.h).
 */
SEC("xdp")
int  xdp_parser_func(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;

	/* Default action XDP_PASS, imply everything we couldn't parse, or that
	 * we don't want to deal with, we just pass up the stack and let the
	 * kernel deal with it.
	 */
	__u32 action = XDP_PASS; /* Default action */

	/* These keep track of the next header type and iterator pointer */
	struct hdr_cursor nh;
	int nh_type;
	nh.pos = data;

	struct ethhdr *eth;

	/* Packet parsing in steps: Get each header one at a time, aborting if
	 * parsing fails. Each helper function does sanity checking (is the
	 * header type in the packet correct?), and bounds checking.
	 */
	nh_type = parse_ethhdr(&nh, data_end, &eth);

	if (nh_type == bpf_htons(ETH_P_IPV6)) {
		struct ipv6hdr *ip6h;
		struct icmp6hdr *icmp6h;

		nh_type = parse_ipv6hdr(&nh, data_end, &ip6h);
		if (nh_type != IPPROTO_ICMPV6)
			goto out;

		nh_type = parse_icmp6hdr(&nh, data_end, &icmp6h);
		if (nh_type != ICMPV6_ECHO_REQUEST)
			goto out;

		if (bpf_ntohs(icmp6h->icmp6_sequence) % 2 == 0)
			action = XDP_DROP;

	} else if (nh_type == bpf_htons(ETH_P_IP)) {
		struct iphdr *iph;
		struct icmphdr *icmph;

		nh_type = parse_ip4hdr(&nh, data_end, &iph);
		if (nh_type != IPPROTO_ICMP)
			goto out;

		nh_type = parse_icmphdr(&nh, data_end, &icmph);
		if (nh_type != ICMP_ECHO)
			goto out;

		if (bpf_ntohs(icmph->un.echo.sequence) % 2 == 0)
			action = XDP_DROP;
	}
 out:
	return xdp_stats_record_action(ctx, action);
}

char _license[] SEC("license") = "GPL";
