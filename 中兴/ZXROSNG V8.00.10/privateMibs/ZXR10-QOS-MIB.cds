 �--*****************************************************************
--ZXR10-QOS-MIB
--OAM
--2011-8-5 9:35
--
--
--Copyright (c) 1985-2013 by ZTE Corp.
--All rights reserved.
--*****************************************************************
  "resserved words of DSCP info ,see below:
            af11    Match packets with AF11 dscp (001010)                                
            af12    Match packets with AF12 dscp (001100)                                
            af13    Match packets with AF13 dscp (001110)                                
            af21    Match packets with AF21 dscp (010010)                                
            af22    Match packets with AF22 dscp (010100)                                
            af23    Match packets with AF23 dscp (010110)                                
            af31    Match packets with AF31 dscp (011010)                                
            af32    Match packets with AF32 dscp (011100)                                
            af33    Match packets with AF33 dscp (011110)                                
            af41    Match packets with AF41 dscp (100010)                                
            af42    Match packets with AF42 dscp (100100)                                
            af43    Match packets with AF43 dscp (100110)                                
            cs1     Match packets with CS1(precedence 1) dscp (001000)                   
            cs2     Match packets with CS2(precedence 2) dscp (010000)                   
            cs3     Match packets with CS3(precedence 3) dscp (011000)                   
            cs4     Match packets with CS4(precedence 4) dscp (100000)                   
            cs5     Match packets with CS5(precedence 5) dscp (101000)                   
            cs6     Match packets with CS6(precedence 6) dscp (110000)                   
            cs7     Match packets with CS7(precedence 7) dscp (111000)                   
            default Match packets with default dscp (000000)                             
            ef      Match packets with EF dscp (101110)"               "The data type of mac address"               "The data type of MplsExp"               "The data type of Dscp"              �"server class of PHB info ,see below:
             be  Best effort
             af1 Assured forwarding class 1
             af2 Assured forwarding class 2
             af3 Assured forwarding class 3
             af4 Assured forwarding class 4
             ef  Expedited forward
             cs6 Internetwork control service class
             cs7 Network control service class"               "The data type of 8021p"               "The data type of vlan"               "The data type of precedence"                                         ."The MIB module to describe the QoS protocol." ^"       Hu Jun
            Tel:    +86-25-52870000
            E-Mail: hu.jun11@zte.com.cn " "201701130910Z" "201701090910Z" "201505290910Z" "201408250910Z" "201404231456Z" "201402201842Z" "201401141500Z" "201312041000Z" "201307191600Z" "201106270000Z" �"Modify the mib file by adding traffic shape direction.
                       Modify the mib file by amending pmap set mark description." 5"Modify the mib file by adding inner and outer flag." 5"Modify the mib file by adding dscp not and pre not." )"Modify the mib file based on criterion." )"Modify the mib file based on criterion." )"Modify the mib file based on criterion." `"Add new tables and leaf nodes.
                       Modify the mib file based on criterion." `"Add new tables and leaf nodes.
                       Modify the mib file based on criterion." `"Add new tables and leaf nodes.
                       Modify the mib file based on criterion." P"add:   zxr10QosMIB
                       Initial version of this MIB module."                       "Match DSCP table"                       ""Set DSCP value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "rgdscp"                       "Select DSCP as match criteria"                       /"DSCP value or range(max num:4;spacing mark:,)"                       "Match MPLS-EXP table"                        "Set MPLS-EXP as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "rgmplsExp"                       #"Select MPLS-EXP as match criteria"                       3"MPLS-EXP value or range(max num:4;spacing mark:,)"                       "Match IP Precedence table"                       +"Set IP Precedence value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "rgprec"                       ("Select IP-Precedence as match criteria"                       J"IP Precedence value or range(max num:4;spacing mark:,)
                "                       "Match inner-VLAN table"                       ("Set inner-VLAN value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       
"rginVlan"                       %"Select inner-VLAN as match criteria"                       D"In-VLAN value or range(max num:4;spacing mark:,)
                "                       "Match outer-VLAN table"                       ("Set outer-VLAN value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "rgoutVlan"                       %"Select outer-VLAN as match criteria"                       E"Out-VLAN value or range(max num:4;spacing mark:,)
                "                       "Match inner 802.1p table"                       *"Set inner 802.1p value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "rgin8021p"                       '"Select inner 802.1p as match criteria"                       E"In8021p value or range (max num:4;spacing mark:,)
                "                       "Match  outer 802.1p table"                       *"Set outer 802.1p value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "rgout8021p"                       '"Select outer 802.1p as match criteria"                       F"Out8021p value or range (max num:4;spacing mark:,)
                "                       "Match interface table"                       &"Set interface name as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "WORD Name of the interface"                       "tag"                       )"Select interface name as match criteria"                       "Match qos-group table"                       "Set qos id as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       $"Select qos-group as match criteria"                        "<1-65535> Set qos-group number"                       "Match vrf name table"                        "Set vrf name as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "WORD Vrf Name"                       #"Select vrf name as match criteria"                       "Match unicast table"                       "Set unicast as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       ""Select unicast as match criteria"                       �"1  Specify the high priority of queue
                 2  Specify the middle priority of queue
                 3  Specify the normal priority of queue
                 4  Specify the low priority of queue"                       "Match multicast table"                       '"Set multicast value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       $"Select multicast as match criteria"                       �"1  Specify the high priority of queue
                 2  Specify the middle priority of queue
                 3  Specify the normal priority of queue
                 4  Specify the low priority of queue"                       "Match mac-address table"                       )"Set mac-address value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "Set mac-address"                       &"Select mac-address as match criteria"                       "Match child table"                       "Set child as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "Set the mark of null class"                       "Match ipv4-access-list table"                       %"Set IPv4 ACL name as match criteria"                       "WORD Name of the class map"                       #"WORD Select ipv4-access-list name"                       +"Select ipv4-access-list as match criteria"                       "Match ipv6-access-list table"                       %"Set IPv6 ACl name as match criteria"                       "WORD Name of the class map"                       #"WORD Select ipv6-access-list name"                       +"Select ipv6-access-list as match criteria"                       "Match VPWS Table"                       '"Set VPWS name value as match criteria"                       "WORD Name of the class map"                       -"Select VPWS instance name as match criteria"                       +"Vpn id, which is copyed from VPWS object."                       "Match VPLS Table"                       !"Set VPLS name as match criteria"                       "WORD Name of the class map"                       -"Select VPLS instance name as match criteria"                       *"Vpn id, which is copyed from VPLS object"                       "Match PHB Table"                        "Set PHB info as match criteria"                       "WORD Name of the class map"                       "Select PHB as match criteria"                       "service class"                       "Match link-access-list table"                       %"Set link ACL name as match criteria"                       "WORD Name of the class map"                       #"WORD Select link-access-list name"                       +"Select link-access-list as match criteria"                       "Match DSCP reserved-key table"                       %"Configure DSCP in the manner of PHB"                       "WORD Name of the class map"                       !"DSCP value in the manner of PHB"                       "DSCP reserved-words mark"                       "Match DSCP table"                       ""Set DSCP value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "rgdscp"                       "Select DSCP as match criteria"                       /"DSCP value or range(max num:4;spacing mark:,)"                       o"0 Packets based on IP any
                 1 Packets based on IPv4
                 2 Packets based on IPv6"                       "DSCP value not flag"                       "Match DSCP reserved-key table"                       %"Configure DSCP in the manner of PHB"                       "WORD Name of the class map"                       !"DSCP value in the manner of PHB"                       "DSCP reserved-words mark"                       o"0 Packets based on IP any
                 1 Packets based on IPv4
                 2 Packets based on IPv6"                       "Match IP Precedence table"                       +"Set IP Precedence value as match criteria"                       :"strCMapName
                 WORD Name of the class map"                       "rgprec"                       ("Select IP-Precedence as match criteria"                       J"IP Precedence value or range(max num:4;spacing mark:,)
                "                       o"0 Packets based on IP any
                 1 Packets based on IPv4
                 2 Packets based on IPv6"                       "IP Precedence value not flag"                       "Class Map table"                       "H-QoS class map"                       "WORD Name of the class map"                       u"match-all Packets meet all of the match criteria
                 match-any Packets meet any of the match criteria"                       I"ipv4 Packets based on IPv4
                 ipv6 Packets based on IPv6"                      �"The flag of configruing match type:
                bit0: dscp
                bit1: mplsexp
                bit2: precedence
                bit3: invlan
                bit4: outvlan
                bit5: in8021p
                bit6: out8021p
                bit7: interface
                bit8: qosgroup
                bit9: vrf
                bit10: unicast
                bit11: multicast
                bit12: mac address
                bit13: child
                bit14: ipv4 acl
                bit15: ipv6 acl
                bit16: vlss
                bit17: vpws
                bit18: vpls
                bit19: dpi
                bit20: serv class
                bit21: link acl
                bit22: dscp ex"                       �"The mode type of class-map.
                  0  Class map based on normal
                  1  Class map based on phb
                  2  Class map based on sub-interface
                  3  Class map based on switch-fabric"                               "POLICY CLASS TABLE"                       " H-QoS policy class"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       "PMAP CLASS-DEFAULT TABLE"                       " H-QoS policy class-default"                       "WORD Name of the policy map"                       "Specify the default class"                       "BANDWIDTH TABLE"                       ""Set minimum guaranteed bandwidth"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       ,"<1-100> Set the exact bandwidth percentage"                       *"<1-100> Select percent as bandwidth unit"                       "PMAP HPOLICY TABALE"                       !"Set hierarchical service policy"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       &"WORD Name of the hierarchical policy"                       "Specify the hqos"                       "PMAP CAR TABLE"                       "Set traffic policing"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       *"Set the CIR value in kilobits per second"                       V"For CAR:Set the CBS value in bytes
                 For TP :Set the CBS value in KB"                       *"Set the PIR value in kilobits per second"                       V"For CAR:set the PBS value in bytes
                 For TP :set the PBS value in KB"                       "Specify the CAR"                       
"PQ TABLE"                       "Set PQ priority level"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       $"<1-4> Set the priority level of PQ"                       "Specify PQ"                       "LLQ TABLE"                       "Set LLQ priority"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       "Specify LLQ"                       "PMAP_WRED_ENABLE"                       "Enable WRED"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       "Specify WRED enable"                       "PMAP_WRED_WEIGHT TABLE"                       $"Set WRED exponential weight factor"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       ("Specify WRED exponential weight factor"                       6"<1-16> Exponent used in weighted average calculation"                       "PMAP_WRED_PREC_VALU TABLE"                       "PMAP_WRED_PREC_VALU"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       #"<0-7> Set the IP-Precedence value"                       4"<1-1024000> Set the minimum threshold in kilobytes"                       4"<1-1024000> Set the maximum threshold in kilobytes"                       *"<1-100> Set mark probability denominator"                       "PMAP_SET_PREC TABLE"                       "PMAP_SET_PREC"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       "bprec"                       "wprec"                       "ucinheritFrom"                       
"binherit"                       "PMAP_SET_MPLS"                       "PMAP_SET_MPLS"                       "strPMapName"                       "strCMapName"                       ."bClassDefault
                class-default"                       
"bmplsExp"                       
"wmplsExp"                       "ucinheritFrom"                       
"binherit"                       "PMAP_SET_DSCP"                       "PMAP_SET_DSCP"                       "strPMapName"                       "strCMapName"                       "class-default"                       "bdscp"                       "wdscp"                       "ucinheritFrom"                       
"binherit"                       "PMAP_SET_8021P"                       "PMAP_SET_8021P"                       "strPMapName"                       "strCMapName"                       "class-default"                       "b8021p"                       "w8021p"                       "ucheritFrom"                       
"binherit"                        "PMAP_BANDWIDTH_REMAINING TABLE"                       "Set leftover bandwidth"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       !"Specify the bandwidth-remaining"                       '"<1-100> Set the guaranteed percentage"                       "PMAP_SET_MARK TABLE"                       L"Mark a packet,802.1p or
                DSCP or MPLS-EXP or IP Precedence"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       �"precedence Select precedence as mark type
                 mpls_exp   Select MPLS-EXP as mark type
                 dot1p      Select 802.1p as mark type
                 dscp       Select DSCP as mark type"                       "Set the mark value"                       �"dot1p      Select 802.1p as source inherit
                 dscp       Select dscp as source inherit
                 mpls_exp   Select MPLS-EXP as source inherit
                 precedence Select precedence as source inherit"                       "Specify the inherit"                       f"inner or outer flag.
                 0 is outer flag.
                 1 is inner and outer flag."                       "WRED COLOR TABLE"                        "WRED thresholds based on color"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       f"green   Green packets
                 yellow  Yellow packets
                 red     Red packets"                       )"Configure WRED thresholds based on colo"                       4"<1-1024000> Set the minimum threshold in kilobytes"                       4"<1-1024000> Set the maximum threshold in kilobytes"                       *"<1-100> Set mark probability denominator"                       "Shape TABLE"                       ("Set the flow shape based on policy-map"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       R"peak   Set peak as shape type
                average Set average as shape type"                       '"<1-100> Set the exact rate percentage"                       6"<1-4294967295> Set the average or peak  rate in kbps"                       6"<1-4294967295> Set the average or peak  rate in kbps"                       8"<1-4294967295> Set the be value in kilobits per second"                       "MAP TABLE"                       "Set the packet level"                       "WORD Name of the policy map"                       "WORD Name of the class"                       "Specify the default class"                       z"1 High priority
                 2 Middle priority
                 3 normal priority
                 4 Low priority"                       
"Map sign"                       "POLICY MAP table"                       " H-QoS policy map"                       "WORD Name of the policy map"                       �"The type of policy-map.
                 0    normal type
                 1    car-action type
                 2    phb-based type
                 3    sub-interface-based type
                 4    switch-fabric-based type"                               "WORD Name of the policy map"                       "SERVICE POLICY TABLE"                       ."Configure H-QoS policy bind on the interface"                       &"WORD Name of the attaching interface"                       b"input  Attaches to the input interface
                 output Attaches to the output interface"                       �"normal    Set policies bound on link-ports with normal
                 overwrite Set policies bound on link-ports with overwrite
                 append    Set policies bound on link-ports with append"                       "WORD Name of the policy map"                       �"Set statistical-share.
                0   statistical-share is not configured
                1   statistical-share is configured"                       "SWITCH_FABRIC TABLE"                       +"Configure H-QoS switch fabric policy bind"                       "Specify the shelf"                       "Specify the slot"                       "Specify the mode"                       9"Specify the subslot
                 Invalid value:255"                       6"Specify the port
                 Invalid value:255"                       "Name of the policy"                           "TRAFFIC SHAPE TABLE"                       *"Configure traffic shape on the interface"                       &"WORD Name of the attaching interface"                       *"<8-10000000> Rate in kilobits per second"                        "<2-250000000> Burst size in KB"                       '"<2-250000000> Excess burst size in KB"                           "TRAFFIC SHAPE DIRECTION TABLE"                       8"Configure traffic shape on the interface and direction"                       &"WORD Name of the attaching interface"                       '"input Attaches to the input interface"                       *"<8-10000000> Rate in kilobits per second"                        "<2-250000000> Burst size in KB"                       '"<2-250000000> Excess burst size in KB"                                                  