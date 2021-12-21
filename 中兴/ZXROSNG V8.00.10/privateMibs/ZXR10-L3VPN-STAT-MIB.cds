^--  ************************************************
--  $Id: ZXR10-MPLS-L3VPN-STATIS.mib 3 2005-07-26 01:34:21Z taowq $
--
--  ZXR10-MPLS-L3VPN.mib: ZXR10 MPLS L3VPN query  MIB file
--
--  Jul. 2005, Tao wenqiang
--
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                 6"ZXROS v4.6.03 MPLS L3VPN query and configuration MIB" �"ZTE Corporation
         Nanjing Institute of ZTE Corporation

         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China

         Tel: +86-25-52870000" "201703020000Z" "201612220000Z" "201304100000Z" "200509260000Z""Optimize the description information for the following nodes:
                    zxr10L3vpnStatisRecvPkts,
                    zxr10L3vpnStatisRecvBytes,
                    zxr10L3vpnStatisSndPkts ,
                    zxr10L3vpnStatisSndBytes .
        " ["add a new zxr10L3vpnPeerPolStatisObjects about MPLS l3vpn peer policy traffics.
        ""modify: zxr10L3vpnStatisVpnID,
                    zxr10L3vpnStatisVpnName,
                    zxr10L3vpnStatisRecvPkts,
                    zxr10L3vpnStatisRecvBytes,
                    zxr10L3vpnStatisSndPkts ,
                    zxr10L3vpnStatisSndBytes
        " ""                   !"MPLS L3VPN instance query table"                       7"Information of MPLS L3VPN instance configured on a PE"                       "VPN ID"                       
"VRF name"                       8"Total number of packets received by the L3VPN instance"                       6"Total number of bytes received by the L3VPN instance"                       4"Total number of packets sent by the L3VPN instance"                       2"Total number of bytes sent by the L3VPN instance"                           $"MPLS L3VPN peer policy query table"                       /"Traffic information of MPLS L3VPN peer policy"                       
"VRF name"                       "VPN peer addr"                       
"Priority"                       *"Number of packets sent by the L3VPN peer"                       ("Number of bytes sent by the L3VPN peer"                       "VPN ID"                      