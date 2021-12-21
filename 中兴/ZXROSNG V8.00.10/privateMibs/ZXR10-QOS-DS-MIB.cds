
--*****************************************************************
-- ZXR10-Qos-DS-MIB
-- OAM
-- 2013-7-5 11:28  wangfenghua
-- Copyright (c) 1985-2013 by ZTE Corp.
-- All rights reserved. 
--*****************************************************************
   �"Color of PHB info, see below:
             green   Green packets
             yellow  Yellow packets
             red     Red packets"              �"server class of PHB info ,see below:
             be  Best effort
             af1 Assured forwarding class 1
             af2 Assured forwarding class 2
             af3 Assured forwarding class 3
             af4 Assured forwarding class 4
             ef  Expedited forward
             cs6 Internetwork control service class
             cs7 Network control service class"                                         7"The MIB module to describe the QOS diffserv protocol." ^"       Hu Jun
            Tel:    +86-25-52870000
            E-Mail: hu.jun11@zte.com.cn " "201309131500Z" "201307051000Z" `"The leaf of zxr10QosDsPHBCosType adds ipv6_dscp,
            and modify zxr10QosDSPHBCosValue" Y"Add zxr10QosDsMIB and 
             Initial version of this MIB module.
             "                               "8021p Table"                       J"Map 802.1p to PHB.
                 PHB include server class and color."                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       "<0-7> 8021p value."                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "IPv4 DSCP Table"                       "Map IPv4 DSCP to PHB"                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       "<0-63> DSCP value"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "IPv6 DSCP Table"                       "Map IPv6 DSCP to PHB"                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       "<0-63> IPv6 DSCP value"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "MPLSEXP Table"                       "Map MPLSEXP to PHB"                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       "<0-7> MPLSEXP valu"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "IPv4 ACL Table"                       "Map IPv4 ACL to PHB"                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       6"WORD
                IPv4 ACL name(1-31 characters)"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "IPv6 ACL Table"                       "Map IPv6 ACL to PHB"                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       7"WORD
                 IPv6 ACL name(1-31 characters)"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "Link ACL Table"                       "Map Link ACL to PHB."                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       6"WORD
                Link ACL name(1-31 characters)"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "IPv4 mixed ACL Table"                       "Map IPv4 mixed ACL to PHB"                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       <"WORD
                IPv4 mixed ACL name(1-31 characters)"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "IPv6 mixed ACL Table"                       "Map IPv6 mixed ACL to PHB"                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       ?"WORD
                Name of IPv6 mixed ACL(1-31 characters)"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "PHB Table"                       ("Map PHB info to 8021p/IP DSCP/MPLSEXP."                       D"WORD
                Name of the diffserv domain(1-31 characters)"                      �"Server class:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       "Color:
                 green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       "Cos type:802.1p,DSCP,MPLSEXP"                       �"The value of 8021p/DSCP/MPLSEXP:
                <0-7>  8021p value
                <0-63> IPv4/IPv6 DSCP value
                <0-7>  MPLSEXP value
                "                       "Diffserv Domain Table"                       �"Template of diffserv domain:
                 the max number of template is 8,
                 and every template has a special
                 id(from 1 to 8),which is automatically 
                 generated by MIM"                       F"WORD 
                 Name of the diffserv domain(1-31 characters)"                       '"ID of the diffserv domain,from 1 to 8"                           "IfBind Table"                       #"The used diffserv domain template"                       >"WORD
                Name of the interface(1-31 characters)"                       D"WORD
                Name of the diffserv domain(1-31 characters)"                           "If Trust Table"                       %"The type of priority trusted by QoS"                       >"WORD
                Name of the interface(1-31 characters)"                       �"Trust type : 
                 8021p     Based on 802.1p
                 DSCP      Based on IP DSCP
                 MPLSEXP   Based on MPLSEXP"                           "Schedule Pw Table"                       �"Set scheduling policy for a certain PW.
                
                1.These leaf nodes conflict with each other:
                    zxr10QosDsSchePwWeight,
                    zxr10QosDsSchePwPQ.   
                "                       8"WORD
                 Name of the PW(1-31 characters)"                       8"0       default
                 <1-100> weight value"                       C"0     default value
                 <1-4> the level of priority"                       <"WORD
                 Name of policy-map(1-31 characters)"                       ""1   wfq
                 2   pq"                       "<1-65535> pw ID"                           "Schedule Te Table"                       �"Set scheduling policy for a certain tunnel.
                
                1.These leaf nodes conflict with each other:
                    zxr10QosDsScheTeWeight,
                    zxr10QosDsScheTePQ.   
                "                       F"WORD
                 Name of the attaching tunnel(1-31 characters)"                       8"0       default
                 <1-100> weight value"                       C"0     default value
                 <1-4> the level of priority"                       <"WORD
                 Name of policy-map(1-31 characters)"                       ""1   wfq
                 2   pq"                                                          