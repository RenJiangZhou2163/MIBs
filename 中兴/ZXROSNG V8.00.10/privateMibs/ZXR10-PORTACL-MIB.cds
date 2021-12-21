]--  ******************************************************
--  $Id: ZXR10-PORT-ACL-MIB.mib 2010-09-25  liulele $
--
--  ZXR10-PORT-ACL-MIB: ZXR10 T8000 Port Access List MIB file
--  
--  Sep. 2010, liu lele 
--   
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--  ******************************************************
   "ingress = 1,egress = 2."                                                                 3"The MIB module to describe the PORT-ACL protocol." ^"       Hu Jun
            Tel:    +86-25-52870000
            E-Mail: hu.jun11@zte.com.cn " "201611211400Z" "201603011400Z" "201512161400Z" "201311291400Z" "201009250000Z" �"Add new tables:
          1.zxr10IPv4PortACLMultiTable
          2.zxr10V4VxlanPortACLMultiTable
          3.zxr10IPv4VlanACLMultiTable
          4.zxr10V4VxlanVlanACLMultiTable." �"Add new tables:
          1.zxr10IPv4VxlanPortACLTable
          2.zxr10VxlanV4DeviceACLTable
          3.zxr10VxlanV4ACLVxlanTable
          4.zxr10VxlanV4ACLVlanTable."" Add new tables:
              1. zxr10IPv4DeviceACLTable
              2. zxr10IPv6DeviceACLTable
              3. zxr10LinkDeviceACLTable
              4. zxr10IPv4MixedDeviceACLTable
              5. zxr10IPv6MixedDeviceACLTable
              6. zxr10UsrDefDeviceACLTable" �" 1. Modify document to meet the standard format
              2. Add definition about MODULE-IDENTITY
              3. Add a new table :zxr10IPv4PortACLlogTable" G"add:   zxr10PortACL
             Initial version of this MIB module."               "IPv4 Port ACL Table"                       "IPv4 Port ACL"                       S"fei-        Fast ethernet interface
   
             vlan        Vlan interface"                       "Index of the interface"                       X"egress   Filters on outbound packets
             ingress  Filters on inbound packets"                       5"WORD  Name of an IPv4 access list (1-31 characters)"                       T"createAndGo(4)  Configure IPv4 Port ACL 
        destroy(6)  Delete IPv4 Port ACL"                       "IPv6 Port ACL Table"                       "IPv6 Port ACL"                       S"fei-        Fast ethernet interface
   
             vlan        Vlan interface"                       "Index of the interface"                       X"egress   Filters on outbound packets
             ingress  Filters on inbound packets"                       5"WORD  Name of an IPv6 access list (1-31 characters)"                       T"createAndGo(4)  Configure IPv6 Port ACL 
        destroy(6)  Delete IPv6 Port ACL"                       "Link Port ACL Table"                       "Link Port ACL"                       S"fei-        Fast ethernet interface
   
             vlan        Vlan interface"                       "Index of the interface"                       X"egress   Filters on outbound packets
             ingress  Filters on inbound packets"                       4"WORD  Name of a link access list (1-31 characters)"                       T"createAndGo(4)  Configure Link Port ACL 
        destroy(6)  Delete Link Port ACL"                       "IPv4 Mixed Port ACL Table"                       "IPv4 Mixed Port ACL"                       S"fei-        Fast ethernet interface
   
             vlan        Vlan interface"                       "Index of the interface"                       X"egress   Filters on outbound packets
             ingress  Filters on inbound packets"                       ;"WORD  Name of an IPv4 mixed access list (1-31 characters)"                       _"createAndGo(4)  Configure IPv4 Mixed Port ACL
        destroy(6)  Delete IPv4 Mixed Port ACL"                       "IPv6 Mixed Port ACL Table"                       "IPv6 Mixed Port ACL"                       S"fei-        Fast ethernet interface
   
             vlan        Vlan interface"                       "Index of the interface"                       X"egress   Filters on outbound packets
             ingress  Filters on inbound packets"                       ;"WORD  Name of an IPv6 mixed access list (1-31 characters)"                       d"createAndGo(4)  Configure IPv6 Mixed Port ACL
             destroy(6)  Delete IPv6 Mixed Port ACL"                       1"IPv4 VXLAN access list bind to interface table."                       "IPv4 VXLAN Port ACL"                       "Interface name"                       �"The node have two values:
             1.egress   Filters on outbound packets(2),
             2.ingress  Filters on inbound packets(1)."                       $"Name of an IPv4 VXLAN access list."                       e"createAndGo(4)  Configure IPv4 VXLAN Port ACL,
             destroy(6)  Delete IPv4 VXLAN Port ACL."                       "IPv4 Port ACL log Table"                       "IPv4 Port ACL log"                       Q"fei-        Fast ethernet interface   
             vlan        Vlan interface"                       X"egress   Filters on outbound packets
             ingress  Filters on inbound packets"                       >"rule
             <1-2147483644>  (Optional)ID of this rule"                       "Index of the interface"                       5"WORD  Name of an IPv4 access list (1-31 characters)"                       �"Rule hits of matching packets on the interface,
             Maximum(18446744073709551615): invalid log statistics
             because of lack of counter resources in PM"                       "IPv4 Device ACL Table"                       "IPv4 Device ACL"                       ^"egress   Filters on outbound packets(0)
             ingress  Filters on inbound packets(1)"                       5"WORD  Name of an IPv4 access list (1-31 characters)"                       "IPv6 Device ACL Table"                       "IPv6 Device ACL"                       ^"egress   Filters on outbound packets(0)
             ingress  Filters on inbound packets(1)"                       5"WORD  Name of an IPv6 access list (1-31 characters)"                       "Link Device ACL Table"                       "Link Device ACL"                       ^"egress   Filters on outbound packets(0)
             ingress  Filters on inbound packets(1)"                       4"WORD  Name of a Link access list (1-31 characters)"                       "IPv4 Mixed Device ACL Table"                       "IPv4 Mixed Device ACL"                       ^"egress   Filters on outbound packets(0)
             ingress  Filters on inbound packets(1)"                       ;"WORD  Name of an IPv4 Mixed access list (1-31 characters)"                       "IPv6 Mixed Device ACL Table"                       "IPv6 Mixed Device ACL"                       ^"egress   Filters on outbound packets(0)
             ingress  Filters on inbound packets(1)"                       ;"WORD  Name of an IPv6 Mixed access list (1-31 characters)"                       "User Defined Device ACL Table"                       "User Defined Device ACL"                       ^"egress   Filters on outbound packets(0)
             ingress  Filters on inbound packets(1)"                       ="WORD  Name of an User Defined access list (1-31 characters)"                       %"IPv4 VXLAN device access list table"                       "IPv4 VXLAN device ACL"                       �"The node have two values:
             1.egress   Filters on outbound packets(2),
             2.ingress  Filters on inbound packets(1)."                       $"Name of an IPv4 VXLAN access list."                       j"createAndGo(4)  Configure IPv4 VXLAN ACL device,
             destroy(6)  Delete IPv4 VXLAN ACL devcie."                       6"IPv4 VXLAN access list bind to VXLAN instance table."                       0"IPv4 VXLAN access list bind to VXLAN instance."                       
"VXLAN id"                       �"The node have two values:
             1.egress   Filters on outbound packets(2),
             2.ingress  Filters on inbound packets(1)."                       $"Name of an IPv4 VXLAN access list."                       �"createAndGo(4)  Configure IPv4 VXLAN ACL to VXLAN instance,
             destroy(6)  Delete IPv4 VXLAN ACL from VXLAN instance."                       2"IPv4 VXLAN access list bind VLAN instance table."                       ,"IPv4 VXLAN access list bind VLAN instance."                       	"VLAN id"                       �"The node have two values:
             1.egress   Filters on outbound packets(2),
             2.ingress  Filters on inbound packets(1)."                       $"Name of an IPv4 VXLAN access list."                       �"createAndGo(4)  Configure IPv4 VXLAN ACL in vlan instance,
             destroy(6)  Delete IPv4 VXLAN ACL from vlan instance."                       4"Multiple IPv4 access list bind to interface table."                       "IPv4 Port ACL."                       "Interface name."                       �"The node have two values:
             1.egress   Filters on outbound packets(2),
             2.ingress  Filters on inbound packets(1)."                       "Sequence number."                       "Name of an IPv4 access list."                       Y"createAndGo(4)  Configure IPv4 Port ACL 
        destroy(6)      Delete IPv4 Port ACL."                       4"Multiple IPv4 access list bind to interface table."                       "IPv4 Port ACL."                       "Interface name."                       �"The node have two values:
             1.egress   Filters on outbound packets(2),
             2.ingress  Filters on inbound packets(1)."                       "Sequence number."                       $"Name of an IPv4 VXLAN access list."                       e"createAndGo(4)  Configure IPv4 VXLAN Port ACL 
        destroy(6)      Delete IPv4 VXLAN Port ACL."                       ,"IPv4 access list bind VLAN instance table."                       &"IPv4 access list bind VLAN instance."                       	"VLAN id"                       �"The node have two values:
             1.egress   Filters on outbound packets(2),
             2.ingress  Filters on inbound packets(1)."                       "Sequence number."                       "Name of an IPv4 access list."                       x"createAndGo(4)  Configure IPv4 ACL in vlan instance,
             destroy(6)      Delete IPv4 ACL from vlan instance."                       2"IPv4 VXLAN access list bind VLAN instance table."                       ,"IPv4 VXLAN access list bind VLAN instance."                       	"VLAN id"                       �"The node have two values:
             1.egress   Filters on outbound packets(2),
             2.ingress  Filters on inbound packets(1)."                       "Sequence number."                       $"Name of an IPv4 VXLAN access list."                       �"createAndGo(4)  Configure IPv4 VXLAN ACL in vlan instance,
             destroy(6)      Delete IPv4 VXLAN ACL from vlan instance."                      