 �--  ZXR10-DHCP-SNOOPING-MIB.mib: ZXR10 DHCP snooping MIB file
--  
--  Dec. 2005,
--   
--  Copyright(c) 2005 by ZTE Corporation
--  All rights reserved
--
--  ************************************************
                                                                         8"The MIB module to describe the DHCP Snooping protocol." s"       Xiao Nian kun
         Tel : +86-25-52870000        
         E-Mail: xiao.niankun@zte.com.cn
         " "201812121400Z" "201808161000Z" p"Modify: Add enumeration value of node dhcpv4SnoopingOptionpolicy 
             and dhcpv4SnoopingIfOptPolicy."N"Add enumeration value of node dhcpv4SnoopingOptionFormat, 
             dhcpv4SnoopingIfOptFormat and dhcpv4SnoopingIfOptPolicy, 
             modify enumeration definition of node
             dhcpv4SnoopingOptionUserCfgPolicy, dhcpv4SnoopingOptionFormat,
             dhcpv4SnoopingIfTrustStatus and dhcpv4SnoopingIfOptFormat."               �"Function of DHCPv4 snooping is available,
             enable: receive the DHCPv4 packets,
             disable: discard the DHCPv4 packets."                       ;"The maximum user of the switch, it ranges from 1 to 2048."                       &"Function of ramble is opened or not."                       *"Function of MAC-verify is opened or not."                       "The option82 format."                       ("Whether the option82 is enable or not."                       O"Whether the content of the option82 should be replaced or stripped by switch."                       "The string of the remote-id."                       "The string of the circuit-id."                       '"The string of access-node-identifier."                       j"The policy of user-cfg includes 3 types of way which are based on 
            interface, global, VLAN."                       +"The current number of user who is online."                       x"This object indicates the time interval at which DHCP bindings 
            information will be written to the flash."                       �"This object indicates the time interval at which DHCP bindings 
            information will be written to the database file denoted by 
            cdsDatabaseFile object."                       :"The table includes DHCPv4 snooping parameters of option."                       9"An entry includes DHCPv4 snooping parameters of option."                       
"VLAN ID."                       �"Function of DHCPv4 snooping is opened under VLAN,
             enable: receive the DHCPv4 packets,
             disable: discard the DHCPv4 packets."                       "The string of remote-id."                       "The string of the circuit-id."                       X"The table includes DHCPv4 snooping running parameters of each 
            interface."                       W"An entry includes DHCPv4 snooping running parameters of each 
            interface."                      "The index value that uniquely identifies the interface to
            which this entry is applicable. The interface identified by
            a particular value of this index is the same interface as
            identified by the same value of the IF-MIB's ifIndex."                       "name of the interface "                       �"The trust status of the interface,  
           dhcpv4Untrust(0): discard DHCPv4 adv/reply packet,
           dhcpv4Trust(1): permit DHCPv4 adv/reply packet.
           "                       B"The max quota number of the interface, it ranges from 1 to 2048."                       ?"The current number of user under the interface who is online."                       "The string of remote-id."                       "The string of the circuit-id."                       �"This object indicates rate limit value for DHCP snooping
        purpose. If the value of this object is 0, no rate limit is
        applied for DHCP traffic at this interface."                       D"This object indicates sleep limit value for DHCP snooping purpose."                       X"The table includes DHCPv4 snooping running parameters of each 
            interface."                       W"An entry includes DHCPv4 snooping running parameters of each 
            interface."                      "The index value that uniquely identifies the interface to
            which this entry is applicable. The interface identified by
            a particular value of this index is the same interface as
            identified by the same value of the IF-MIB's ifIndex."                       "Name of the interface."                       
"VLAN ID."                       �"disable: the option82 function is unavailable, 
            enable: the option82 function is available based on Port+VLAN.     
           "                       "The option82 format."                       �"disable: the option82 can't be inserted under interface module,
           enable: the option82 can be inserted based on interface module.
           "                       "The reforwarding policy."                       "The string of remote-id."                       "The string of the circuit-id."                       j"The binding state table containing the state of binding 
            between source address and anchor."                       C"MAC, VLAN and VPN is the key to locate the user-bind information."                       /"The unique value generated for the interface."                       "Name of the interface."                        "The binding source IP address."                       !"The binding source MAC address."                       !"The state of the binding entry."                       �"The remaining lifetime of the entry. 
           If saviObjectsBindingType=static, a value of 2147483647 
           represents infinity."                       ""VLAN ID that the user belong to."                       "Name of the VPLS."                       j"The binding state table containing the state of binding 
            between source address and anchor."                       C"MAC, VLAN and VPN is the key to locate the user-bind information."                       /"The unique value generated for the interface."                       "Name of the interface."                        "The binding source IP address."                       !"The binding source MAC address."                       !"The state of the binding entry."                       �"The remaining lifetime of the entry. 
           If saviObjectsBindingType=static, a value of 2147483647 
           represents infinity."                       ""VLAN ID that the user belong to."                       "Name of the VPLS."                       9"The table includes DHCPv4 snooping file server address."                       1"An entry includes DHCPv4 snooping file address."                       "The type of the server."                       "The IPv6 address flag."                       "VRF name."                       "Server URL address."                          