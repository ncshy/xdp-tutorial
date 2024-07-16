# xdp-tutorial

Copy of the repository available at: https://github.com/xdp-project/xdp-tutorial/tree/master

This repository is my personal copy where I work through the exercises. Currently I have completed upto tracing-02-xdp-monitor/ 

# How I solved issue #357 (https://github.com/xdp-project/xdp-tutorial/issues/357)

**Problem:** <br>
Using XDP_REDIRECT, TCPv6 and TCPv4 connections were unable to establish a connection since the receiver device never responds back. However receiver responds for ICMP echo requests.

**Solution:** <br>
Using bpftrace, I monitored the stack trace on the receiver network namespace(iperf3 server was the running application). 

`sudo bpftrace -e 't:tcp:tcp_bad_csum {printf("%s\n", kstack);}'`

This triggered a stack trace dump when sending packets from the iperf3 client, indicating that there was an issue with the TCP checskum. 

The output received was:
` Attaching 1 probe...

        tcp_v4_rcv+2080
        tcp_v4_rcv+2080
        ip_protocol_deliver_rcu+60
        ip_local_deliver_finish+72
        ip_local_deliver+253
        ip_sublist_rcv_finish+109
        ip_sublist_rcv+383
        ip_list_rcv+281
        __netif_receive_skb_list_core+561
        netif_receive_skb_list_internal+417
        gro_normal_list.part.0+30
        napi_complete_done+113
        veth_poll+220
        __napi_poll+51
        net_rx_action+284
        __softirqentry_text_start+221
        do_softirq+110
        __local_bh_enable_ip+84
        ip_finish_output2+421
        __ip_finish_output+531
        ip_finish_output+46
        ip_output+122
        ip_local_out+94
        __ip_queue_xmit+384
        ip_queue_xmit+21
        __tcp_transmit_skb+2380
        tcp_connect+1180
        tcp_v4_connect+1136
        __inet_stream_connect+211
        inet_stream_connect+59
        __sys_connect_file+99
        __sys_connect+164
        __x64_sys_connect+26
        do_syscall_64+92
        entry_SYSCALL_64_after_hwframe+98`

This shows that the packet was received and failed at the tcp_v4_rcv function due to a bad checksum error in the checksum field. This hinted at hardware offloading being enabled but without any actual support for it. 

Using this as a reference, I used tcdpump in a verbose mode:

`root> tcpdump -ne -vvv -i veth0` <br>

The output was: <br>
`01:13:23.405485 9a:ff:c6:04:d3:f7 > d6:06:ac:4d:54:25, ethertype IPv4 (0x0800), length 74: (tos 0x0, ttl 64, id 43262, offset 0, flags [DF], proto TCP (6), length 60)
    10.11.2.2.54680 > 10.11.1.2.5201: Flags [S], cksum 0x1748 (incorrect -> 0x9fc8), seq 2130367359, win 42340, options [mss 1460,sackOK,TS val 311467198 ecr 0,nop,wscale 14], length 0 <br> `
    
`01:13:24.414899 9a:ff:c6:04:d3:f7 > d6:06:ac:4d:54:25, ethertype IPv4 (0x0800), length 74: (tos 0x0, ttl 64, id 43263, offset 0, flags [DF], proto TCP (6), length 60)
    10.11.2.2.54680 > 10.11.1.2.5201: Flags [S], cksum 0x1748 (incorrect -> 0x9bd6), seq 2130367359, win 42340, options [mss 1460,sackOK,TS val 311468208 ecr 0,nop,wscale 14], length 0 `
    
Indeed, this showed that the checksum was incorrect.  
Checking the veth0 interface features at the client side using ethtool:

`root>  ethool -k veth0`

`Features for veth0:
rx-checksumming: on
tx-checksumming: on
        tx-checksum-ipv4: off [fixed]
        tx-checksum-ip-generic: on
        tx-checksum-ipv6: off [fixed]
        tx-checksum-fcoe-crc: off [fixed]
        tx-checksum-sctp: on `

So, I decided to turn of tx checksumming with:

`root> ethtool -K veth0 tx off`

After this I was receiving a response from the iperf3 server which was however a SYN-ACK message (response to the TCP SYN that was sent). However the final ACK from the client was not being sent back. 
This is because the server network namespace also had TX checksumming turned on on it's veth0 interface and it was producing a wrong result in the TCP checksum field carrying the SYN-ACK packet. 

Removing TX checksumming on both network namespaces allowed the TCP connection to be established and packets were being sent between the client and server iperf3 applications. 

The underlying issue is that the Veth driver advertises HW_checksumming via the NETIF_F_HW_CSUM flag, but does not seem to have the code to calculate the checksum. This part needs to be investigated further. 
