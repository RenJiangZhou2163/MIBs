K-- *****************************************************************
-- ZXROSNG-L2VPN-MIB.mib 
-- MPLS Layer 2 Virtual Private Networks MIB Definitions  
-- yaojie10102482
-- 2010-05-12
--
-- Copyright (c) 1985-2010 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
   "L2vpn PW Type. Assigned values are specified in 'IANA Allocations 
             for Pseudowire Edge to Edge Emulation (PWE3)"                                                     S"This MIB contains managed object definitions for the ZXROSng 
             L2vpn" �"ZTE Corporation
              Nanjing Institute of ZTE Corporation

              No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China

              Tel: +86-25-52870000" "201705221800Z" "201512231500Z" "201503031500Z" "201408181500Z" "201407101500Z" "201407011500Z" "201406191200Z" "201403311500Z" "201402281200Z" "201401211500Z" "201401091200Z" "201311221500Z" "201311141700Z" "201309171200Z" "201309041700Z" "201308021200Z" "201307151200Z" "201307091000Z" "201307021200Z" "201305221200Z" "201305071200Z" "201305031100Z" "201304161200Z" "201304031100Z"�"modify name, enum value and DEFVAL: 
                zxAcParaEtherL2cpAbm,
                zxAcParaEtherL2cpStp,
                zxAcParaEtherL2cpDot1x,
                zxAcParaEtherL2cpDot3x,
                zxAcParaEtherL2cpLacp,
                zxAcParaEtherL2cpGarp,
                zxAcParaEtherL2cpGmrp,
                zxAcParaEtherL2cpGvrp,
                zxAcParaEtherL2cpCisco,
                zxAcParaEtherL2cpDldp,
                zxAcParaEtherL2cpEfm,
                zxAcParaEtherL2cpCfm,
                zxAcParaEtherL2cpLldp,
                zxAcParaEtherL2cpPvst,
                zxAcParaEtherL2cpZdp
             add: 
                zxAcParaEtherL2cpErps,
                zxAcParaEtherL2cpUdld,
                zxAcParaEtherL2cpVtp,
                zxAcParaEtherL2cpZesr,
                zxAcParaEtherL2cpUserProtocolName,
                zxAcParaEtherL2cpUserProtocol
            " w"Obsolete leaf objects of zxVplsBgpADPwDetailsVplsID,
            zxVplsBgpADPwDetailsPwName and zxVplsBgpADRTVplsID.""Delete syntax value(acCoworker) of zxPwProtectBindInterChassis,
            zxPwProtectBindInterChassis.
            Obsolete leaf object zxPwProtectStrategyAcType.
            Add table objects for access PW protect group:
            zxAccessPwBindTable, zxAcCeSideTable."�"Add leaf objects for statistics:
            zxL2vpnVplsCount, zxL2vpnVpwsCount, zxL2vpnVlssCount,
            zxL2vpnMspwCount, zxL2vpnMaxVplsCount, zxL2vpnMaxVpwsCount.
            zxL2vpnMaxVlssCount, zxL2vpnMaxMspwCount, zxL2vpnPwCount,
            zxL2vpnMaxPwCount, zxL2vpnPwTrafficCount.
            Add table objects for VPWS-for-monitor and admin-VPLS:
            zxMonitorVpwsInstTable, zxAdminVplsInstTable." o"Modify description of zxAcParaIwfEtherRemoteMac and 
            zxAcParaEtherIngressAdjustDropTaggedFrames."x"Modify syntax of zxPwInstBindSplitHorizon:
            from {spokeOrVpws(0), hub(1)} to {spokeOrNull(0), hub(1)},
            Modify syntax of zxAcInstBindSplitHorizon:
            from {spokeOrVpws(0), hub(1)} to {serverOrNull(0), client(1)},
            Modify syntax of zxVplsBgpADPwDetailsHubOrSpoke:
            from {spokeOrVpws(0), hub(1)} to {spoke(0), hub(1)}." B"Add leaf objects for IPv6:
            zxPwObjectTunnelDstIpv6." �"Add leaf objects for NNI ping:
            zxAcParaEtherMonitorIp, zxAcParaEtherMonitorMac, 
            zxAcParaEtherMonitorMode.""Add leaf objects for L2CP packet filter:
            zxAcParaEtherDropWildcard, zxAcParaEtherDropAbm, 
            zxAcParaEtherDropStp, zxAcParaEtherDropDot1x, 
            zxAcParaEtherDropDot3x, zxAcParaEtherDropLacp,
            zxAcParaEtherDropGarp, zxAcParaEtherDropGmrp,
            zxAcParaEtherDropGvrp, zxAcParaEtherDropCisco,
            zxAcParaEtherDropDldp, zxAcParaEtherDropEfm,
            zxAcParaEtherDropCfm, zxAcParaEtherDropLldp,
            zxAcParaEtherDropPvst, zxAcParaEtherDropZdp." c"Change default value of zxAcParaMspwRmtTdmAal1Mode 
            from unstructured to structured." �"Because these oids have not been used, Change STATUS from current
             to deprecated:
            zxVplsBgpADPwDetailsVplsID, zxVplsBgpADRTVplsID." Y"Add leaf objects for terminaling status signal:
            zxMspwInstStatSigTerminal." v"Add leaf objects for split horizon scope:
            zxPwInstBindSplitHorizonScope, zxAcInstBindSplitHorizonScope."="Add leaf objects for threshhold of traffic statistics:
            zxStatisSwitchInstInUnknowBps, zxStatisSwitchInstInUnknowPps,
            zxStatisSwitchInstInBroadBps, zxStatisSwitchInstInBroadPps,
            zxStatisSwitchInstInDropBps, zxStatisSwitchInstInDropPps,
            zxPwObjectInUnknowBps, zxPwObjectInUnknowPps, zxPwObjectInBroadBps,
            zxPwObjectInBroadPps, zxPwObjectInDropBps, zxPwObjectInDropPps,
            zxAcParaEtherInUnknowBps, zxAcParaEtherInUnknowPps,
            zxAcParaEtherInBroadBps, zxAcParaEtherInBroadPps,
            zxAcParaEtherInDropBps, zxAcParaEtherInDropPps,
            zxAcParaTdmStatisEnStatus, zxAcParaTdmInUnknowBps,
            zxAcParaTdmInUnknowPps, zxAcParaTdmInBroadBps,
            zxAcParaTdmInBroadPps, zxAcParaTdmInDropBps, zxAcParaTdmInDropPps,
            zxAcParaIwfIPStatisEnStatus, zxAcParaIwfIPInUnknowBps,
            zxAcParaIwfIPInUnknowPps, zxAcParaIwfIPInBroadBps,
            zxAcParaIwfIPInBroadPps, zxAcParaIwfIPInDropBps,
            zxAcParaIwfIPInDropPps, zxAcParaIwfEtherStatisEnStatus,
            zxAcParaIwfEtherInUnknowBps, zxAcParaIwfEtherInUnknowPps,
            zxAcParaIwfEtherInBroadBps, zxAcParaIwfEtherInBroadPps,
            zxAcParaIwfEtherInDropBps, zxAcParaIwfEtherInDropPps,
            zxAcParaAtmStatisEnStatus, zxAcParaAtmInUnknowBps,
            zxAcParaAtmInUnknowPps, zxAcParaAtmInBroadBps,
            zxAcParaAtmInBroadPps, zxAcParaAtmInDropBps, zxAcParaAtmInDropPps,
            zxAcParaHdlcStatisEnStatus, zxAcParaHdlcInUnknowBps,
            zxAcParaHdlcInUnknowPps, zxAcParaHdlcInBroadBps,
            zxAcParaHdlcInBroadPps,zxAcParaHdlcInDropBps,zxAcParaHdlcInDropPps,
            zxAcParaPppStatisEnStatus, zxAcParaPppInUnknowBps,
            zxAcParaPppInUnknowPps, zxAcParaPppInBroadBps,
            zxAcParaPppInBroadPps, zxAcParaPppInDropBps, zxAcParaPppInDropPps,
            zxAcParaFrStatisEnStatus, zxAcParaFrInUnknowBps,
            zxAcParaFrInUnknowPps, zxAcParaFrInBroadBps,
            zxAcParaFrInBroadPps, zxAcParaFrInDropBps, zxAcParaFrInDropPps"�"Add leaf objects for PW pretending:
            zxPwObjectPwTypeReverse, zxPwObjectControlWordForce;
            Add leaf objects for CSF:
            zxPwObjectFrrIgnore, zxPwObjectOamMappingAbort;
            Add table\leaf objects for DNI-PW:
            zxPwProtectStrategyPattern, zxPwProtectStrategyAcType,
            zxPwProtectableGroupType, zxPwProtectableMcRole, 
            zxPwProtectMcSelectTable;
            Add table objects for PW list:
            zxPwListTable, zxPwListSlaveTable;
            Modify zxPwProtectBindInterChassis syntax for DNI-PW:
            from {local(1), interChassis(2)}
            to {local(1), interChassis(2),pwCoworker(3),acCoworker(4)}.""Add table\leaf objects for AC fault-spread:
            zxAcParaHdlcTable, zxAcParaPppTable, zxAcParaFrTable,
            zxAcParaEtherFaultSpread, zxAcParaTdmFaultSpread,
            zxAcParaIwfIPFaultSpread, zxAcParaIwfEtherFaultSpread,
            zxAcParaAtmFaultSpread." {"Modify syntax of all instance name objects:
            from DisplayString (SIZE(0..31)) to DisplayString (SIZE(0..32))." �"Modify syntax of zxPwStatusNegoedStatusSignalAbility:
            from INTEGER{osbit(1),fsbit(2),rssbit(3),none(4)} to 
            INTEGER{osbit(1),pfsbit(2),rssbit(3),none(4)}." E"Add table object for ATM emulation :
            zxAcParaAtmTable." �"Add leaf objects for PW rate limit:
            zxPwObjectLimitMode, zxPwObjectLimitCIR, zxPwObjectLimitCBS,
            zxPwObjectLimitPIR, zxPwObjectLimitPBS.""Add table objects : zxAcParaMspwRmtTable,zxVplsKempollaADTable,
            zxVplsKempollaADRTTable, zxVplsKempollaADVETable;
            Add leaf objects : zxMspwInstCwConflict,zxVplsInstDsMode,
            zxVplsInstServiceClass,zxVplsInstColour,zxVpwsInstDsMode,
            zxVpwsInstServiceClass,zxVpwsInstColour,zxPwObjectVccvStaticCC,
            zxPwObjectCwLBit,zxPwObjectSdEnStatus,zxPwProtectBindDistance,
            zxPwProtectablePfsAdvertise,zxPwTemplateVccvStaticCC,
            zxAcParaTdmTimeSlotCompatible." �"Delete all RowStatus objects,because the project does not
             request the create operation and ZXROSNG-L2VPN-MIB tables nodes
             with read-only attributes can't pass the MIB tool check."]"Add table objects : zxStatisSwitchInstTable,zxPwProtectIccpTable;
            Add leaf objects : zxPwObjectStatisEnStatus,zxPwObjectInBRateLow,
            zxPwObjectInBRateHigh,zxPwObjectOutBRateLow,zxPwObjectOutBRateHigh,
            zxPwProtectBindInterChassis,zxAcParaEtherStatisEnStatus;
            Modify leaf object : zxAcInstBindType." '"Add objects for default control-word."                   &" The enable status of L2VPN service."                       1" The enable status of L2VPN service statistics."                       +"The numbers of configured VPLS instances."                       +"The numbers of configured VPWS instances."                       +"The numbers of configured VLSS instances."                       +"The numbers of configured MSPW instances."                       2"The maximum numbers of supported VPLS instances."                       2"The maximum numbers of supported VPWS instances."                       2"The maximum numbers of supported VLSS instances."                       2"The maximum numbers of supported MSPW instances."                        "The numbers of configured PWs."                       '"The maximum numbers of supported PWs."                       :"The numbers of PWs whose traffic statistics are enabled."                           _"MSPW instance Table. This table contains
                 one entry per MSPW instance table."                       5"The parameter of a MSPW instance entity containing "                        "The name of the MSPW instance."                       #"The PW type of the MSPW instance."                       '"The description of the MSPW instance."                       )"The enable status of the MSPW instance."                       ]"The enable status of control-word conflict function of the 
                MSPW instance."                       a"The enable status of terminaling status signal function of 
                the MSPW instance."                       _"VPLS instance Table. This table contains
                 one entry per VPLS instance table."                       5"The parameter of a VPLS instance entity containing "                        "The name of the VPLS instance."                       *"The qualified flag of the VPLS instance."                       ("The default VCID of the VPLS instance."                       3"The mac-withdraw capability of the VPLS instance."                       %"The MTU value of the VPLS instance."                       '"The description of the VPLS instance."                       )"The enable status of the VPLS instance."                       -"The VPLS id of BGP auto-discovery instance."                       ;"The default control-word capability of the VPLS instance."                       ,"The QoS service mode of the VPLS instance."                       -"The QoS service class of the VPLS instance."                       -"The QoS packet colour of the VPLS instance."                       _"VPWS instance Table. This table contains
                 one entry per VPWS instance table."                       5"The parameter of a VPWS instance entity containing "                        "The name of the VPWS instance."                       %"The MTU value of the VPWS instance."                       '"The description of the VPWS instance."                       )"The enable status of the VPWS instance."                       ;"The default control-word capability of the VPWS instance."                       ,"The QoS service mode of the VPWS instance."                       -"The QoS service class of the VPWS instance."                       -"The QoS packet colour of the VPWS instance."                       _"VLSS instance Table. This table contains
                 one entry per VLSS instance table."                       5"The parameter of a VLSS instance entity containing "                        "The name of the VLSS instance."                       '"The description of the VLSS instance."                       )"The enable status of the VLSS instance."                       g"Statistics switch instance Table. This table contains
                 one entry per instance table."                       T"The parameter of a statistics switch instance entity 
                containing."                       "The name of the instance."                       "The VPN type of the instance."                       8"The enable status of the instance's statistics switch."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       w"VPWS-for-monitor instance Table. This table contains
                 one entry per VPWS-for-monitor instance table."                       S"The parameter of a VPWS-for-monitor instance entity 
                containing."                       ,"The name of the VPWS-for-monitor instance."                       3"The description of the VPWS-for-monitor instance."                       k"Admin-VPLS instance Table. This table contains
                 one entry per admin-VPLS instance table."                       <"The parameter of an admin-VPLS instance entity containing."                       &"The name of the admin-VPLS instance."                       -"The description of the admin-VPLS instance."                           S"PW bind Table. This table contains
                 one entry per PW bind table."                       /"The parameter of a PW bind entity containing "                       '"The name of the instance in the bind."                       !"The name of the PW in the bind."                       ("The split horizon flag of the PW bind."                       )"The split horizon scope of the PW bind."                       W"PW object Table. This table contains
                 one entry per PW object table."                       1"The parameter of a PW object entity containing "                       :"The name of the instance which the PW object belongs to."                       "The name of the PW object."                       )"The master/slave role of the PW object."                       0"The remote peer's IP address of the PW object."                       "The VCID of the PW object."                       "The PW type of the PW object."                       /"The control-word capability of the PW object."                       &"The BFD capability of the PW object."                       8"The BFD raw encapsulation capability of the PW object."                       4"The BFD signal status capability of the PW object."                       #"The signal type of the PW object."                       #"The local label of the PW object."                       $"The remote label of the PW object."                       6"The name of tunnel policy that bind to the PW object"                        "The group ID of the PW object."                       1"The name of PW class that bind to the PW object"                       5"The name of track object that bind to the PW object"                       '"The bandwidth value of the PW object."                       %"The enable status of the PW object."                       0"The extend VCID for 129 type of the PW object."                       $"The remote pw ID of the PW object."                       2"The Committed Burst Size value of the PW object."                       3"The Peak Information Rate value of the PW object."                       /"The Excess Burst Size value of the PW object."                       1"The enable status of the PW traffic statistics."                       5"The low threshold of warnning for input bytes rate."                       6"The high threshold of warnning for input bytes rate."                       6"The low threshold of warnning for output bytes rate."                       7"The high threshold of warnning for output bytes rate."                       -"The static VCCV's CC type of the PW object."                       5"The control-word L-bit capability of the PW object."                       ."The enable status  of the PW SD propagation."                       "The mode of PW rate limit."                       ^"The Committed Information Rate value of PW rate limit. 
                Invalid value is 0."                       X"The Committed Burst Size value of PW rate limit. Invalid 
                value is 0."                       Y"The Peak Information Rate value of PW rate limit. Invalid 
                value is 0."                       S"The Peak Burst Size value of PW rate limit. Invalid value is 
                0."                       ."The reversing PW type flag of the PW object."                       4"The force control word parameter of the PW object."                       ,"The Flag of ignoring FRR of the PW object."                       4"The Flag of aborting OAM mapping of the PW object."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       )"The IPv6 address of tunnel destination."                       c"PW protect bind Table. This table contains
                 one entry per PW protect bind table."                       7"The parameter of a PW protect bind entity containing "                       '"The name of the instance in the bind."                       +"The name of the protected PW in the bind."                       )"The name of the protect PW in the bind."                       0"The inter-chassis flag of the PW protect bind."                       ;"The distance between back-up PW and protected PW-segment."                       k"PW protect strategy Table. This table contains
                 one entry per PW protect strategy table."                       ;"The parameter of a PW protect strategy entity containing "                       h"The name of the instance of the PW which is configured with 
                the PW protect strategy."                       X"The name of the PW which is configured with the PW protect 
                strategy."                       ."The protect type of the PW protect strategy."                       2"The protect strategy of the PW protect strategy."                       5"The protected direction of the PW protect strategy."                       4"The protected receiver of the PW protect strategy."                       1"The protect pattern of the PW protect strategy."                       1"The AC protect type of the PW protect strategy."                       a"PW protectable Table. This table contains
                 one entry per PW protectable table."                       6"The parameter of a PW protectable entity containing "                       c"The name of the instance of the PW which is configured with 
                the PW protectable."                       S"The name of the PW which is configured with the PW 
                protectable."                       -"The negotiation type of the PW protectable."                       +"The advertise type of the PW protectable."                       /"The protect group type of the PW protectable."                       /"The multi-chassis role of the PW protectable."                       ["PW template Table. This table contains
                 one entry per PW template table."                       3"The parameter of a PW template entity containing "                       "The name of the PW template."                       1"The control-word capability of the PW template."                       :"The control-word sequence capability of the PW template."                       ("The BFD capability of the PW template."                       :"The BFD raw encapsulation capability of the PW template."                       6"The BFD signal status capability of the PW template."                       5"The keep ingress tag capability of the PW template."                       0"The static VCCV's CC type of  the PW template."                       c"PW ICCP protect Table. This table contains
                 one entry per PW ICCP protect table."                       7"The parameter of a PW ICCP protect entity containing "                       d"The name of the instance of the PW which is configured with 
                the PW ICCP protect."                       T"The name of the PW which is configured with the PW ICCP 
                protect."                       &"The group ID of the PW ICCP protect."                       ("The group ROID of the PW ICCP protect."                       s"PW MC selection protect Table. This table contains
                 one entry per PW MC selection protect table."                       ?"The parameter of a PW MC selection protect entity containing "                       l"The name of the instance of the PW which is configured with 
                the PW MC selection protect."                       \"The name of the PW which is configured with the PW MC 
                selection protect."                       *"The type of the PW MC selection protect."                       S"PW list Table. This table contains one entry per PW list 
                table."                       /"The parameter of a PW list entity containing "                       "The PW list ID of the object."                       ?"The name of the master PW which is configured in the PW list."                       ]"PW list slave PW Table. This table contains one entry per 
                slave PW table."                       8"The parameter of a PW list slave PW entity containing "                       "The PW list ID of the object."                       >"The name of the slave PW which is configured in the PW list."                       c"AC protect bind Table. This table contains one entry per AC 
                protect bind table."                       7"The parameter of a AC protect bind entity containing "                       '"The name of the instance in the bind."                       ,"The name of the redirected PW in the bind."                       ("The name of the access PW in the bind."                       S"CE side Table. This table contains one entry per CE side 
                table."                       /"The parameter of a CE side entity containing "                       0"The name of the instance in the CE side entry."                       5"The name of the redirected PW in the CE side entry."                       1"The name of the access PW in the CE side entry."                       +"The AC protect type of the CE side entry."                           S"AC bind Table. This table contains
                 one entry per AC bind table."                       /"The parameter of a AC bind entity containing "                       '"The name of the instance in the bind."                       !"The name of the AC in the bind."                       ,"The interface index of the AC in the bind."                       %"The split horizon flag of the bind."                       "The Access type of the bind."                       &"The split horizon scope of the bind."                       ["AC ethernet Table. This table contains
                 one entry per AC ethernet table."                       3"The parameter of a AC ethernet entity containing "                       5"The name of the instance in the ethernet parameter."                       /"The name of the AC in the ethernet parameter."                       9"The ingress adjust push flag of the ethernet parameter."                       <"The ingress adjust rewrite flag of the ethernet parameter."                       ?"The ingress adjust rewrite VLAN ID of the ethernet parameter."                       <"The ingress adjust push VLAN ID of the ethernet parameter."                       )"The group ID of the ethernet parameter."                       <"The ingress tag as payload flag of the ethernet parameter."                       o"The ingress adjust drop tagged frames flag of the ethernet 
                parameter. Invalid value is 254."                       4"The name of the track object which bind to the AC."                       )"The lst flag of the ethernet parameter."                       1"The oam-mapping flag of the ethernet parameter."                       U"The enable status of the ethernet parameter's traffic 
                statistics."                       4"The flag of the ethernet parameter's fault-spread."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       *"The L2 protocol filter for wildcard MAC."                       U"The L2 protocol filter for all bridge multicast protocol 
                packets."                       2"The L2 protocol filter for STP protocol packets."                       5"The L2 protocol filter for 802.1x protocol packets."                       5"The L2 protocol filter for 802.3x protocol packets."                       3"The L2 protocol filter for LACP protocol packets."                       3"The L2 protocol filter for GARP protocol packets."                       3"The L2 protocol filter for GMRP protocol packets."                       3"The L2 protocol filter for GVRP protocol packets."                       4"The L2 protocol filter for CISCO protocol packets."                       3"The L2 protocol filter for DLDP protocol packets."                       2"The L2 protocol filter for EFM protocol packets."                       2"The L2 protocol filter for CFM protocol packets."                       3"The L2 protocol filter for LLDP protocol packets."                       3"The L2 protocol filter for PVST protocol packets."                       2"The L2 protocol filter for ZDP protocol packets."                       "The monitor IP of NNI ping."                       "The monitor MAC of NNI ping."                       "The monitor mode of NNI ping."                       3"The L2 protocol filter for ERPS protocol packets."                       3"The L2 protocol filter for UDLD protocol packets."                       2"The L2 protocol filter for VTP protocol packets."                       3"The L2 protocol filter for ZESR protocol packets."                       0"The L2 protocol filter for user protocol name."                       3"The L2 protocol filter for user protocol packets."                       Q"AC TDM Table. This table contains
                 one entry per AC TDM table."                       ."The parameter of a AC TDM entity containing "                       '"The name of the instance in the bind."                       !"The name of the AC in the bind."                       Z"The distribute period value of the TDM parameter. 
                Invalid value is 254"                       )"The cas used flag of the TDM parameter."                       /"The jitter buffer value of the TDM parameter."                       0"The RTP header used flag of the TDM parameter."                       ."The RTP timestamp mode of the TDM parameter."                       4"The name of the track object which bind to the AC."                       *"The structure type of the TDM parameter."                       +"The idle code value of the TDM parameter."                       ,"The oam-mapping flag of the TDM parameter."                       4"The timeslot compatible mode of the TDM parameter."                       /"The flag of the TDM parameter's fault-spread."                       >"The enable status of the TDM parameter's traffic statistics."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       k"AC IP inter-working Table. This table contains
                 one entry per AC IP inter-working table."                       ;"The parameter of a AC IP inter-working entity containing "                       '"The name of the instance in the bind."                       !"The name of the AC in the bind."                       ="The local CE MAC address of the IP inter-working parameter."                       4"The name of the track object which bind to the AC."                       9"The oam-mapping flag of the IP inter-working parameter."                       <"The local CE IP address of the IP inter-working parameter."                       <"The flag of the IP inter-working parameter's fault-spread."                       ]"The enable status of the IP inter-working parameter's traffic
                 statistics."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       S"AC bind Table. This table contains
                 one entry per AC bind table."                       /"The parameter of a AC bind entity containing "                       '"The name of the instance in the bind."                       !"The name of the AC in the bind."                       R"The proxy MAC address of the ethernet inter-working 
                parameter."                       T"The local CE IP address of the ethernet inter-working 
                parameter."                       U"The remote CE IP address of the ethernet inter-working 
                parameter."                       S"The remote MAC address of the ethernet inter-working 
                parameter."                       h"The service VLAN ID of the ethernet inter-working parameter. 
                Invalid value is 65534."                       T"The flag of the ethernet inter-working parameter's 
                fault-spread."                       c"The enable status of the ethernet inter-working parameter's 
                traffic statistics."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       w"MSPW remote AC parameters Table. This table contains
                 one entry per MSPW remote AC parameters Table."                       S"The parameter of a MSPW remote AC parameters entity 
                containing."                        "The name of the MSPW instance."                       :"Interface description of the remote interface parameter."                       2"The MTU value of the remote interface parameter."                       7"Fragmentation flag of the remote interface parameter."                       e"Frame check sequence retention head length flag of the remote
                interface parameter."                       Y"The maximum of ATM cell concatenate of the remote interface
                parameter."                       ="Ethernet request VLAN ID of the remote interface parameter."                       :"FR DLCI header length of the remote interface parameter."                       9"TDM time slots count of the remote interface parameter."                       :"TDM distribute period of the remote interface parameter."                       ="The RTP header used flag of the remote interface parameter."                       ^"The RTP differential timestamp mode flag of the remote
                interface parameter."                       X"The RTP synchronization source ID of the remote interface 
                parameter."                       6"The RTP frequency of the remote interface parameter."                       5"TDM payload type of the remote interface parameter."                       7"TDM CAS trunk type of the remote interface parameter."                       R"TDM signalling packets type of the remote interface 
                parameter."                       ["TDM CEP DBA trigger event of AIS flag of the remote interface
                parameter."                       ]"TDM CEP DBA trigger evnent of UNE flag of the remote 
                interface parameter."                       5"TDM CEP EMB flag of the remote interface parameter."                       b"TDM CEP Async E3/T3 bandwidth reduction type of the remote
                interface parameter."                       <"TDM CEP connection type of the remote interface parameter."                       ="TDM AAL1 cell per packet of the remote interface parameter."                       2"TDM AAL1 mode of the remote interface parameter."                       :"TDM AAL2 max duration of the remote interface parameter."                       6"TDM AAL2 VAD mode of the remote interface parameter."                       >"AC ATM Table.This table contains one entry per AC ATM table."                       ."The parameter of a AC ATM entity containing."                       '"The name of the instance in the bind."                       !"The name of the AC in the bind."                       >"The maximum of ATM cell concatenate of the AC ATM parameter."                       /"The flag of the ATM parameter's fault-spread."                       S"The enable status of the AC ATM parameter's traffic 
                statistics."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       R"AC HDLC Table.This table contains one entry per AC HDLC 
                table."                       /"The parameter of a AC HDLC entity containing."                       '"The name of the instance in the bind."                       !"The name of the AC in the bind."                       0"The flag of the HDLC parameter's fault-spread."                       T"The enable status of the AC HDLC parameter's traffic 
                statistics."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       >"AC PPP Table.This table contains one entry per AC PPP table."                       ."The parameter of a AC PPP entity containing."                       '"The name of the instance in the bind."                       !"The name of the AC in the bind."                       /"The flag of the PPP parameter's fault-spread."                       S"The enable status of the AC PPP parameter's traffic 
                statistics."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                       <"AC FR Table.This table contains one entry per AC FR table."                       -"The parameter of a AC FR entity containing."                       '"The name of the instance in the bind."                       !"The name of the AC in the bind."                       ."The flag of the FR parameter's fault-spread."                       R"The enable status of the AC FR parameter's traffic 
                statistics."                       S"The threshold of warnning for input unknown unicast bytes 
                rate."                       U"The threshold of warnning for input unknown unicast packets 
                rate."                       ;"The threshold of warnning for input broadcast bytes rate."                       ="The threshold of warnning for input broadcast packets rate."                       9"The threshold of warnning for input dropped bytes rate."                       ;"The threshold of warnning for input dropped packets rate."                           "Vpls auto-discovery Table."                       1"The parameter of a Vpls auto-discovery details "                       %"The name of the VPLS instance name."                       !"The type of the auto-discovery."                       $"The IP address of remote endpoint."                       #"The domain ID of remote endpoint."                       %"The instnace ID of remote endpoint."                       "The Vpls ID of the instance."                       +"The encapulation type ID of the auto-PW ."                       )"The tunnel policy name of the auto-PW ."                       ."The control-word capability of the auto-PW ."                       $"The template name of the auto-PW ."                       %"The interface name of the auto-PW ."                       *"The life span attribute of the auto-PW ."                       ("The horizen attribute of the auto-PW ."                       %"The BFD capability of the auto-PW ."                       7"The BFD raw encapsulation capability of the auto-PW ."                       3"The BFD signal status capability of the auto-PW ."                       "Vpls auto-discovery Table."                       6"The parameter of a Vpls auto-discovery route target "                       %"The name of the VPLS instance name."                       !"The type of the auto-discovery."                       "The route target parameter."                       ""The route target type parameter."                       "The Vpls ID of the instance."                       9"VPLS kempolla auto-discovery route distinguisher table."                       W"The parameter of a VPLS kempolla auto-discovery route
                distinguisher."                       %"The name of the VPLS instance name."                       $"The route distinguisher parameter."                       7"The VE ID value parameter.The invalid value is 65535."                        "The style of VE set parameter."                       W"The maximum VE ID value parameter. The invalid value is 
                4294967295."                       &"The name of tunnel policy parameter."                       2"VPLS kempolla auto-discovery route target table."                       ="The parameter of VPLS kempolla auto-discovery route target."                       %"The name of the VPLS instance name."                       "The route target parameter."                       ""The route target type parameter."                       2"VPLS kempolla auto-discovery route target table."                       ="The parameter of VPLS kempolla auto-discovery route target."                       %"The name of the VPLS instance name."                       %"The begin value of the VE ID block."                       !"The end value of the VE ID set."                           J"PW status Table. This table contains
                 one entry per PW."                       1"The parameter of a PW status entity containing "                       "The name of the PW."                       "The signal type of the PW."                        "The PSN tunnel type of the PW."                       '"The PSN tunnel policy name of the PW."                       $"The PSN out label depth of the PW."                        "The PSN out label 1 of the PW."                        "The PSN out label 2 of the PW."                        "The PSN out label 3 of the PW."                       "The service state of the PW."                       "The work state of the PW."                       "The local label of the PW."                       "The remote label of the PW."                       "The local group id of the PW."                       +"The local control word ability of the PW."                        "The local MTU value of the PW."                       ""The local description of the PW."                       "The local status of the PW."                       ,"The local status signal ability of the PW."                        "The remote group id of the PW."                       ,"The remote control word ability of the PW."                       !"The remote MTU value of the PW."                       #"The remote description of the PW."                       "The remote status of the PW."                       -"The remote status signal ability of the PW."                       1"The negotiatied control word ability of the PW."                       &"The negotiatied MTU value of the PW."                       2"The negotiatied status signal ability of the PW."                       *"The PW's signal state on protocol level."                       !"The local VCCV value of the PW."                       ""The remote VCCV value of the PW."                       '"The negotiatied VCCV value of the PW."                       "PSN tunnel ID."                       $"The name of the PSN out interface."                                                  