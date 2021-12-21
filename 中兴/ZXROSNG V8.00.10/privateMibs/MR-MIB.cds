                                                                               -"The MIB module to describe the MR protocol." ["Xu benchong
               Tel: 025-698109
               E-Mail:xu.benchong@zte.com.cn" "201811151500Z" "201808131500Z" "201706051500Z" "201702281500Z" "201701181000Z" "201701061000Z" "201612021000Z" "201603181500Z" "201601081100Z" "201512181500Z" "201512111500Z" "201511201400Z" "201509231000Z" "201508281100Z" "201507071100Z" "201506241000Z" "201506201400Z" "201506011000Z" "201503201000Z" "201503091400Z" "201503021500Z" "201502281000Z" "201410101000Z" "201409011400Z" "201408261100Z" "201407221100Z" "201406181600Z" "201403131000Z" "201402211400Z" "201401211400Z" "201401081700Z" "201312031700Z" "201310121400Z" "201308011530Z" "201307181530Z" "201307161400Z" "201306081400Z" "201305211400Z" "201305131400Z" "201304031400Z" "201102090000Z" "add: zxr10MrSmdmTable" U"add: zxr10mvpnInstSubDomainId,
				      the syntax of zxr10mvpnInstProviderTunnel" $"add: zxr10mrInstanceNeverSwitchAcl" ^"add: zxr10mrInstanceSwitchThreshold
                      zxr10mrInstanceSwitchThresholdAcl" "add: zxr10nexthopTrackName" &"add: zxr10pimsmIntfHelloTrackSupport" �"add: zxr10mrInstanceBgpInterAs,
                      zxr10mrInstanceBgpSegmented,
                      zxr10mrInstanceSwitchInterval,
                      zxr10mrSegBorderTable" &"add: zxr10pimsmInstStatisticsAclName" "add: zxr10peerKeychain" M"add: zxr10mstaticRouteIncMask
                      zxr10mstaticRouteCount" T"add: zxr10nexthopFallbackGlobal
                      zxr10nexthopFallbackVrfName" �"modify:the description of zxr10mrInstanceRpfProxyVector
                 add: zxr10mrInstanceRpfProxyMbgpAcl
                      zxr10mrInstanceMrouteLimitInst" "add: zxr10pimsmInstPimdmReg" �"add: zxr10mstaticRoutePermanent,
                      zxr10mstaticRouteSlaveIifName,
                      zxr10mstaticRouteTrackName,
                      zxr10mstaticRouteSlaveTrackName,
                      zxr10mstaticFrrTable" �"modify: the ranges of zxr10mstaticLimitXgLimit 
                 and zxr10mstaticLimitSgLimit are both 0-2048,
                 the max values get from performance parameter." Y"modify:zxr10igmpGroupTable is obsolete
                 add:zxr10igmpStaticGroupTable "  "add: zxr10pimsmIntfHelloDrAddr" �"add: zxr10pimsmInstCbsrHoldtime,
                      zxr10pimsmInstCbsrInterval,
                      zxr10pimsmCrpHoldtime"Q"add: zxr10pimsmInstJpSpeed
                      zxr10pimsmInstKeepAlivePeriod
                      zxr10pimsmInstAssertHoldTime
                      zxr10pimsmInstGraftTime
                      zxr10pimsmIntfPropagationDelay
                      zxr10pimsmIntfOverrideInterval
                      zxr10pimsmIntfJpMaxpktLen""add: zxr10msdpInstanceSaAdvTime,
                      zxr10msdpInstanceSaCacheTimeout,
                      zxr10peerHoldtime,
                      zxr10peerKeepaliveTime,
                      zxr10peerReconnectTime,
                      zxr10peerInactiveTime" _"modify: the status of zxr10mstaticOifIndexVlanMin and zxr10mstaticOifIndexVlanMax is obsolete" "add: zxr10nexthopNextHopSlave" �"add: zxr10pimsmInterfaceFrrEn
                      zxr10pimsmInstMldpSignalEn
                      zxr10pimsmInstMldpSignalAclName" �"modify:range of zxr10mrInstanceMultipathSghash is 
                {none(0),sbased(1),sgbasic(2),sgnexthopbased(3),sgbalance(4)}" n"modify: the range of zxr10mrInstanceDownstreamLimit is 0-1024, the max value gets from performance parameter" @"modify: the status of zxr10mdtDataMdtDataThreshold is obsolete" �"modify: range of zxr10mrInstanceTosValue is (0..63|255),
                     DESCRIPTION of zxr10mrMonitorRouteMrMoniterSource,
                     range of zxr10pimsmInstDrSwitchDelayValue is (0..300)" �"add: zxr10mrInstanceMdtAutoDiscovery,
                      zxr10mdtDefaultMdtRootAddr,
                      zxr10mdtDataMdtDataNumTree"�"modify: DESCRIPTION of some nodes,
                     range of zxr10mrInstanceSearchMode is (0..1),
                     range of zxr10pimsmInstDrSwitchDelayValue is (1..300),
                     range of zxr10pimsmInstMofrrAclName is (0..30),
                     range of zxr10mrTtlNum is (1..255),
                     leaf node order of zxr10pimBindTable, 
                     zxr10pimBindGroupName and zxr10pimBindIntfName" !"add: zxr10pimsmInstMofrrAclName" }"modify: range of zxr10pimsmInstJpInterval is (10..6000),
                         DESCRIPTION of zxr10igmpIntfImmediateAll" $"add: zxr10mrInstanceRpfProxyVector" Q"add: zxr10pimsmInstJpInterval 
                      zxr10pimsmInstRegHoldtime" Q"add: zxr10igmpIntfIpSourceCheck
                      zxr10igmpGroupLimitTable" w"add: zxr10pimsmInstBidirPim
                      zxr10pimsmCrpBidirPim
                      zxr10pimsmSrpBidirPim"g"modify:range of zxr10mrInstanceMrouteLimit is (0..131070),
                        range of zxr10mrInstanceDownstreamLimit is (0..64)
                        range of zxr10mrInstanceMultipathSghash is {none(0),sbased(1),sgbasic(2),sgnexthopbased(3)}
                        range of zxr10mstaticInstMstaticFlag is (0..1)                
                " �"modify:the size from SIZE (0..32) to SIZE (0..31),
                        including of zxr10pimGroupName
                        zxr10pimBindGroupName                
                "�"modify:the data type of enumeration is converted from Unsigned32 to INTEGER, 
                        including of zxr10mrInstanceMultipathSghash
                        zxr10pimBindIntfActive
                        zxr10pimBindIntfPassive
                        zxr10igmpIntfVersion
                        zxr10igmpGroupStaticFlag
                        zxr10igmpGroupFilterMode
                        zxr10mvpnInstProviderTunnel
                        zxr10mrFilterInterfaceMode
                        zxr10mrFilterInterfaceType
                        zxr10mrFilterMrouteInterfaceType
                        zxr10mrFilterMrouteModeType
                        zxr10mrForwordingPolicyType ,and hyphen of node is deleted,
                        including of zxr10mrInstanceMultipathSghash
                        zxr10safilterinTable
                        zxr10safilteroutTable
                        zxr10mvpnInstProviderTunnel          
                        " P"modify:zxr10pimBindIntfActive
                        zxr10pimBindIntfPassive" �"add: zxr10pimBindTable
                      zxr10pimBindTable
                 modify:zxr10mrFilterInterfaceIntfname
                        zxr10mrFilterMrouteInterfaceIntfname" %"Initial version of this MIB module."                   "A table to MR instance"                       "An entry to MR instance"                       
"vrf name"                       "mroute limit"                       
"nsf time"                       A"downstream limit, the max value gets from performance parameter"                       "multipath based sg-hash"                       "multicast search mode"                       !"longest match of lookup unicast"                        "static first of lookup unicast"                       ("tos value of multicast protocol packet"                       "damping enable"                       "damping threshold"                       "RPF proxy vector for MDT"                       "mdt auto discovery"                       $"RPF proxy vector ACL name for MBGP"                       W"mroute limit for instance, the max value gets
            from performance parameter"                       &"BGP auto-discovery of inter-AS MVPN."                       ,"BGP auto-discovery of segmented multicast."                       ""MVPN tunnel switchover interval."                       #"MVPN tunnel switchover threshold."                        "ACL for MVPN tunnel switchover"                       /"ACL for MVPN tunnel never switch to data tree"                           "A table to mstatic instance"                       "An entry to mstatic instance"                       
"vrf name"                       "enable mstatic flag"                       "A table to mstatic oif"                       "An entry to mstatic oif"                       
"vrf name"                       "interface name"                       "oif index"                       
"vlan min"                       
"vlan max"                            "A table to mstatic route limit"                       !"An entry to mstatic route limit"                       
"vrf name"                       :"xg limit, the max value gets from performance parameter."                       :"sg limit, the max value gets from performance parameter."                       "A table to mstatic route"                       "An entry to mstatic route"                       
"vrf name"                       "group address"                       "source address"                       "iif interface name"                       "oif interface name"                       "permanent"                       "slave iif interface name"                       "track name"                       "slave track name"                       )"Increment mask of MSTATIC group address"                       '"The number of MSTATIC group addresses"                       !"A table to mstatic fast reroute"                       ""An entry to mstatic fast reroute"                       
"vrf name"                       "wait to restore"                       "A table to multicast nexthop"                       "An entry to multicast nexthop"                       
"vrf name"                       "interface name"                       "ip address"                       "ip address mask"                       "nexthop address"                       "nexthop slave"                       )"the global instance of nexthop fallback"                       ""the VRF name of nexthop fallback"                       "nexthop track name"                       "A table to monitor route"                       "An entry to monitor route"                       
"vrf name"                       "monitor interface"                       "monitor source"                       "group address"                       "A table to data mdt"                       "An entry to data mdt"                       
"vrf name"                       "mdt ACL name"                       "mdt group"                       "mdt group mask"                       "mdt switch threshold"                       "mdt number tree"                       "A table to default mdt"                       "An entry to default mdt"                       
"vrf name"                       "default mdt group"                       "root addr"                       "A table to monitor interface"                       "An entry to monitor interface"                       
"vrf name"                       "interface name"                           "A table to PIMSM instance"                       "An entry to PIMSM instance"                       
"vrf name"                       "enable PIMSM"                       "enable static RP override"                       "enable static RP smart switch"                       "unicast bsm"                       "enable SSM"                       "ssm default group"                       -"dr switch delay value in case of bfd enable"                       "ssm data ACL name"                       "accept RP ACL name"                       !"register packet filter ACL name"                       "PIM source filter ACL name"                       "J/P packet hold time"                       
"RP proxy"                       "register probe interval"                       "register suppression interval"                       "bidir PIM"                       "J/P packet interval"                       ;"Register hold time without receiving register stop packet"                       "mofrr ACL name"                       "PIM mldp signal enable"                       "PIM mldp signal ACL name"                       "PIM Join/Prune speed"                       "PIM keepalive period"                       "PIM assert holdtime"                       "PIM graft retry time"                       "C-BSR holdtime"                       "C-BSR interval"                       e"Send register packets when the PIM-DM interface receives 
             indirectly connected stream"                        "PIM packet statistics ACL name"                       "A table to PIMSM interface"                       "An entry to PIMSM interface"                       
"vrf name"                       "interface name"                       "enable PIMSM"                       "assert disable"                       "enable BFD"                       "BSR border"                       "dr priority"                       "pimsm neighbour filter"                       "hello packet interval"                       "dense mode"                       "PIM silent"                       "dr ignore"                       "interface vrf name"                       "PIM frr enable"                       "propagation delay"                       "override interval"                       %"max length of PIM Join/Prune packet"                       -"PIM hello packet sent with hello DR address"                       #"PIM hello tracking support enable"                       "A table to BSR"                       "An entry to BSR"                       
"vrf name"                       "interface name"                       "BSR priority"                       "BSR hash mask length"                       "interface vrf name"                       "A table to candidate RP"                       "An entry to candidate RP"                       
"vrf name"                       "interface name"                       "candidate RP prefix list"                       "candidate RP priority"                       "interface vrf name"                       "candidate RP bidir"                       "candidate RP holdtime"                       "A table to static RP"                       "An entry to static RP"                       
"vrf name"                       "static RP ip address"                       "static RP prefix list"                       "static RP priority"                       "static RP bidir"                       ""A table to pimsm anycast-RP peer"                       #"An entry to pimsm anycast-RP peer"                       
"vrf name"                       "anycast-RP peer address"                       "A table to SPT switch"                       "An entry to SPT switch"                       
"vrf name"                       "SPT infinity ACL name"                       "SPT threshold"                       "SPT infinity"                       "A table to ARP_LOCAL"                       "An entry to ARP_LOCAL"                       
"vrf name"                       !"anycast-RP local interface name"                       "interface vrf name"                       "A table to register source"                       "An entry to register source"                       
"vrf name"                        "register source interface name"                       "A table to PIM group"                       "An entry to PIM group"                       
"vrf name"                       "PIM group name"                       "A table to PIM bind"                       "An entry to PIM bind"                       
"vrf name"                       "PIM group name"                       "PIM bind interface name"                       �"If PIM group binds active interface,
             zxr10pimBindIntfActive is true,
             zxr10pimBindIntfPassive is false"                       �"If PIM group binds passive interface,
             zxr10pimBindIntfActive is false,
             zxr10pimBindIntfPassive is true"                           "A table to IGMP instance"                       "An entry to IGMP instance"                       
"vrf name"                       "shaping number"                       "enable IGMP Proxy"                       #"require IGMP router alert options"                       "A table to IGMP SSMMAP"                       "An entry to IGMP SSMMAP"                       
"vrf name"                       "SSM map ACL name"                       "source address"                       "SSM default"                           "A table to IGMP interface"                       "An entry to IGMP interface"                       
"vrf name"                       "interface name"                       "access group"                       "immediate leave ACL name"                       "last member query interval"                       "maximum joins number"                       "querier timeout"                       "query interval"                       "query max response time"                       "robustness count"                       "shaping packet number"                       "IGMP version"                       "immediate leave all"                       "querier election disable"                       "querier election connect"                       "enable proxy service"                       "old querier present"                       "report interval"                       "interface vrf name"                       "IGMP ip source check"                       "A table to static group"                       "An entry to static group"                       
"vrf name"                       "interface name"                       "group address"                       "source address"                       	"SSM map"                       "static group flag"                       "source filter mode"                       "A table to IGMP proxy"                       "An entry to IGMP proxy"                       
"vrf name"                       "interface name"                       "proxy upstream interface name"                       "interface vrf name"                       "A table to MROUTE proxy"                       "An entry to MROUTE proxy"                       
"vrf name"                       "interface name"                       "proxy upstream interface name"                       "interface vrf name"                       "A table to static group"                       "An entry to static group"                       
"vrf name"                       "interface name"                       "group address"                       "source address"                       	"SSM map"                       "static group flag"                       ""increment mask for group address"                       "source filter mode"                       #"number of group addresses to join"                       "A table to IGMP group limit"                       "An entry to IGMP group limit"                       
"vrf name"                       "group address"                       "limit number"                           "A table to MSDP instance"                       "An entry to MSDP instance"                       
"vrf name"                       "enable MSDP"                       #"Sa advertisement message interval"                       "Sa cache item timeout"                           "A table to MSDP peer"                       "An entry to MSDP PEER."                       
"vrf name"                       "peer address"                       "mesh group"                       "SA limit value"                       "peer description"                       "MD5 password"                       "ttl threshold"                       "ttl security hops"                       "shutdown peer"                       "enable BFD"                       "peer holdtime"                       !"peer keepalive message interval"                       "peer connect retry time"                       "peer inactive time"                       "Keychain name"                       "A table to default peer"                       "An entry to default peer"                       
"vrf name"                       "peer address"                       "default peer ACL name"                       "A table to SA-FILTER-IN"                       "An entry to SA-FILTER-IN."                       
"vrf name"                       "peer address"                       "SA filter in ACL name"                       "A table to SA-FILTER-OUT"                       "An entry to SA-FILTER-OUT."                       
"vrf name"                       "peer address"                       
"ACL name"                        "A table to peer connect source"                       !"An entry to peer connect source"                       
"vrf name"                       "peer address"                       "connect source interface name"                       "A table to SA redistribute"                       "An entry to SA redistribute"                       
"vrf name"                       "SA redistribute ACL name"                       "A table to originator ID"                       "An entry to originator ID"                       
"vrf name"                       "interface name"                       "A table to connect source"                       "An entry to connect source"                       
"vrf name"                       "connect source interface name"                       "A table to MVPN instance"                       "An entry to MVPN instance"                       
"vrf name"                       "provider tunnel"                       "bier subdomain id"                       "A table to mtunnel"                       "An entry to mtunnel"                       
"vrf name"                       "mtunnel interface"                       "A table to ttl"                       "An entry to ttl"                       
"vrf name"                       "interface name"                       "ttl number"                       "A table to mroute boundary"                       "An entry to mroute boundary"                       
"vrf name"                       "interface name"                       "mroute boundary ACL name"                        "A table to reject inbound data"                       !"An entry to reject inbound data"                       
"vrf name"                       "interface name"                       ,"A table to filter policy monitor interface"                       -"An entry to filter policy monitor interface"                       
"vrf name"                       "interface name"                       "filter interface mode"                       "filter interface type"                       3"A table to filter policy monitor mroute interface"                       4"An entry to filter policy monitor mroute interface"                       
"vrf name"                       "interface name"                       "source address"                       "group address"                       "filter interface type"                       ."A table to filter policy monitor mroute mode"                       /"An entry to filter policy monitor mroute mode"                       
"vrf name"                       "source address"                       "group address"                       "filter mode type"                       "A table to forwording policy"                       "An entry to forwarding policy"                       
"vrf name"                       
"ACL name"                       "forwording policy type"                       $"A table to multicast nexthop route"                       %"An entry to multicast nexthop route"                       
"vrf name"                       "interface name"                       "ip address"                       "ip address mask"                       "nexthop address"                       "source address"                       "group address"                       "A table to segment border."                       "An entry to segment border."                       
"VRF name"                        "Intra-AS segment border router"                       )"Segmented nexthop of extended community"                        "Inter-AS segment border router"                       "Segmented nexthop of Inter-AS"                       "A table to mroute SMDM hybrid"                        "An entry to mroute SMDM hybrid"                       "Interface name"                       "Row status."                          