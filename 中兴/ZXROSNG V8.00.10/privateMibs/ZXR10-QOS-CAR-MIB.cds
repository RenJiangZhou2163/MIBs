 �--*****************************************************************
--ZXR10-QOS-CAR-MIB
--OAM
--2011-8-5 9:35
--
--
--Copyright (c) 1985-2013 by ZTE Corp.
--All rights reserved.
--*****************************************************************
                             2"The MIB module to describe the QoS Car protocol." ^"       Hu Jun
            Tel:    +86-25-52870000
            E-Mail: hu.jun11@zte.com.cn " "201701091530Z" "201410311530Z" "201409040850Z" "201402201842Z" "201401141500Z" "201312041000Z" "201309160834Z" "201307161500Z" "201106270000Z" 5"Modify the mib file by adding inner and outer flag." )"Modify the mib file based on criterion." )"Modify the mib file based on criterion." )"Modify the mib file based on criterion." U"Add new leaf nodes.
                       Modify the mib file based on criterion." U"Add new leaf nodes.
                       Modify the mib file based on criterion." U"Add new leaf nodes.
                       Modify the mib file based on criterion." U"Add new leaf nodes.
                       Modify the mib file based on criterion." S"add:   zxr10QosCarMIB
                       Initial version of this MIB module."               "IF_CAR Table"                       "rate-limit on the interface"                       "interface name"                       "Rate limit on direction"                       "Rate limit based on protocol"                      �"match_type:
                 localport         Match local port
                 unicast           Match unicast, only for VPLS
                 broadcast         Match broadcast, only for VPLS
                 unknown           Match unknown, only for VPLS
                 ipv4_access_list  Match IPv4 access list
                 ipv6_access_list  Match IPv6 access list
                 dscp              MATCH DSCP 
                 mpls_exp          Match MPLS-EXP
                 precedence        Match IP precedence
                 inner_vlan        Match inner VLAN ID
                 inner_8021p       Match inner 802.1p value
                 multicast         Match multicast, only for VPLS
                 link_access_list  Match link access list
                 qos_group         Match qos-group number
                 unknown-unicast   Match unknown unicast, only for VPLS
                 unknown-multicast Match unknown multicast, only for VPLS"                       $"WORD IPv4/IPv6 access list string."                       �"<1-16000> qos-group number
                 <0-63>    DSCP value 
                 <0-7>     IP precedence value
                 <0-7>     MPLS-EXP value
                 <0-7>     Match inner 802.1p value"                       J"<1-4094> Match inner VLAN ID(max num:4;spacing mark:,)
                "                       �"match type:
                 outer_8021p Match outer 802.1p value.
                 outer_vlan  Match outer VLAN ID.
                 "                       J"<1-4094> Match outer VLAN ID(max num:4;spacing mark:,)
                "                        "<0-7> Match outer 802.1p value"                       "Committed information rate"                       X"Committed burst size.
                Mark: the data is based on the diffrent project"                       "Peak information rate"                       S"Peak burst size.
                Mark: the data is based on the diffrent project"                       "Exceed burst size"                       2"Action to packets that conform to the rate limit"                       "Action value"                       ."Action to packets that exceed the rate limit"                       "Action value"                       /"Action to packets that violate the rate limit"                       "Action value."                       �"The flag of statistical-share.
                0:  Statistical-share is not configured
                1:  Statistical-share is configured"                       h"Color mode type:
                 blind : Color-Blind mode
                 aware : Color-Aware mode"                       "Action value"                       "Action value"                       "Action value."                       f"inner or outer flag.
                 0 is outer flag.
                 1 is inner and outer flag."                       f"inner or outer flag.
                 0 is outer flag.
                 1 is inner and outer flag."                       f"inner or outer flag.
                 0 is outer flag.
                 1 is inner and outer flag."                                                  