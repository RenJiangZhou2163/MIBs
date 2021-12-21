a--  ************************************************
--  $Id: ZXR10-L2VPN.mib 3 2010-7-27 01:34:21Z wangcx $
--
--  ZXR10-L2VPN.mib: ZXR10 L2VPN query  MIB file
--
--  Nov. 2009, Wang chunxia
--  Jul. 2010, kbhuang 
--
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
   "L2vpn inst type"               "L2vpn PW Type. Assigned values are specified in 'IANA Allocations 
             for Pseudowire Edge to Edge Emulation (PWE3)"                                                         ]"This MIB describes statistics objects for ZXROSNG L2vpn instances 
        and interfaces." �"ZTE Corporation
         Nanjing Institute of ZTE Corporation

         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China

         Tel: +86-25-52870000" "201405131500Z" "201307151200Z" "201305131200Z" "201303181700Z" "200911130000Z"�"Add leaf objects for dropped/unicast/multicast/broadcast packets/bytes:
       zxr10L2vpnStatisInDropPkts, zxr10L2vpnStatisOutDropPkts,
       zxr10L2vpnStatisInDropBytes, zxr10L2vpnStatisOutDropBytes,
       zxr10L2vpnStatisRecvMcPkts, zxr10L2vpnStatisRecvMcBytes,
       zxr10L2vpnStatisSndMcPkts, zxr10L2vpnStatisSndMcBytes,
       zxr10L2vpnStatisRecvBcPkts, zxr10L2vpnStatisRecvBcBytes,
       zxr10L2vpnStatisSndBcPkts, zxr10L2vpnStatisSndBcBytes,
       zxr10L2vpnStatisRecvUcPkts, zxr10L2vpnStatisRecvUcBytes,
       zxr10L2vpnStatisRecvUkUcPkts, zxr10L2vpnStatisRecvUkUcBytes,
       zxr10L2vpnStatisPwRecvMcPkts, zxr10L2vpnStatisPwRecvMcBytes,
       zxr10L2vpnStatisPwSndMcPkts, zxr10L2vpnStatisPwSndMcBytes,
       zxr10L2vpnStatisPwRecvBcPkts, zxr10L2vpnStatisPwRecvBcBytes,
       zxr10L2vpnStatisPwSndBcPkts, zxr10L2vpnStatisPwSndBcBytes,
       zxr10L2vpnStatisPwRecvUcPkts, zxr10L2vpnStatisPwRecvUcBytes,
       zxr10L2vpnStatisPwRecvUkUcPkts, zxr10L2vpnStatisPwRecvUkUcBytes,
       zxr10L2vpnStatisAcInDropBytes, zxr10L2vpnStatisAcOutDropBytes,
       zxr10L2vpnStatisAcRecvMcPkts, zxr10L2vpnStatisAcRecvMcBytes,
       zxr10L2vpnStatisAcSndMcPkts, zxr10L2vpnStatisAcSndMcBytes,
       zxr10L2vpnStatisAcRecvBcPkts, zxr10L2vpnStatisAcRecvBcBytes,
       zxr10L2vpnStatisAcSndBcPkts, zxr10L2vpnStatisAcSndBcBytes,
       zxr10L2vpnStatisAcRecvUcPkts, zxr10L2vpnStatisAcRecvUcBytes,
       zxr10L2vpnStatisAcRecvUkUcPkts, zxr10L2vpnStatisAcRecvUkUcBytes." {"Modify syntax of zxr10L2vpnStatisVpnName object:
       from DisplayString (SIZE(0..31)) to DisplayString (SIZE(0..32))."_"Add leaf objects for dropped packets/bytes and bandwidth parameter:
       zxr10L2vpnStatisPwInDropPkts, zxr10L2vpnStatisPwOutDropPkts,
       zxr10L2vpnStatisPwInDropBytes, zxr10L2vpnStatisPwOutDropBytes,
       zxr10L2vpnStatisPwInBandWidth, zxr10L2vpnStatisPwOutBandWidth,
       zxr10L2vpnStatisPwInBandUsage, zxr10L2vpnStatisPwOutBandUsage." ""Add description for all objects." ""                                "L2vpn instance statistic table"                       )"Information of L2vpn instance statistic"                       "The name of the instance."                       "The VPN type of the instance."                       -"The received packets count of the instance."                       +"The received bytes count of the instance."                       )"The sent packets count of the instance."                       '"The sent bytes count of the instance."                       ,"The received packets rate of the instance."                       *"The received bytes rate of the instance."                       ("The sent packets rate of the instance."                       &"The sent bytes rate of the instance."                       2"The input dropped packets count of the instance."                       3"The output dropped packets count of the instance."                       0"The input dropped bytes count of the instance."                       1"The output dropped bytes count of the instance."                       7"The received multicast packets count of the instance."                       5"The received multicast bytes count of the instance."                       3"The sent multicast packets count of the instance."                       1"The sent multicast bytes count of the instance."                       7"The received broadcast packets count of the instance."                       5"The received broadcast bytes count of the instance."                       3"The sent broadcast packets count of the instance."                       1"The sent broadcast bytes count of the instance."                       5"The received unicast packets count of the instance."                       3"The received unicast bytes count of the instance."                       ="The received unknown unicast packets count of the instance."                       ;"The received unknown unicast bytes count of the instance."                       "L2vpn PW statistic table"                       $"Information of L2vpn PW statistics"                       "The name of the PW."                       "The input label of the PW."                       '"The received packets count of the PW."                       %"The received bytes count of the PW."                       #"The sent packets count of the PW."                       !"The sent bytes count of the PW."                       &"The received packets rate of the PW."                       $"The received bytes rate of the PW."                       ""The sent packets rate of the PW."                        "The sent bytes rate of the PW."                       ""The peer's IP address of the PW."                       "The VCID of the PW."                       #"The encapsulation type of the PW."                       &"The input dropped packets of the PW."                       '"The output dropped packets of the PW."                       $"The input dropped bytes of the PW."                       %"The output dropped bytes of the PW."                       *"The input bandwidth parameter of the PW."                       +"The output bandwidth parameter of the PW."                       ."The input bandwidth usage percent of the PW."                       /"The output bandwidth usage percent of the PW."                       1"The received multicast packets count of the PW."                       /"The received multicast bytes count of the PW."                       -"The sent multicast packets count of the PW."                       +"The sent multicast bytes count of the PW."                       1"The received broadcast packets count of the PW."                       /"The received broadcast bytes count of the PW."                       -"The sent broadcast packets count of the PW."                       +"The sent broadcast bytes count of the PW."                       /"The received unicast packets count of the PW."                       -"The received unicast bytes count of the PW."                       7"The received unknown unicast packets count of the PW."                       5"The received unknown unicast bytes count of the PW."                       "L2vpn AC statistic table."                       $"Information of L2vpn AC statistics"                        "The interface index of the AC."                       '"The received packets count of the AC."                       %"The received bytes count of the AC."                       #"The sent packets count of the AC."                       !"The sent bytes count of the AC."                       &"The received packets rate of the AC."                       $"The received bytes rate of the AC."                       ""The sent packets rate of the AC."                        "The sent bytes rate of the AC."                       ,"The input dropped packets count of the AC."                       -"The output dropped packets count of the AC."                       *"The input dropped bytes count of the AC."                       +"The output dropped bytes count of the AC."                       1"The received multicast packets count of the AC."                       /"The received multicast bytes count of the AC."                       -"The sent multicast packets count of the AC."                       +"The sent multicast bytes count of the AC."                       1"The received broadcast packets count of the AC."                       /"The received broadcast bytes count of the AC."                       -"The sent broadcast packets count of the AC."                       +"The sent broadcast bytes count of the AC."                       /"The received unicast packets count of the AC."                       -"The received unicast bytes count of the AC."                       7"The received unknown unicast packets count of the AC."                       5"The received unknown unicast bytes count of the AC."                          