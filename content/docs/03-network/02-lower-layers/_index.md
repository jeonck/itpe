---
title: Lower-Layer (L1~L3) Protocols and Technologies
weight: 2
---

This section covers the protocols and technologies corresponding to the physical layer (L1), data link layer (L2), and network layer (L3) of the OSI 7-layer model. These layers handle core infrastructure functions ranging from actual data transmission medium access, frame-level error control, to logical address-based path discovery.

## Learning Topics

| Number | Topic Name | Layer | Key Keywords |
|---|---|---|---|
| 1 | [L1/L2 MAC and Error/Flow Control](l1-l2-mac-error) | L1, L2 | CSMA/CD, CSMA/CA, ARQ, sliding window |
| 2 | [L2 Switch, VLAN, STP](l2-switch-vlan-stp) | L2 | MAC learning, 802.1Q trunking, Spanning Tree |
| 3 | [L3 IP Addressing (IPv4/IPv6/NAT)](l3-ip-addressing) | L3 | CIDR, subnetting, IPv6 transition, NAT/PAT |
| 4 | [L3 Routing Protocol](l3-routing) | L3 | RIP, OSPF, BGP, ARP, ICMP, IGMP |

## Summary of Key Functions by Layer

| Layer | Name | PDU | Key Functions | Representative Protocol |
|---|---|---|---|---|
| L1 | Physical Layer | Bit | signal transmission, medium access control | Ethernet physical, DSL, Wi-Fi physical |
| L2 | Data Link Layer | Frame | MAC address-based delivery, error detection and correction | Ethernet, VLAN (802.1Q), STP (802.1D) |
| L3 | Network Layer | Packet | logical address assignment, path determination, routing | IP, ARP, ICMP, OSPF, BGP |
