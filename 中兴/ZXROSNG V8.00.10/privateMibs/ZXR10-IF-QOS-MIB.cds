 �--*****************************************************************
--ZXR10-IF-QOS-MIB
--OAM
--2011-8-5 9:35
--
--
--Copyright (c) 1985-2011 by ZTE Corp.
--All rights reserved.
--*****************************************************************
  �"server class of PHB info ,see below:
             be  Best effort
             af1 Assured forwarding class 1
             af2 Assured forwarding class 2
             af3 Assured forwarding class 3
             af4 Assured forwarding class 4
             ef  Expedited forward
             cs6 Internetwork control service class
             cs7 Network control service class"               �"Color of PHB info, see below:
             green   Green packets
             yellow  Yellow packets
             red     Red packets"                                         1"The MIB module to describe the IF QoS protocol." ^"       Hu Jun
            Tel:    +86-25-52870000
            E-Mail: hu.jun11@zte.com.cn " "201408250910Z" "201307231420Z" "201106270000Z" )"Modify the mib file based on criterion." U"Add new leaf nodes.
                       Modify the mib file based on criterion." R"add:   zxr10IfQosMIB
                       Initial version of this MIB module."               "QOS_DOT1P TABLE"                       !"802.1p inherit on the interface"                       &"WORD Name of the attaching interface"                       +"Inherit from ingress 802.1p on inner VLAN"                       
"bSvlanIn"                       	"bOutput"                       "TTL_QOS_MODE TABLE"                        "TTL duplicate on the interface"                       &"WORD Name of the attaching interface"                       H"pipe    Select pipe mode
                 uniform Select uniform mode"                       "MLS_QOS_MODE TABLE"                       #"Priority inherit on the interface"                       &"WORD Name of the attaching interface"                       �"pipe       Select pipe inherit mode
                 short_pipe Select short-pipe inherit mode
                 uniform    Select uniform inherit mode"                      �"service class:
                server class of PHB info ,see below:
                be  Best effort
                af1 Assured forwarding class 1
                af2 Assured forwarding class 2
                af3 Assured forwarding class 3
                af4 Assured forwarding class 4
                ef  Expedited forward
                cs6 Internetwork control service class
                cs7 Network control service class"                       |"color:
                green   Green packets
                yellow  Yellow packets
                red     Red packets"                       "QOS_DOT1P TABLE"                       !"802.1p inherit on the interface"                       &"WORD Name of the attaching interface"                       +"Inherit from ingress 802.1p on inner VLAN"                       
"bSvlanIn"                       	"bOutput"                       *"Inherit from egress 802.1p on inner VLAN"                                                  