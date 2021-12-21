 �-- 
--  $Id: ZXR10-MPLS-L3VPN-STATIS.mib 3 2005-07-26 01:34:21Z taowq $
--
--  ZXR10-MPLS-L3VPN.mib: ZXR10-IF-STAT-MIB  MIB file
--
--  Jul. 2005, Tao wenqiang
--
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  
   v"A switching value, the value of 0 indicates that the closure, 
             the value of 1 indicates that the open."              �"A unique value, greater than zero, for each interface or
            interface sub-layer in the managed system.  It is
            recommended that values are assigned contiguously starting
            from 1.  The value for each interface sub-layer must remain
            constant at least from one re-initialization of the entity's
            network management system to the next re-initialization."                                                     "" �"ZTE Corporation
         Nanjing Institute of ZTE Corporation

         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China

         Tel: +86-25-52870000" "201809120000Z" "201707250000Z" "201702140000Z" "201701180000Z" "201609140000Z" "201606220000Z" "201604050000Z" "201508210000Z" "201505040000Z" "201503110000Z" "201501290000Z" "201412230000Z" "201410150000Z" "201406160000Z" "201405290000Z" "201403130000Z" "201311150000Z" "201310310000Z" "201307020000Z" "201305030000Z" "201304020000Z" "200509260000Z" 3"Add a new table called zxr10IPsecTunnelStatTable." P"Add new node zxr10IfPerfGlobalRateStatPeriod in zxr10IfPerfGlobalSwitchObject."7"Add new node zxr10TeIfTrafficStatInPNBytes in zxr10TeIfTrafficStatTable.
     Add new node zxr10TeIfTrafficStatInPNPkts in zxr10TeIfTrafficStatTable.
     Add new node zxr10TeIfTrafficStatOutPNBytes in zxr10TeIfTrafficStatTable.
     Add new node zxr10TeIfTrafficStatOutPNPkts in zxr10TeIfTrafficStatTable." ."Add a new table called zxr10IfRateStatTable." |"Add new node zxr10SpiStatInDropPkts in zxr10SpiStatTable.
     Add new node zxr10SpiStatOutDropPkts in zxr10SpiStatTable." +"Add a new table called zxr10SpiStatTable." �"Add new node zxr10IfSpeedGatherInBitSpeed in zxr10IfSpeedGatherTable.
    Add new node zxr10IfSpeedGatherOutBitSpeed in zxr10IfSpeedGatherTable." 3"Add a new table called zxr10VxLanTunnelStatTable." 1"Add a new table called zxr10IfSpeedGatherTable." 1"Add a new table called zxr10IfRatioGatherTable." �"Change the name from zxr10IfTrafficStatInUrpfDrpPkts into zxr10IfTrafficStatInV4UrpfDrpPkts
         Change the name from zxr10IfTrafficStatOutUrpfDrpPkts into zxr10IfTrafficStatInV6UrpfDrpPkts
         in the table zxr10IfTrafficStatTable" �"Add a new table called zxr10PhyIfStatTable;
        Add a new table called zxr10IPLogicIfStatTable;
        Add a new table called zxr10NoIPLogicIfStatTable." 1"Add a new table called zxr10GreTunnelStatTable." K"Add new interface performance items about URPF in zxr10IfTrafficStatTable" j"Add a new table called zxr10WlanBssCountersTable.
        Add a new table called zxr10IfHwCountersTable" B"Change SYNTAX Integer32 into Unsigned32 in Zxr10IfPerfLimitEntry" ."Add a new table called zxr10IfIPv6StatsTable" H"Add new node zxr10IfTrafficStatOutUpCarDrop in zxr10IfTrafficStatTable" B"Add new interface performance items in zxr10TeIfTrafficStatTable"�"Import SNMP data type:Integer32,TEXTUAL-CONVENTION;
        Delete data type definition:DisplayString;
        Correct the definition of Type Switch;
        Change SEQUENCE identifier to startwith upper case;
        Change SYNTAX INTEGER into Integer32;
        The identifier 'zxr10IfPerfSwitchRowStatus' is already present in this module, change the second one into zxr10IfPerfSpecialIfSwitchRowStatus" <"Add interface performance item for SNMP according with CLI" ""               ""                       ""                       "Interface index"                       "Interface name"                       "In packets"                       "Out packets"                       "ipSystemStatsInReceivesV4"                       "ipSystemStatsInOctetsV4"                       "ipSystemStatsInHdrErrorsV4"                       "ipSystemStatsInAddrErrorsV4"                        "ipSystemStatsInTruncatedPktsV4"                       "ipSystemStatsInBcastPktsV4"                       "ipSystemStatsInNoRoutesV4"                       !"ipSystemStatsInUnknownProtosV4 "                       "ipSystemStatsInDiscardsV4"                        "ipSystemStatsInForwDatagramsV4"                       "ipSystemStatsInReceivesV6"                       "ipSystemStatsInOctetsV6 "                       "ipSystemStatsInHdrErrorsV6"                        "ipSystemStatsInTruncatedPktsV6"                       "ipSystemStatsInAddrErrorsV6"                       "ipSystemStatsInBcastPktsV6"                       "ipSystemStatsInNoRoutesV6"                        "ipSystemStatsInUnknownProtosV6"                       "ipSystemStatsInDiscardsV6"                        "ipSystemStatsInForwDatagramsV6"                       "ipSystemStatsOutDiscardsV4"                       !"ipSystemStatsOutForwDatagramsV4"                       "ipSystemStatsOutFragReqdsV4"                       "ipSystemStatsOutDiscardsV6"                       !"ipSystemStatsOutForwDatagramsV6"                       "ipSystemStatsOutFragReqdsV6"                       "ipSystemStatsInUpsendCarDrop"                       "ipSystemStatsOutV4"                       "ipSystemStatsOutOctetsV4"                       "ipSystemStatOutV6"                       "ipSystemStatOutOctetsV6"                       "ipSystemStatsOutUpCarDrop"                       "ipSystemStatsInV4UrpfDrpPkts"                       "ipSystemStatsInV6UrpfDrpPkts"                       ""                       ""                       "Te tunnel ID"                       "Te tunnel interface index"                       "Te tunnel interface name"                       "Te tunnel interface out bytes"                       !"Te tunnel interface out packets"                       #"Te tunnel interface out bandwidth"                       *"Te tunnel interface priority 0 out bytes"                       ,"Te tunnel interface priority 0 out packets"                       ."Te tunnel interface priority 0 out bandwidth"                       *"Te tunnel interface priority 1 out bytes"                       ,"Te tunnel interface priority 1 out packets"                       ."Te tunnel interface priority 1 out bandwidth"                       *"Te tunnel interface priority 2 out bytes"                       ,"Te tunnel interface priority 2 out packets"                       ."Te tunnel interface priority 2 out bandwidth"                       *"Te tunnel interface priority 3 out bytes"                       ,"Te tunnel interface priority 3 out packets"                       ."Te tunnel interface priority 3 out bandwidth"                       *"Te tunnel interface priority 4 out bytes"                       ,"Te tunnel interface priority 4 out packets"                       ."Te tunnel interface priority 4 out bandwidth"                       *"Te tunnel interface priority 5 out bytes"                       ,"Te tunnel interface priority 5 out packets"                       ."Te tunnel interface priority 5 out bandwidth"                       *"Te tunnel interface priority 6 out bytes"                       ,"Te tunnel interface priority 6 out packets"                       ."Te tunnel interface priority 6 out bandwidth"                       *"Te tunnel interface priority 7 out bytes"                       ,"Te tunnel interface priority 7 out packets"                       ."Te tunnel interface priority 7 out bandwidth"                       "Te tunnel interface in bytes"                        "Te tunnel interface in packets"                       &"Te tunnel interface in discard bytes"                       ("Te tunnel interface in discard packets"                       '"Te tunnel interface out discard bytes"                       )"Te tunnel interface out discard packets"                       7"Te tunnel interface reverse receiving bytes of Node-P"                       9"Te tunnel interface reverse receiving packets of Node-P"                       5"Te tunnel interface reverse sending bytes of Node-P"                       7"Te tunnel interface reverse sending packets of Node-P"                           U"Interface performance global switch,1(enable),0(disable),default
            is 1."                       +"Interface name for clear one minute peak."                       b"Clear all interface one minute peak,255 is valid,0 is invalid. 
            Value of read is 0."                       d"Interface name for clear performance value.Value of read is string
            which length is 0."                       c"Clear all interface performance value,255 is valid,0 is invalid.
            Value of read is 0."                       N"The interface rate count period.Rate period which is a multiple of 10 (sec)."                       ""                       ""                       "Interface name."                       k"Interface performance switch,1(enable).This config can be deleted
             by row status destroy(6)."                       m"Row status.active(1),notInService(2),notReady(3),createAndGo(4),
             createAndWait(5),destroy(6)."                       ""                       ""                       "Interface name."                       k"Interface performance switch,1(enable).This config can be deleted
             by row status destroy(6)."                       m"Row status.active(1),notInService(2),notReady(3),createAndGo(4),
             createAndWait(5),destroy(6)."                       ""                       ""                       ["Interface name.This must be blank when zxr10IfPerf1MinPeakAllIntf
             is valid."                       �"Clear all interface one minute peak,valid for all interface when 
             this item is 255 and zxr10IfPerf1MinPeakIfName is blank. If 
             zxr10IfPerf1MinPeakAllIntf is 0,only zxr10IfPerf1MinPeakIfName 
             is valid."                       \"One minute peak switch.This config can be deleted by row status 
             destroy(6)."                       m"Row status.active(1),notInService(2),notReady(3),createAndGo(4),
             createAndWait(5),destroy(6)."                       ""                       ""                       g"Interface name.This can set performance limit for physical 
             interface or son interface."                      $"Performance limit type.Value range of physical interface is from
             1 to 4.1 is InputRatio limit,2 is OutputRatio limit,3 is 
             FcserrCount limit,4 is FcserrRatio.Value range of son interface 
             is from 1 to 2.1 is InputRatio limit,2 is OutputRatio limit."                       �"Performance ratio low limit.Value range is from 0 to 99,default
             is 0.It can not be set when zxr10IfPerfLimitType is 3."                       �"Performance ratio high limit.Value range is from 1 to 100,default
             is 100.It can not be set when zxr10IfPerfLimitType is 3."                       �"Performance count low limit.Value range is from 0 to 4294967294.
             It can not be set when zxr10IfPerfLimitType is 1 or 2 or 4."                       �"Performance count high limit.Value range is from 1 to 4294967295.
             It can not be set when zxr10IfPerfLimitType is 1 or 2 or 4."                       m"Row status.active(1),notInService(2),notReady(3),createAndGo(4),
             createAndWait(5),destroy(6)."                       ""                       ""                       "Physical interface name."                       o"Performance limit type.Value range is from 1 to 2.1 is InputRatio
             limit,2 is OutputRatio limit."                       V"Performance ratio low limit.Value range is from 0 to 99,default 
             is 0."                       Y"Performance ratio high limit.Value range is from 1 to 100,default
             is 100."                       m"Row status.active(1),notInService(2),notReady(3),createAndGo(4),
             createAndWait(5),destroy(6)."                       ""                       ""                       "Interface name."                       $"IPv6 traffic receiving bytes rate."                       ""IPv6 traffic sending bytes rate."                       &"IPv6 traffic receiving package rate."                       $"IPv6 traffic sending package rate."                       1"IPv6 traffic receiving discarded package ratio."                       /"IPv6 traffic sending discarded package ratio."                       /"IPv6 traffic receiving bandwidth utilization."                       -"IPv6 traffic sending bandwidth utilization."                       "IPv6 traffic system up time."                       ""                       ""                       "Interface name."                       2"Receiving CRC errors ratio of hardware counters."                       0"Sending CRC errors ratio of hardware counters."                       ""                       ""                       "Interface name."                       "Wlan Bss interface in bytes."                        "Wlan Bss interface in packets."                       "Wlan Bss interface in Errors."                       &"Wlan Bss interface in drop counters."                       /"Wlan Bss interface in fifo overflow counters."                       &"Wlan Bss interface in drop counters."                       !"Wlan Bss interface out packets."                        "Wlan Bss interface out errors."                       '"Wlan Bss interface out drop counters."                       +"A list of GRE tunnel statistices entries."                       >"An entry containing statistices information of a GRE tunnel."                       "GRE tunnel name."                       "GRE tunnel in bytes."                       "GRE tunnel in packets."                       "GRE tunnel out bytes."                       "GRE tunnel out packets."                       "GRE tunnel in drop bytes."                       "GRE tunnel in drop packets."                       "GRE tunnel out drop bytes."                       "GRE tunnel out drop packets."                       %"PhySical Interface statistics Table"                       +"PhySical Interface statistics Table Entry"                       "Interface name"                       b"The total number of octets received on the interface,
            including framing characters."                       �"The number of packets, delivered by this sub-layer to a
            higher (sub-)layer, which were not addressed to a multicast
            or broadcast address at this sub-layer."                      0"The number of inbound packets which were chosen to be
            discarded even though no errors had been detected to prevent
            their being deliverable to a higher-layer protocol.  One
            possible reason for discarding such a packet could be to
            free up buffer space."                      �"For packet-oriented interfaces, the number of inbound
            packets that contained errors preventing them from being
            deliverable to a higher-layer protocol.  For character-
            oriented or fixed-length interfaces, the number of inbound
            transmission units that contained errors preventing them
            from being deliverable to a higher-layer protocol."                      3"For packet-oriented interfaces, the number of packets
            received via the interface which were discarded because of
            an unknown or unsupported protocol.  For character-oriented
            or fixed-length interfaces that support protocol
            multiplexing the number of transmission units received via
            the interface which were discarded because of an unknown or
            unsupported protocol.  For any interface that does not
            support protocol multiplexing, this counter will always be
            0."                       i"The total number of octets transmitted out of the
            interface, including framing characters."                       �"The total number of packets that higher-level protocols
            requested be transmitted, and which were not addressed to a
            multicast or broadcast address at this sub-layer, including
            those that were discarded or not sent."                      	"The number of outbound packets which were chosen to be
            discarded even though no errors had been detected to prevent
            their being transmitted.  One possible reason for discarding
            such a packet could be to free up buffer space."                      3"For packet-oriented interfaces, the number of outbound
            packets that could not be transmitted because of errors.
            For character-oriented or fixed-length interfaces, the
            number of outbound transmission units that could not be
            transmitted because of errors."                       $"IPv4/v6 Interface statistics Table"                       *"IPv4/v6 Interface statistics Table Entry"                       "Interface name"                       b"The total number of octets received on the interface,
            including framing characters."                       �"The number of packets, delivered by this sub-layer to a
            higher (sub-)layer, which were not addressed to a multicast
            or broadcast address at this sub-layer."                      0"The number of inbound packets which were chosen to be
            discarded even though no errors had been detected to prevent
            their being deliverable to a higher-layer protocol.  One
            possible reason for discarding such a packet could be to
            free up buffer space."                      �"For packet-oriented interfaces, the number of inbound
            packets that contained errors preventing them from being
            deliverable to a higher-layer protocol.  For character-
            oriented or fixed-length interfaces, the number of inbound
            transmission units that contained errors preventing them
            from being deliverable to a higher-layer protocol."                      3"For packet-oriented interfaces, the number of packets
            received via the interface which were discarded because of
            an unknown or unsupported protocol.  For character-oriented
            or fixed-length interfaces that support protocol
            multiplexing the number of transmission units received via
            the interface which were discarded because of an unknown or
            unsupported protocol.  For any interface that does not
            support protocol multiplexing, this counter will always be
            0."                       i"The total number of octets transmitted out of the
            interface, including framing characters."                       �"The total number of packets that higher-level protocols
            requested be transmitted, and which were not addressed to a
            multicast or broadcast address at this sub-layer, including
            those that were discarded or not sent."                      	"The number of outbound packets which were chosen to be
            discarded even though no errors had been detected to prevent
            their being transmitted.  One possible reason for discarding
            such a packet could be to free up buffer space."                      3"For packet-oriented interfaces, the number of outbound
            packets that could not be transmitted because of errors.
            For character-oriented or fixed-length interfaces, the
            number of outbound transmission units that could not be
            transmitted because of errors."                       '"No IPv4/v6 Interface statistics Table"                       -"No IPv4/v6 Interface statistics Table Entry"                       "Interface name"                       b"The total number of octets received on the interface,
            including framing characters."                       �"The number of packets, delivered by this sub-layer to a
            higher (sub-)layer, which were not addressed to a multicast
            or broadcast address at this sub-layer."                      0"The number of inbound packets which were chosen to be
            discarded even though no errors had been detected to prevent
            their being deliverable to a higher-layer protocol.  One
            possible reason for discarding such a packet could be to
            free up buffer space."                      �"For packet-oriented interfaces, the number of inbound
            packets that contained errors preventing them from being
            deliverable to a higher-layer protocol.  For character-
            oriented or fixed-length interfaces, the number of inbound
            transmission units that contained errors preventing them
            from being deliverable to a higher-layer protocol."                      3"For packet-oriented interfaces, the number of packets
            received via the interface which were discarded because of
            an unknown or unsupported protocol.  For character-oriented
            or fixed-length interfaces that support protocol
            multiplexing the number of transmission units received via
            the interface which were discarded because of an unknown or
            unsupported protocol.  For any interface that does not
            support protocol multiplexing, this counter will always be
            0."                       i"The total number of octets transmitted out of the
            interface, including framing characters."                       �"The total number of packets that higher-level protocols
            requested be transmitted, and which were not addressed to a
            multicast or broadcast address at this sub-layer, including
            those that were discarded or not sent."                      	"The number of outbound packets which were chosen to be
            discarded even though no errors had been detected to prevent
            their being transmitted.  One possible reason for discarding
            such a packet could be to free up buffer space."                      3"For packet-oriented interfaces, the number of outbound
            packets that could not be transmitted because of errors.
            For character-oriented or fixed-length interfaces, the
            number of outbound transmission units that could not be
            transmitted because of errors."                       "Interface RatioGather Table"                       #"Interface RatioGather Table Entry"                       "Interface name"                       +"Interface Received Ratio of Error Packets"                       '"Interface Sent Ratio of Error Packets"                       ."Interface Received Ratio of Discards Packets"                       *"Interface Sent Ratio of Discards Packets"                       +"Interface Utilization of Received Packets"                       '"Interface Utilization of Sent Packets"                       "Interface SpeedGather Table"                       #"Interface SpeedGather Table Entry"                       "Interface name"                       ""Interface Received Rate of Bytes"                       "Interface Sent Rate of Bytes"                       $"Interface Received Rate of Packets"                        "Interface Sent Rate of Packets"                       '"Interface Received Peak Rate of Bytes"                       ,"Interface Received Peak Rate Time of Bytes"                       #"Interface Sent Peak Rate of Bytes"                       ("Interface Sent Peak Rate Time of Bytes"                       !"Interface Received Rate of Bits"                       "Interface Sent Rate of Bits"                       -"A list of VxLan tunnel statistices entries."                       @"An entry containing statistices information of a VxLan tunnel."                       "VxLan Tunnel name."                       "VxLan Tunnel in bytes."                       "VxLan Tunnel in packets."                       "VxLan Tunnel out bytes."                       "VxLan Tunnel out packets."                       "VxLan Tunnel in drop bytes."                       "VxLan Tunnel in drop packets."                       "VxLan Tunnel out drop bytes."                        "VxLan Tunnel out drop packets."                       $"A list of Spi statistices entries."                       7"An entry containing statistices information of a spi."                       "Spi name."                       "Spi in bytes."                       "Spi in packets."                       "Spi in CRC-ERROR packets."                       "Spi out bytes."                       "Spi out packets."                       "Spi in drop packets."                       "Spi out drop packets."                       ="A list of interface rate statistices configuration entries."                       ?"An entry containing interface rate statistices configuration."                       "Interface name."                       T"Interface rate period. 
             Rate period which is a multiple of 10 (sec)."                       m"Row status.active(1),notInService(2),notReady(3),createAndGo(4),
             createAndWait(5),destroy(6)."                       -"A list of IPsec tunnel statistices entries."                       @"An entry containing statistices information of a IPsec tunnel."                       "IPsec tunnel name."                       "IPsec tunnel in bytes."                       "IPsec tunnel in packets."                       "IPsec tunnel out bytes."                       "IPsec tunnel out packets."                       "IPsec tunnel in drop bytes."                       "IPsec tunnel in drop packets."                       "IPsec tunnel out drop bytes."                        "IPsec tunnel out drop packets."                              