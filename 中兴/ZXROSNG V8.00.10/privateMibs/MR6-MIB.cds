                                                                               ."The MIB module to describe the MR6 protocol." Y"Xu benchong
               Tel: 025-698109
               E-Mail:xu.benchong@zte.com.cn" "201812111500Z" "201811151500Z" "201706051500Z" "201704241000Z" "201702281500Z" "201701061000Z" "201612021000Z" "201603181500Z" "201512181500Z" "201512111500Z" "201511201400Z" "201510261000Z" "201509231000Z" "201508281100Z" "201507071100Z" "201506241000Z" "201506201400Z" "201506011000Z" "201505121400Z" "201503201000Z" "201502121500Z" "201409011400Z" "201407221100Z" "201406181600Z" "201402211400Z" "201401141400Z" "201312031700Z" "201310121400Z" "201308011600Z" "201307181600Z" "201307161400Z" "201305211400Z" "201102090000Z" &"add: zxr10mr6InstanceMulAddrRFC7371." "add: zxr10Mr6SmdmTable" %"add: zxr10mr6InstanceNeverSwitchAcl" #"add: zxr10pimsm6IntfAssertDisable" _"add: zxr10mr6InstanceSwitchThreshold
                      zxr10mr6InstanceSwitchThresholdAcl" '"add: zxr10pimsm6IntfHelloTrackSupport" %"add: zxr10mr6InstanceSwitchInterval" '"add: zxr10pimsm6InstStatisticsAclName" N"add: zxr10mstatic6RouteIncMask
                      zxr10mstatic6RouteCount" "add: zxr10nexthop6Table" '"add: zxr10mr6InstanceMroute6LimitInst" N"add: zxr10pimsm6InstMofrrAclName
                  zxr10pimsm6InterfaceFrrEn" "add: zxr10pimsm6InstPimdmReg" �"add: zxr10mstatic6RoutePermanent,
                      zxr10mstatic6RouteSlaveIifName,
                      zxr10mstatic6RouteTrackName,
                      zxr10mstatic6RouteSlaveTrackName,
                      zxr10mstatic6FrrTable" �"modify: the ranges of zxr10mstatic6LimitXgLimit 
                 and zxr10mstatic6LimitSgLimit are both 0-2048,
                 the max values get from performance parameter." U"modify:zxr10mldGroupTable is obsolete
                add:zxr10mldStaticGroupTable " !"add: zxr10pimsm6IntfHelloDrAddr" �"add: zxr10pimsm6InstCbsrHoldtime,
                      zxr10pimsm6InstCbsrInterval,
                      zxr10pimsm6CrpHoldtime" ""add: zxr10mr6InstanceAccessScope"L"add:zxr10pimsm6InstJpSpeed 
                     zxr10pimsm6InstKeepAlivePeriod
                     zxr10pimsm6InstAssertHoldTime
                     zxr10pimsm6InstGraftTime
                     zxr10pimsm6IntfPropagationDelay
                     zxr10pimsm6IntfOverrideInterval
                     zxr10pimsm6IntfJpMaxpktLen" a"modify: the status of zxr10mstatic6OifindexVlanMin and zxr10mstatic6OifindexVlanMax is obsolete" �"modify: range of zxr10mr6InstanceMultipathSghash is 
                {none(0),sbased(1),sgbasic(2),sgnexthopbased(3),sgbalance(4)}" <"modify: the status of zxr10pimsm6InstSsmEnable is obsolete" �"modify: range of zxr10mr6InstanceTosValue is (0..63|255),
                     DESCRIPTION of zxr10pimsm6BsrHashLen,
                     DESCRIPTION of zxr10mr6InstanceVrfName,
                     range of zxr10pimsm6BsrHashLen is (0..128)" L"modify: DESCRIPTION of some nodes
                     range of some nodes"�"add: zxr10pimsm6InstSsmEnable
                 modify: range of zxr10pimsm6InstJpInterval is (10..6000),
                         range of zxr10mldInstVersion is (version1(1),version2(2)),
                         range of zxr10mldIntfVersion is (version1(1),version2(2)),
                         range of zxr10mldSsmmapDefault is (0..1),
                         range of zxr10mldIntfImmediateAll is (0..1)" �"add: zxr10mvpn6InstTable
                      zxr10mvpn6InstEntry
                      zxr10mvpn6InstVrfName
                      zxr10mvpn6InstProviderTunnel" R"add: zxr10pimsm6InstJpInterval 
                      zxr10pimsm6InstRegHoldtime" "add: zxr10mldGroupLimitTable" �"add: zxr10mr6ForwordingPolicyVrfName
                      zxr10mr6ForwordingPolicyAcl
                      zxr10mr6ForwordingPolicyType" �"modify:range of zxr10mr6InstanceMroute6Limit is (0..131070),
                range of zxr10mr6InstanceMultipathSghash is 
                {none(0),sbased(1),sgbasic(2),sgnexthopbased(3)}              
                "E"modify:the data type of enumeration is converted from Unsigned32 
                 to INTEGER, including of zxr10mr6InstanceMultipathSghash
                        zxr10mldInstVersion
                        zxr10mldIntfVersion
                        zxr10mldGroupStaticFlag
                        zxr10mldGroupFilterMode" %"Initial version of this MIB module."                   "A table to mr6 instance"                       "An entry to mr6 instance"                       
"vrf name"                       "IPv6 mroute limit"                       ("tos value of multicast protocol packet"                       
"nsf time"                       "multipath based sg-hash"                       "damping enable"                       "damping threshold"                        "access multicast address scope"                       ["IPv6 mroute limit for instance, the max value gets
            from performance parameter"                       ""MVPN tunnel switchover interval."                       #"MVPN tunnel switchover threshold."                        "ACL for MVPN tunnel switchover"                       /"ACL for MVPN tunnel never switch to data tree"                       �"Multicast address compatible with RFC7371,
            add FFBX/12 to SSM default group address range,
            add FFFX/12 to embedded RP address range"                           ""A table to IPv6 mstatic instance"                       #"An entry to IPv6 mstatic instance"                       
"vrf name"                       "enable IPv6 mstatic flag"                       #"A table to IPv6 mstatic oif index"                       $"An entry to IPv6 mstatic oif index"                       
"vrf name"                       "interface name"                       "oif index"                       
"vlan min"                       
"vlan max"                           "A table to IPv6 mstatic limit"                        "An entry to IPv6 mstatic limit"                       
"vrf name"                       A"xg number limit, the max value gets from performance parameter."                       A"sg number limit, the max value gets from performance parameter."                       "A table to IPv6 mstatic route"                        "An entry to IPv6 mstatic route"                       
"vrf name"                       "group address"                       "source address"                       "iif interface name"                       "oif index"                       "permanent"                       "slave iif interface name"                       "track name"                       "slave track name"                       ."Increment mask of IPv6 MSTATIC group address"                       ,"The number of IPv6 MSTATIC group addresses"                       &"A table to IPv6 mstatic fast reroute"                       '"An entry to IPv6 mstatic fast reroute"                       
"vrf name"                       "wait to restore"                           "A table to PIMSM6 instance"                       "An entry to PIMSM6 instance"                       
"vrf name"                       "enable PIMSM6"                       "disable embedded-RP"                       "SPT threshold"                       "ssm default"                       "ssm data ACL name"                       "SPT threshold ACL name"                       "accept RP ACL name"                       "register filter ACL name"                       "anycast-RP local address"                       "register probe interval"                       "register suppression interval"                       "bsm unicast"                       "enable static RP override"                       !"IPv6 PIM source filter ACL name"                       "IPv6 bidir PIM"                       "J/P packet interval"                       ;"Register hold time without receiving register stop packet"                       "enable SSM"                       "Join/Prune Speed"                       "Keepalive Period"                       "Assert HoldTime"                       "Graft Time"                       "C-BSR holdtime"                       "C-BSR interval"                       c"Send register packets when the PIM-DM interface receives
             indirectly connected stream"                       "MoFRR ACL name"                       %"IPv6 PIM packet statistics ACL name"                       "A table to PIMSM6 interface"                       "An entry to PIMSM6 interface"                       
"vrf name"                       "interface name"                       "enable PIMSM"                       "BSR border"                       "hello packet interval"                       "DR priority"                       "PIM neighbour filter ACL name"                       "PIM silent"                       "enable BFD"                       "enable pimdm"                       "propagation delay"                       "override interval"                       %"max length of PIM Join/Prune packet"                       -"PIM hello packet sent with hello DR address"                       "PIM FRR enable"                       #"PIM hello tracking support enable"                       "PIM assert disable"                        "A table to pimsm6 candidate RP"                       !"An entry to pimsm6 candidate RP"                       
"vrf name"                       "candidate RP address "                       "candidate RP prefix list"                       "candidate RP priority"                       "candidate RP bidir"                       "candidate RP holdtime"                       "A table to pimsm6 static RP"                       "An entry to pimsm6 static RP"                       
"vrf name"                       "static RP address"                       "static RP prefix list"                       "static RP priority"                       "static RP bidir"                       "A table to anycast-RP peer"                       "An entry to anycast-RP peer"                       
"vrf name"                       "peer address"                       "A table to pimsm6 BSR"                       "An entry to pimsm6 BSR"                       
"vrf name"                       "BSR address"                       "BSR priority"                       "BSR hash mask length"                       "A table to register source"                       "An entry to register source"                       
"vrf name"                        "register source interface name"                           "A table to MLD"                       "An entry to MLD"                       
"vrf name"                       "shaping packets number"                       "last member query"                       "querier timeout"                       "query interval"                       "query max response"                       "robustness variable"                       "MLD version"                       ""require MLD router alert options"                       "A table to MLD SSM map"                       "An entry to MLD SSM map"                       
"vrf name"                       
"ACL name"                       "ssm map source address"                       "ssm map default"                           "A table to MLD interface"                       "An entry to MLD interface"                       
"vrf name"                       "interface name"                       "access group"                       "immediate leave ACL"                       "last member query interval"                       "maximum joins number"                       "querier timeout"                       "query interval"                       "query max response time"                       "robustness count"                       "shaping packets number"                       "MLD version"                       "immediate leave all"                       "querier election disable"                       "A table to static group"                       "An entry to static group"                       
"vrf name"                       "interface name"                       "group address"                       "source address"                       	"ssm map"                       "static flag"                       ""increment mask for group address"                       "source filter mode"                       #"number of group addresses to join"                       "A table to static group"                       "An entry to static group"                       
"vrf name"                       "interface name"                       "group address"                       "source address"                       	"ssm map"                       "static flag"                       "source filter mode"                       "A table to MLD group limit"                       "An entry to MLD group limit"                       
"vrf name"                       "group address"                       "limit number"                       "A table to forwording policy"                       "An entry to forwarding policy"                       
"vrf name"                       
"ACL name"                       "forwording policy type"                       "A table to MVPN6"                       "An entry to MVPN6"                       
"vrf name"                       "provider tunnel"                       "A table to multicast nexthop"                       "An entry to multicast nexthop"                       
"VRF name"                       "interface name"                       "IPv6 address"                       "nexthop address"                       "IPv6 address prefix length"                       "nexthop slave"                       )"the global instance of nexthop fallback"                       ""the VRF name of nexthop fallback"                       $"A table to IPv6 mroute SMDM hybrid"                       %"An entry to IPv6 mroute SMDM hybrid"                       "Interface name"                       "Row status."                          