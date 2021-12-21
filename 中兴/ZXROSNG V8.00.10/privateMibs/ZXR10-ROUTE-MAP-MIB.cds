$--  ******************************************************
--  $Id: ZXR10-ROUTE-MAP-MIB.mib  
--  
--  ZXR10-ROUTE-MAP-MIB
--  
--  Mar. 2013, Qian Yi 
--  
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--  ******************************************************
  �"local       Locally generated route.Value is 1.
             internal    Internal route (including OSPF intra/inter area).Value is 2.
             level-1     IS-IS level-1 route.Value is 3.
             level-2     IS-IS level-2 route.Value is 4.
             external    External route (OSPF type 1/2).Value is 5.
             type-1      OSPF external type 1 route.Value is 6.
             type-2      OSPF external type 2 route.Value is 7.
             ebgp        External border gateway protocol(EBGP) route.Value is 8.
             ibgp        Internal border gateway protocol(IBGP) route.Value is 9.
             static      Static route.Value is 10.
             bgp-agg     BGP aggregate route.Value is 11."              "max-reliability    Set max reliable TOS (3)
             max-throughput     Set max throughput TOS (4)
             min-delay          Set min delay TOS (5)
             min-monetary-cost  Set min monetary cost TOS (2)
             normal             Set normal TOS (1)"               "prepend = 1,replace = 2."               "eq = 1,ge = 2,le = 3."               "The Value is 3."               "The Value is 3."               �"all         Path for imitating iBGP full-mesh
             backup      Path for rapid convergence
             best-path   Path for load sharing
             group-best  Path for elimination of routing oscillation"               s" egp(1)         Remote EGP
              igp(0)         Local IGP
              incomplete(2)  Unknown heritage"               �" level-1    Import into a level-1 area
              level-1-2  Import into level-1 and level-2
              level-2    Import into level-2 sub-domain"               "permit = 0,deny = 1."               }"additive  Add to the existing extcommunity.Value is 6.
             remove    Remove the existing extcommunity.Value is 7."               "The Value is 1."               "The Value is 2."               "plus(+) = 1,minus(-) = 2."               "The Value is 1."               �"external  IS-IS external metric
             internal  IS-IS internal metric
             type-1    OSPF external type 1 metric
             type-2    OSPF external type 2 metric"              �"additive             Add to the existing community. Value is 5.
             internet             Internet(Well known community). Value is 4.
             no-advertise         Do not advertise to any peer. Value is 2.
             no-export            Do not export to next AS. Value is 1.
             no-export-subconfed  Do not send outside local AS. Value is 3.
             none                 No community attribute. Value is 6."               "plus(+) = 1,minus(-) = 2."               "The Value is 2."               "The Value is 1."              �"critical        Set critical precedence (6)
             flash           Set flash precedence (4)
             flash-override  Set flash override precedence (5)
             immediate       Set immediate precedence (3)
             internet        Set internetwork control precedence (7)
             network         Set network control precedence (8)
             priority        Set priority precedence (2)
             routine         Set routine precedence (1)"                                                                     /"The MIB module to describe the RMAP protocol." V"       Hu Jun
        Tel:    +86-25-52870000
        E-Mail: hu.jun11@zte.com.cn " "201812191400Z" "201812041400Z" "201811271400Z" "201811151400Z" "201802091400Z" "201711201400Z" "201707251400Z" "201707041400Z" "201704281400Z" "201703201400Z" "201703081400Z" "201612051400Z" "201611171400Z" "201608051400Z" "201607221400Z" "201606241000Z" "201412251400Z" "201410091400Z" "201409011400Z" "201408131400Z" "201402101400Z" "201401221400Z" "201311221400Z" '"Add attribute zxr10RMAPSetLocalPreAct" �"Add zxr10RMAPMatchIpPeerTable,
         Add zxr10RMAPMatchIpv6PeerTable,
         Add zxr10RMAPSetL2EquVniLabelTable,
         Add zxr10RMAPSetL3EquVniLabelTable,
         Add zxr10RMAPSetSHScopeTable." "Add zxr10RMAPDescriptionTable" "Add zxr10RMAPSetDistanceTable" �"Add attribute zxr10RMAPAspathMatchName,
         Add index zxr10RMAPAspathMatchName,
         Modify the range of zxr10RMAPAspathNo."8"Add zxr10RMAPSetCommunityNameTable, 
         Add attribute zxr10RMAPExtCommunityMatchName,
         Add index zxr10RMAPExtCommunityMatchName,
         Modify the range of zxr10RMAPCommunityNo,
         Modify the range of zxr10RMAPCommunityMatchName,
         Modify the range of zxr10RMAPExtCommunityNo." S"Add attributes zxr10RMAPCommunityMatchName in table zxr10RMAPMatchCommunityTable." 3"Modify the description of zxr10RMAPMatchRouteType" �"Add zxr10RMAPMatchPlyRtIdTable, zxr10RMAPMatchIpv6PlyRtIdTable,
         zxr10RMAPSetPlyRtIdTable, zxr10RMAPSetMonitorGroupIdTable,
         zxr10RMAPLoadShareTable, zxr10RMAPContinueTable, zxr10RMAPTimeRangeTable" z"Add zxr10RMAPMatchL3VniLabelTable,zxr10RMAPMatchL2VniLabelTable
        and modify the range of zxr10RMAPMatchRouteType" !"Add zxr10RMAPSetL3vniLabelTable" ("Modify the range of zxr10RMAPMatchEvpn" l"Add zxr10RMAPSetVxlanTunnelSrcTable,zxr10RMAPSetEvpnMacIntfTable 
        and zxr10RMAPSetL2vniLabelTable" c"Add zxr10RMAPStrictPolicyTable,zxr10RMAPSetPathListTable 
        and zxr10RMAPSetPathList6Table" A"Add zxr10RMAPBlackHoleRouteTable and zxr10RMAPDefaultRouteTable" "Add zxr10RMAPMatchEvpnTable" &"Add zxr10RMAPSetAspathPrepOrRep node" K"Add zxr10RMAPSetNextHopPeerAddrTable and zxr10RMAPSetIpv6NHorPeerAddTable" Y"Discard zxr10RMAPMatchIpv6AddressTable and 
        add zxr10RMAPMatchIpv6AddrPflTable"]"Add zxr10RMAPMatchAsLenTable,zxr10RMAPMatchAsUnqLenTable,zxr10RMAPMatchIpSourceAclTable,
        zxr10RMAPMatchIpSourcePflTable,zxr10RMAPMatchLocalPrefTable,zxr10RMAPMatchOriginTable,
        zxr10RMAPSetPathSelTable,zxr10RMAPSetPolicyPrioTable,zxr10RMAPMatchIpAlgMetricTable,
        zxr10RMAPMatchIpv6AlgMetricTable,zxr10RMAPSetTraffIdxTable."="Modify name of zxr10RMAPSetGlobalIp to zxr10RMAPSetGlobalIPAddr.
         Add attributes zxr10RMAPSetGlobalIpConst and zxr10RMAPSetGlobalNextHopConst
         in table zxr10RMAPSetGlobalTable.
         Add attributes zxr10RMAPSetVrfIpConst and zxr10RMAPSetVrfNextHopConst
         in table zxr10RMAPSetVrfTable." ""Modify the size of DisplayString" B"add:   zxr10RMAPMIB
        Initial version of this MIB module."                           "Route-map Name Table"                       "Route-map Name"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       4"permit:Match success
         deny  :Match failed"                       "RowStatus"                       "Route-map Match Aspath Table"                       "Match BGP as-path list"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       z"Aspath List Number.
         The range of config is 0 to 199.
         Each sequence has 10 match aspath items at most"                       ""Name of Aspath (0-31 characters)"                       "RowStatus"                       !"Route-map Match Community Table"                       "Match BGP community list"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"Community list number.
         The range of config is 0 to 499.
         Each sequence has 10 match community items at most."                       %"Name of Community (0-31 characters)"                       "RowStatus"                       $"Route-map Match ExtCommunity Table"                       "Match BGP extcommunity list"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"ExtCommunity list number.
         The range of config is 0 to 500.
         Each sequence has 10 match extcommunity items at most."                       ("Name of ExtCommunity (0-31 characters)"                       "RowStatus"                       !"Route-map Match Interface Table"                       $"Match first hop interface of route"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                      "Interface Name(1-31 characters).
         Each sequence has 10 match interface items at most.
         This match item supports these types of interface:
         [PORT_CLASS_FEI,          PORT_CLASS_GEI_END]
         [PORT_CLASS_OC,               PORT_TYPE_OC48]
         [PORT_TYPE_OC192,          PORT_CLASS_E1_END]
         [PORT_CLASS_E1_C_CH,          PORT_TYPE_ULEI]
         [PORT_CLASS_GVI,          PORT_CLASS_GVI_END]
         [PORT_CLASS_QX,            PORT_CLASS_QX_END]
         [PORT_TYPE_MANAGE,          PORT_TYPE_MANAGE]
         [PORT_CLASS_DSL,          PORT_CLASS_DSL_END]
         [PORT_CLASS_SPECIAL,     PORT_TYPE_SUPERQINQ]
         [PORT_TYPE_TE_TUNNEL, PORT_TYPE_IPSEC_TUNNEL]
         [PORT_TYPE_CIP,           PORT_TYPE_QX_LOGIC]."                       "RowStatus"                       ;"Route-map Match IpAddress Table(match ip address by acl)."                      �"Match address of route or match packet.
        This match item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        Otherwise, It conflicts with the item that match ip address by pfl.
        If zxr10RMAPIsConfigAcl is true,it expresses that this config is match ip address by acl."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       i"Name of an access-list(1-31 characters).
         Each sequence has 10 match ip address items at most."                       ;"It expresses that this config is match ip address by acl."                       "RowStatus"                       :"Route-map Match IpAddress Table(match ip address by pfl)"                      ""Match address of route or match packet.
        This match item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        Otherwise, It conflicts with the item that match ip address by acl."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       i"Name of a prefix list (1-31 characters).
         Each sequence has 10 match ip address items at most."                       ;"It expresses that this config is match ip address by pfl."                       "RowStatus"                        "Route-map Match IpMetric Table"                       �"Match metric of route.
        This match item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �" Metric Value.
          The range of config is 0 to 4294967295.
          Each sequence has 10 match ip metric items at most."                       "RowStatus"                       !"Route-map Match IpNextHop Table"                       �"Match next-hop address of route.
        This match item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       j"Name of an access-list(1-31 characters).
         Each sequence has 10 match ip next-hop items at most."                       "RowStatus"                       "Route-map Match IpTag Table"                       �"Match tag of route.
        This match item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       y"Tag Value.
         The range of config is 0 to 4294967295.
         Each sequence has 10 match ip tag items at most."                       "RowStatus"                       #"Route-map Match Ipv6Address Table"                       �"Match address of route or match packet.
        This match item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       k"Name of an access-list(1-31 characters).
         Each sequence has 10 match ipv6 address items at most."                       "RowStatus"                       '"Route-map Match Ipv6Address pfl Table"                       �"Match address of route or match packet.
        This match item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       k"Name of an access-list(1-31 characters).
         Each sequence has 10 match ipv6 address items at most."                       ="It expresses that this config is match ipv6 address by pfl."                       "RowStatus"                       ""Route-map Match Ipv6Metric Table"                       �"Match metric of route.
        This match item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �" Metric Value.
          The range of config is 0 to 4294967295.
          Each sequence has 10 match ipv6 metric items at most."                       "RowStatus"                       #"Route-map Match Ipv6NextHop Table"                       �"Match next-hop address of route.       
        This match item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       l"Name of an access-list(1-31 characters).
         Each sequence has 10 match ipv6 next-hop items at most."                       "RowStatus"                       "Route-map Match Ipv6Tag Table"                       �"Match tag of route.       
        This match item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       {"Tag Value.
         The range of config is 0 to 4294967295.
         Each sequence has 10 match ipv6 tag items at most."                       "RowStatus"                       "Route-map Match Rd Table"                       "Match BGP/VPN rd list"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"Rd-list number.
         The range of config is 1 to 500. 0 is invalid value.
         Each sequence has 10 match rd-list items at most."                       "RowStatus"                       !"Route-map Match RouteType Table"                       "Match route-type of route"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                      6"local       Locally generated route.Value is 1.
         internal    Internal route (including OSPF intra/inter area).Value is 2.
         level-1     IS-IS level-1 route.Value is 3.
         level-2     IS-IS level-2 route.Value is 4.
         external    External route (OSPF type 1/2).Value is 5.
         ebgp        External border gateway protocol(EBGP) route.Value is 8.
         ibgp        Internal border gateway protocol(IBGP) route.Value is 9.
         static      Static route.Value is 10.
         bgp-agg     BGP aggregate route.Value is 11."                       q"type-1      OSPF external type 1 route.Value is 6.
         type-2      OSPF external type 2 route.Value is 7."                       "RowStatus"                       "Route-map Set Aspath Table"                       N"Set prepend string for a BGP as-path attribute.
        0 is invalid value."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       >"AS number.
         The range of config is 1 to 4294967295."                       9"Set aspath prepend or replace,prepend is 1,replace is 2"                       "RowStatus"                       "Route-map Set Community Table"                      Y"Set BGP community attribute.
        The value of config includes:
        internet             Internet(Well known community)
        no-advertise         Do not advertise to any peer
        no-export            Do not export to next AS
        no-export-subconfed  Do not send outside local AS
        none                 No community attribute.
        If set community none has been setted, other types of set community can't be setted.
        If set community has been setted with attribute addtive, 
        other configs of set community can't be setted without attribute addtive."                       %"Name of Route-map (1-31 characters)"                       �"Sequence of Route-map.
         The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"additive             Add to the existing community. Value is 5.
         none                 No community attribute. Value is 6."                      "internet             Internet(Well known community). Value is 4.
         no-advertise         Do not advertise to any peer. Value is 2.
         no-export            Do not export to next AS. Value is 1.
         no-export-subconfed  Do not send outside local AS. Value is 3."                       "RowStatus"                       "Route-map Set Community Table"                      �"Set BGP community attribute in aa:nn format. 
        If set community has been setted with attribute addtive, 
        other configs of set community can't be setted without attribute addtive.
        If zxr10RMAPSetCommAsnn is setted with value 0:0 , 
        the config will transform to config of set community internet.
        If zxr10RMAPSetCommAsnn is setted with value 0:X , 
        the config will transform to config of set community X in uint format.
        If zxr10RMAPSetCommUint is setted with value 65535:65281,
        the config will transform to config of set community no-export.
        If zxr10RMAPSetCommUint is setted with value 65535:65282,
        the config will transform to config of set community no-advertise.
        If zxr10RMAPSetCommUint is setted with value 65535:65283,
        the config will transform to config of set community no-export-subconfed."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       5"additive Add to the existing community. Value is 5."                       �"Community number in aa:nn format.
         The range of aa is 0 to 65535.
         The range of nn is 0 to 65535.
         The ASCII code of : is 58.
         The ASCII code from 1 to 9 is 49 to 57."                       "RowStatus"                       "Route-map Set Community Table"                      j"Set BGP community attribute in Unsigned32 format.
        If set community has been setted with addtive attribute, 
        other configs of set community can't be setted without addtive attribute. 
        If zxr10RMAPSetCommUint is setted with value which is larger than 65535,
        the config will transform to config of set community X:Y in ASNN format.
        For example,set community 65536 will transform to set community 1:1.
        If zxr10RMAPSetCommUint is setted with value 4294967041,
        the config will transform to config of set community no-export.
        If zxr10RMAPSetCommUint is setted with value 4294967042,
        the config will transform to config of set community no-advertise.
        If zxr10RMAPSetCommUint is setted with value 4294967043,
        the config will transform to config of set community no-export-subconfed."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       5"additive Add to the existing community. Value is 5."                       Z"Community number in unsigned32 format.
         The range of config is 1 to 4294967295."                       "RowStatus"                       "Route-map Set Dampening Table"                       )"Set BGP route flap dampening parameters"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"Half-life time for the penalty.
         The range of config is 1 to 45.
         The value for half-life should be smaller than max duration to suppress."                       �"Penalty to start reusing a route.
         The range of config is 1 to 20000.
         The value for reusing should be smaller than the value for suppressing."                       �"Penalty to start suppressing a route.
         The range of config is 1 to 20000.
         The value for suppressing should be larger than the value for reusing."                       �"Maximum duration to suppress a stable route.
         The range of config is 1 to 255.
         The value for max duration to suppress should be larger than half-life."                       "RowStatus"                       "Route-map Set Dscp Table"                       �"Set DSCP for PBR.
        This set item conflicts with these items below:
        set ip precedence
        set ip tos
        set ipv6 precedence
        set ipv6 traffic-class"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       b"Type of service value.
         The range of config is 0 to 63.
         255 is invalid value."                       "RowStatus"                       "Route-map Set Rt Table"                      N"Set Transitive Route Target extended community.
        If set extcommunity rt-trans remove has been setted, other types of set extcommunity can't be setted.
        If set extcommunity rt-trans has been setted with addtive attribute, 
        other configs of set extcommunity rt-trans can't be setted without addtive attribute."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                      �"VPN extended community.
        This config includes 3 formats.
        1.ASNN(X:Y)
        The range of X is 0 to 65535.
        The range of X is 0 to 4294967295.
        2.ASNDot(X.Y:Z)
        The range of X is 1 to 65535.
        The range of Y is 0 to 65535.
        The range of Z is 0 to 65535.
        3.ASNIp(A.B.C.D:X)
        The range of X is 0 to 65535.
        The ASCII code of . is 46.
        The ASCII code of : is 58.
        The ASCII code from 1 to 9 is 49 to 57."                       y"additive  Add to the existing extcommunity.Value is 6.
         remove    Remove the existing extcommunity.Value is 7."                       "RowStatus"                       "Route-map Set Soo Table"                      "Transitive Site-of-Origin extended community.
        If set extcommunity soo-trans remove has been setted, other types of set extcommunity can't be setted.
        The ASCII code of . is 46.
        The ASCII code of : is 58.
        The ASCII code from 1 to 9 is 49 to 57."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                      {"VPN extended community.
        This config includes 3 formats.
        1.ASNN(X:Y)
        The range of X is 0 to 65535.
        The range of X is 0 to 4294967295.
        2.ASNDot(X.Y:Z)
        The range of X is 1 to 65535.
        The range of Y is 0 to 65535.
        The range of Z is 0 to 65535.
        3.ASNIp(A.B.C.D:X)
        The range of X is 0 to 65535."                       -"Remove the existing extcommunity.Value is 7"                       "RowStatus"                       "Route-map Set Global Table"                      �"Set global route for PBR.
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        It conflicts with these set items below:
        set interface
        set ip next-hop
        set ipv6 next-hop
        set next-hop
        set ip path
        set ipv6 path
        set vrf                                "                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       9"It expresses that whether this config is setted or not."                       d"IP address of next hop.
         This attribut may be setted or not.
         0 is invaid value."                       ]"If zxr10RMAPSetGlobalIPAddr is setted, this attribut should be setted
        with value 3"                       ]"If zxr10RMAPSetGlobalIPAddr is setted, this attribut should be setted
        with value 1"                       "RowStatus"                       "Route-map Set Interface Table"                      /"Set output interface.
        Each sequence has 10 set interface items at most.
        This set item supports these types of interface:
        [PORT_CLASS_OC, PORT_TYPE_OC48]
        [PORT_TYPE_OC192, PORT_CLASS_OC_END]
        PORT_TYPE_NULL
        PORT_TYPE_TE_TUNNEL
        PORT_TYPE_GRE_TUNNEL
        PORT_TYPE_OC3_C_E1
        PORT_TYPE_OC3_C_E1_TS
        PORT_TYPE_E1_C_TS
        [PORT_TYPE_DIALER,PORT_TYPE_DIALER].
        It conflicts with these set items below:
        set vrf
        set global                              "                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       N"Interface Name.
         Each sequence has 10 set  interface items at most."                       "RowStatus"                       "Route-map Set IpMetric Table"                       �"Set metric value for destination routing protocol.        
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       k"plus :Add metric.Value is 1.
         minus:Del metric.Value is 2.
         unset:No Action.Value is 0."                       @"Metric value.
         The range of config is 0 to 4294967295"                       "RowStatus"                       ""Route-map Set IpMetricType Table"                       �"Set type of metric for destination routing protocol.
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"external  IS-IS external metric.Value is 2.
         internal  IS-IS internal metric.Value is 1.
         type-1    OSPF external type 1 metric.Value is 3.
         type-2    OSPF external type 2 metric.Value is 4.
         0 is invalid value."                       "RowStatus"                       "Route-map Set IpNextHop Table"                      "Set Next hop address.
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       k"IP address of next hop. 0 is invalid value.
         Each sequence has 10 set ip next-hop items at most."                       ;"Track name.
         This attribut may be setted or not."                       "RowStatus"                       "Route-map Set IpPath Table"                      �"Set output interface.
        This set item supports these types of interface:
        [PORT_CLASS_FEI,PORT_CLASS_GEI_END].
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       %"Name of Interface (1-31 characters)"                       ,"IP address of next hop.0 is invalid value."                       "RowStatus"                       "Route-map Set IpPrec Table"                      m"Set precedence field.
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        It conflicts with these set items below:
        set dscp.
        If zxr10RMAPSetIpPrec is getted with value 255,
        it expresses this config is invalid."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"Precedence value.
         The range of config is 0 to 7.
         255 is invalid value.
         If zxr10RMAPSetIpPrec is setted with valid value,
         zxr10RMAPSetIpPrecMap should be setted with 255."                      T"critical        Set critical precedence (6)
         flash           Set flash precedence (4)
         flash-override  Set flash override precedence (5)
         immediate       Set immediate precedence (3)
         internet        Set internetwork control precedence (7)
         network         Set network control precedence (8)
         priority        Set priority precedence (2)
         routine         Set routine precedence (1)
         255 is invalid value.
         If zxr10RMAPSetIpPrecMap is setted with valid value,
         zxr10RMAPSetIpPrec should be setted with 255."                       "RowStatus"                       "Route-map Set IpTag Table"                       �"Set tag value for destination routing protocol.
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       c"Set tag value for destination routing protocol.
         The range of config is 0 to 4294967295."                       "RowStatus"                       "Route-map Set IpTos Table"                      
"Set type of service field.
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        It conflicts with these set items below:
        set dscp"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"Type of service value.
         The range of config is 0 to 15.
         255 is invalid value.
         If zxr10RMAPSetIpTos is setted with valid value,
         zxr10RMAPSetIpTosMap should be setted with 255."                      �"max-reliability    Set max reliable TOS (3)
         max-throughput     Set max throughput TOS (4)
         min-delay          Set min delay TOS (5)
         min-monetary-cost  Set min monetary cost TOS (2)
         normal             Set normal TOS (1)
         255 is invalid value.
         If zxr10RMAPSetIpTosMap is setted with valid value,
         zxr10RMAPSetIpTos should be setted with 255."                       "RowStatus"                        "Route-map Set Ipv6Metric Table"                       �"Set metric value for destination routing protocol.
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       k"plus :Add metric.Value is 1.
         minus:Del metric.Value is 2.
         unset:No Action.Value is 0."                       A"Metric value.
         The range of config is 0 to 4294967295."                       "RowStatus"                       $"Route-map Set Ipv6MetricType Table"                       �"Set type of metric for destination routing protocol.
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"external  IS-IS external metric.Value is 2.
         internal  IS-IS internal metric.Value is 1.
         type-1    OSPF external type 1 metric.Value is 3.
         type-2    OSPF external type 2 metric.Value is 4.
         0 is invalid value"                       "RowStatus"                       "Route-map Set IpNextHop Table"                      "Set Next hop address.
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       z"<X:X::X:X> IPv6 address of next hop. 0 is invalid value.
         Each sequence has 10 set ipv6 next-hop items at most."                       "RowStatus"                       "Route-map Set Ipv6Path Table"                      �"Set output interface.
        This set item supports these types of interface:
        [PORT_CLASS_FEI,PORT_CLASS_GEI_END].
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       %"Name of Interface (1-31 characters)"                       9"<X:X::X:X> IPv6 address of next hop.0 is invalid value."                       "RowStatus"                       "Route-map Set Ipv6Prec Table"                      $"Set precedence field.
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type.
        It conflicts with these set items below:
        set dscp
        255 is invalid value."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"Precedence value. 255 is invalid.
         The range of config is 0 to 7.
         If zxr10RMAPSetIpv6prec is setted with valid value,
         zxr10RMAPSetIpv6precMap should be setted with 255."                      X"critical        Set critical precedence (6)
         flash           Set flash precedence (4)
         flash-override  Set flash override precedence (5)
         immediate       Set immediate precedence (3)
         internet        Set internetwork control precedence (7)
         network         Set network control precedence (8)
         priority        Set priority precedence (2)
         routine         Set routine precedence (1)
         255 is invalid value.
         If zxr10RMAPSetIpv6precMap is setted with valid value,
         zxr10RMAPSetIpv6prec should be setted with 255."                       "RowStatus"                       "Route-map Set Ipv6Tag Table"                       �"Set tag value for destination routing protocol.
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       E"Precedence value.
         The range of config is 0 to 4294967295."                       "RowStatus"                       !"Route-map Set Ipv6Traffic Table"                      "Set IPv6 traffic-class.
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type.
        It conflicts with these set items below:
        set dscp"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       I"Value of IPv6 traffic-class.
         The range of config is 0 to 255."                       "RowStatus"                       "Route-map Set Level Table"                       "Set where to import route"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"level-1    Import into a level-1 area.Value is 1.
         level-1-2  Import into level-1 and level-2.Value is 3.
         level-2    Import into level-2 sub-domain.Value is 2.
         0 is invalid value."                       "RowStatus"                       %"Route-map Set LocalPreference Table"                       *"Set BGP local preference path attribute."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       E"Preference value.
         The range of config is 0 to 4294967295."                       "plus :Add local preference.Value is 1.
         minus:Del local preference.Value is 2.
         unset:No Action.Value is 0."                       "RowStatus"                        "Route-map Set Mpls-label Table"                       "Set MPLS label for prefix"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       ^"Set MPLS label for prefix.
         It expresses that  whether this config is valid or not."                       "RowStatus"                       "Route-map Set NextHop Table"                       t"Set IP address of next hop.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       h"IP address of next hop. 0 is invalid value.
         Each sequence has 10 set next-hop items at most."                       "RowStatus"                       "Route-map Set Origin Table"                       "Set BGP origin code"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"egp         Remote EGP.Value is 2.
         igp         Local IGP.Value is 1.
         incomplete  Unknown heritage.Value is 3.
         0 is invalid value."                       "RowStatus"                       "Route-map Set QosId Table"                       "Set QoS ID of routing"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       T"QoS ID.
         The range of config is 1 to 16000.
         0 is invalid value."                       "RowStatus"                       "Route-map Set Vrf Table"                      u"Set virtual route forwarding name.
        This set item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        It conflicts with these set items below:
        set interface
        set ip next-hop
        set ipv6 next-hop
        set next-hop
        set global"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "Virtual route forwarding name"                       ["IP address of next hop. 0 is invalid value.
         This attribut may be setted or not."                       ;"Track name.
         This attribut may be setted or not."                       ^"If zxr10RMAPSetVrfNextHop is setted, this attribute
         should be setted with value 1."                       ^"If zxr10RMAPSetVrfNextHop is setted, this attribute
         should be setted with value 2."                       "RowStatus"                       &"Route-map Match As-path-length Table"                       "Match BGP as-path-length"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"eq  Equal as-path length to be matched.Value is 1.
         ge  Minimum as-path length to be matched.Value is 2.
         le  Maximun as-path length to be matched.Value is 3."                       <"As-path length.
         The range of config is 0 to 255."                       "RowStatus"                       -"Route-map Match As-path-unique-length Table"                       !"Match BGP as-path-unique-length"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"eq  Equal as-path length to be matched.Value is 1.
         ge  Minimum as-path length to be matched.Value is 2.
         le  Maximun as-path length to be matched.Value is 3."                       C"As-path unique length.
         The range of config is 0 to 255."                       "RowStatus"                       9"Route-map Match IpSource Table(match ip source by acl)."                      �"Match source ip address of route or match packet.
        This match item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        Otherwise, It conflicts with the item that match ip source by pfl.
        If zxr10RMAPsourceIsConfigAcl is true,it expresses that this config 
        is match ip source by acl."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       h"Name of an access-list(1-31 characters).
         Each sequence has 10 match ip source items at most."                       :"It expresses that this config is match ip source by acl."                       "RowStatus"                       8"Route-map Match IpSource Table(match ip source by pfl)"                      +"Match Source ip address of route or match packet.
        This match item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv6 type.
        Otherwise, It conflicts with the item that match ip source by acl."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       h"Name of a prefix list (1-31 characters).
         Each sequence has 10 match ip source items at most."                       :"It expresses that this config is match ip source by pfl."                       "RowStatus"                       ("Route-map Match local-preference Table"                       +"Match BGP local preference path attribute"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"eq  Equal as-path length to be matched.Value is 1.
         ge  Minimum as-path length to be matched.Value is 2.
         le  Maximun as-path length to be matched.Value is 3."                       E"Preference value.
         The range of config is 0 to 4294967295."                       "RowStatus"                       "Route-map Match Origin Table"                       "Match BGP origin code"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"egp         Remote EGP.Value is 2.
         igp         Local IGP.Value is 1.
         incomplete  Unknown heritage.Value is 3.
         0 is invalid value."                       "RowStatus"                       $"Route-map Set Path-selection Table"                       "Set BGP path-selection"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"all         Path for imitating iBGP full-mesh.Value is 1.
         backup      Path for rapid convergence.Value is 2.
         best-path   Path for load sharing.Value is 3.
         group-best  Path for elimination of routing oscillation.Value is 4."                       9"Path numbers.
         The range of config is 1 to 32."                       ("Manner of sending to forwarding table."                       ("Manner of sending to forwarding table."                       ("Advertising the path selected outward."                       "RowStatus"                       %"Route-map Set Policy-priority Table"                       "Set policy priority for PBR"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       D"Value of policy priority.
         The range of config is 0 to 7."                       "RowStatus"                       !"Route-map Match Ip Metric Table"                       �"Match address of route or match packet.
This match item sets the route-map with ipv4 type.
It conflicts with other match or set items which set the route-map name with ipv6 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"eq  Equal matric length to be matched.Value is 1.
         ge  Minimum matric length to be matched.Value is 2.
         le  Maximun matric length to be matched.Value is 3."                       A"Metric value.
         The range of config is 0 to 4294967295."                       "RowStatus"                       #"Route-map Match Ipv6 Metric Table"                       �"Match address of route or match packet.
This match item sets the route-map with ipv6 type.
It conflicts with other match or set items which set the route-map name with ipv4 type."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"eq  Equal matric length to be matched.Value is 1.
         ge  Minimum matric length to be matched.Value is 2.
         le  Maximun matric length to be matched.Value is 3."                       A"Metric value.
         The range of config is 0 to 4294967295."                       "RowStatus"                       #"Route-map Set Traffic-index Table"                       "Set BGP traffic index"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       A"Traffic-index number.
         The range of config is 1 to 63."                       "RowStatus"                       "Route-map Set NextHop Table"                       t"Set IP address of next hop.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       h"IP address of next hop. 0 is invalid value.
         Each sequence has 10 set next-hop items at most."                       "Peer address for BGP."                       "RowStatus"                       "Route-map Set IpNextHop Table"                      "Set Next hop address.
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       z"<X:X::X:X> IPv6 address of next hop. 0 is invalid value.
         Each sequence has 10 set ipv6 next-hop items at most."                       "Peer address for BGP."                       "RowStatus"                       "Route-map match EVPN table"                       "Match BGP EVPN route"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       �"EVPN route type.
        1: Ethernet Auto-Discovery (A-D) route;
        2: MAC/IP Advertisement route;
        3: Inclusive Multicast Ethernet Tag route;
        4: Ethernet Segment route;
        5: IP Prefix route."                       "Row status"                       ""Route-map black hole route table"                       5"Black hole route which outcoming interface is null."                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "Black hole route enable."                       "Row status"                       "Route-map default route table"                       "Default route"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "Default route enable."                       "Row status"                       "Route-map strict policy table"                       "Strict policy"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "Strict policy enable."                       "Row status"                       $"Route-map set IPv4 path list table"                      �"Set output interfaces.
        This set item supports these types of interface:
        [PORT_CLASS_FEI,PORT_CLASS_GEI_END].
        This set item sets the route-map name with IPv4 type.
        It conflicts with other match or set items 
        which set the route-map name with IPv6 type and
        zxr10RMAPSetIpPathListTable.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       %"Name of interface (1-31 characters)"                       ,"IP address of next hop.0 is invalid value."                       "Row status"                       $"Route-map set Ipv6 path list table"                      �"Set output interface.
        This set item supports these types of interface:
        [PORT_CLASS_FEI,PORT_CLASS_GEI_END].
        This set item sets the route-map name with ipv6 type.
        It conflicts with other match or set items 
        which set the route-map name with ipv4 type and
        zxr10RMAPSetIpv6PathTable.
        It conflicts with these set items below:
        set vrf
        set global"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       %"Name of interface (1-31 characters)"                       9"<X:X::X:X> IPv6 address of next hop.0 is invalid value."                       "Row status"                       )"Route-map set VXLAN tunnel source table"                       )"Route-map set VXLAN tunnel source entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       $"IP address of VXLAN tunnel source."                       "Row status"                       1"Route-map set EVPN router's MAC interface table"                       1"Route-map set EVPN router's MAC interface entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       %"Name of interface (1-31 characters)"                       "Row status"                       ""Route-map set l2-vni label table"                       ""Route-map set l2-vni label entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of l2-vni label."                       "Row status"                       ""Route-map set l3-vni label table"                       ""Route-map set l3-vni label entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of l3-vni label."                       "Row status"                       $"Route-map match l3-vni label table"                       $"Route-map match l3-vni label entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of l3-vni label."                       "Row status"                       $"Route-map match l2-vni label table"                       $"Route-map match l2-vni label entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of l2-vni label."                       "Row status"                       '"Route-map match policy-route-id table"                       '"Route-map match policy-route-id entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of policy-route-id."                       #"The deriction of policy-route-id."                       "Row status"                       ,"Route-map match ipv6 policy-route-id table"                       ,"Route-map match ipv6 policy-route-id entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of policy-route-id."                       #"The deriction of policy-route-id."                       "Row status"                       %"Route-map set policy-route-id table"                       %"Route-map set policy-route-id entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of policy-route-id."                       "Row status"                       &"Route-map set monitor-group-id table"                       &"Route-map set monitor-group-id entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of policy-route-id."                       "Row status"                       "Route-map load share table"                       "Load share"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "Load share enable."                       "Row status"                       "Route-map continue table"                       "Route-map continue entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       !"The value of continue sequence."                       "Continue next."                       "Row status"                       "Route-map Time Range Table"                       "Route-map time range."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       &"Name of time range(1-31 characters)."                       "RowStatus"                       "Route-map Set Community Table"                       "Set BGP community name."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       5"additive Add to the existing community. Value is 5."                       '"Community list name (1-31 characters)"                       "RowStatus"                       "Route-map set distance table"                       "Route-map set distance entry"                       %"Name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       "The value of distance."                       "Row status"                       "Route-map Description Table"                       "Route-map description."                       %"Name of Route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       2"Description of the route-map (1-199 characters)."                       "RowStatus"                       0"The table of route-map match IPV4 peer by ACL."                      �"The entry of route-map match IPV4 peer.
        This match item sets the route-map name with ipv4 type.
        It conflicts with other match or set items 
        which set the route-map name with IPV6 type.
        Otherwise, It conflicts with the item that match BGP peer by PFL.
        If zxr10RMAPMatchPeerIsConfigAcl is true, 
        it expresses that this config is match IPV4 peer by ACL."                       )"The name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       {"The name of an access-list or prefix-list(1-31 characters).
         Each sequence has 10 match IPv4 peer items at most."                       W"It expresses that this config is match IPV4 peer by PFL, 
         otherwise by ACL."                       "RowStatus"                       ("The table of route-map match IPV6 peer"                       �"The entry of route-map match IPV6 peer.
        This match item sets the route-map name with IPV6 type.
        It conflicts with other match or set items 
        which set the route-map name with IPV4 type."                       )"The name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       ~"The name of an access-list or prefix-list(1-31 characters).
         Each sequence has 10 match IPV6 address items at most."                       W"It expresses that this config is match IPV6 peer by PFL, 
         otherwise by ACL."                       "RowStatus"                       4"The table of route-map set L2 equivalent VNI label"                       4"The entry of route-map set L2 equivalent VNI label"                       )"The name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       '"The value of L2 equivalent VNI label."                       "Row status"                       4"The table of route-map set L3 equivalent VNI label"                       4"The entry of route-map set L3 equivalent VNI label"                       )"The name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       '"The value of L3 equivalent VNI label."                       "Row status"                       0"The table of route-map set split-horizon-scope"                       0"The entry of route-map set split-horizon-scope"                       )"The name of route-map (1-31 characters)"                       �"The sequence of a route-map.
         The range of config is 0 to 65535.
         Each name of route-map has 100 sequences at most."                       )"The name of split-horizon-scope(<A-Z>)."                       "Row status"                                                          