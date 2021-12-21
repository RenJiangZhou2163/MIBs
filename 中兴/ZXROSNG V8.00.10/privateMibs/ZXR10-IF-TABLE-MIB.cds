e--  ************************************************
--  $Id: ZXR10-ETH-MGT.mib 12 2005-07-13 01:01:17Z taowq $
--
--  ZXR10-ETH-MGT.mib: ZXR10 ethnet query and  configuration MIB file
--  
--  Jun. 2005, Tao wenqiang
--   
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
   �" A BwType value of 1234 be rendered as '1.234'.It needs
                       webmaster software parse the clause 'DISPLAY-HINT' to 
                       render 1234 as 1.234."                                                                                                     2"ZXROS v4.6.03 ethnet query and configuration MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201904020900Z" "201901090900Z" "201805160900Z" "201802060900Z" "201606010900Z" "201601180900Z" "201507151521Z" "201503141650Z" "201403200900Z" "201402190900Z" "201402111600Z" "201401130900Z" "201312090900Z" "201311080900Z" "201305031600Z" "201304160900Z" "201304091600Z" "201304020900Z" "201303151140Z" "200504120000Z" �"Change the MAX-ACCESS of node zxr10IfGroupBindGroupName from read-create to read-only.
      Change the MAX-ACCESS of node zxr10IfCipBindPhyName from read-create to read-only." �"Change the SYNTAX of node zxr10IfCfgMtu from Unsigned32(0..9600) to Unsigned32(0..9700).
      Change the SYNTAX of node zxr10IfEffectiveMtu from Unsigned32(0..9600) to Unsigned32(0..9700)." j"Change the SYNTAX of node zxr10IfCfgDescr from DisplayString(SIZE(0..104) to DisplayString(SIZE(0..238)." S"Add TruthValue of node zxr10IfCfgMacAddressAnycast to the Zxr10IfEntry mib table."�"Change the SYNTAX of node zxr10IfCfgMtu from Unsigned32(1500..9600) to Unsigned32(0..9600).
      Change the SYNTAX of node zxr10IfEffectiveMtu from Unsigned32(1500..9600) to Unsigned32(0..9600).
      Change the SYNTAX of node zxr10IfCfgIpMtu from Unsigned32(68..9600) to Unsigned32(0..9600).
      Change the SYNTAX of node zxr10IfEffectiveIpMtu from Unsigned32(68..9600) to Unsigned32(0..9600)." �"Change the SYNTAX of node zxr10IfCfgUnnumberName from DisplayString(SIZE(1..31)) to DisplayString(SIZE(0..31)).
      Change the SYNTAX of node zxr10IfCfgDescr from DisplayString(SIZE(1..104)) to DisplayString(SIZE(0..104))." a"Add SYNTAX of node zxr10IfTriggerTrackTrigger with the value reverse(4) in zxr10IfTriggerTable.""Add node zxr10IfCfgDescr in zxr10IfTable.
     Change MAX-ACCESS of node zxr10IfCfgMtu from read-only to read-create.
     Change MAX-ACCESS of node zxr10IfCfgIpMtu from read-only to read-create.
     Change MAX-ACCESS of node zxr10IfCfgMplsMtu from read-only to read-create.
     Change SYNTAX of node zxr10IfCfgMtu and zxr10IfEffectiveMtu from Unsigned32(1500..9216) to Unsigned32(1500..9600).
     Change SYNTAX of node zxr10IfCfgIpMtu and zxr10IfEffectiveIpMtu from Unsigned32(68..9216) to Unsigned32(68..9600).
     Change SYNTAX of node zxr10IfCfgIpv6Mtu and zxr10IfEffectiveIpv6Mtu from Unsigned32(1280..9216) to Unsigned32(1280..9600).
     Change SYNTAX of node zxr10IfCfgMplsMtu and zxr10IfEffectiveMplsMtu from Unsigned32(68..9216) to Unsigned32(68..9600)." ?"Add node zxr10IfTriggerShutDownPeriod in zxr10IfTriggerTable." ."IP unnumbered support set operation for SNMP" F"Add a enum value for node zxr10IfAttrIfL2L3Attr in zxr10IfAttrTable." ."Change the description of zxr10IPv6AddrType." "Add zxr10IPv6AddrTable." R"Add interface trigger for SNMP according with CLI. 
      Add zxr10IfCommonMIB." f"Change syntax value for some nodes in zxr10IfTable.
      Add units for some nodes in zxr10IfTable." �"Changes zxr10IfTrackTable index.Our equipments now support 
      track instances with different types on the same interface." �"Add a enum value for node zxr10IfCfgIpLdshPolicy in zxr10IfTable 
      and change the default value from {2} to {per_destination}.
      Add a enum value for node zxr10IfCfgGateWay in  zxr10IfTable and
      set the value as default value." �"Add interface items for SNMP according with CLI.
      Add zxr10IfGroupBindTable and zxr10IfCipBindTable 
      and correct the non-compliant description." E"Index of zxr10IfTable is changed from zxr10IfIfName to zxr10IfName." ""                   g"The value of sysUpTime on the most recent occasion at which 
                interface table changed"                       t"The value of sysUpTime on the most recent occasion at which 
                ethernet sub-interface table changed"                       q"The value of sysUpTime on the most recent occasion at which  
                ethernet interface table changed"                       l"The value of sysUpTime on the most recent occasion at which  
                pos interface table changed"                       "Interface attribute table"                       ""                       "Interface name"                       "Interface index"                       "Interface L2/L3 attribute"                       "Interface table"                       ""                       "Interface name"                       "Interface index"                       f"Interface configured card mtu.
             Different configuration ranges in different interfaces."                       a"Interface effective card mtu.
             Different effective ranges in different interfaces."                       d"Interface configured ip mtu.
             Different configuration ranges in different interfaces."                       _"Interface effective ip mtu.
             Different effective ranges in different interfaces."                       f"Interface configured ipv6 mtu.
             Different configuration ranges in different interfaces."                       a"Interface effective ipv6 mtu.
             Different effective ranges in different interfaces."                       f"Interface configured mpls mtu.
             Different configuration ranges in different interfaces."                       a"Interface effective mpls mtu.
             Different effective ranges in different interfaces."                       #"Interface configured mac-address."                       ""Interface effective mac-address."                       i"Interface configured mac offset.
             The range of macoffset is alterable,it is decided by pm."                       "Interface vrf name."                       "Interface ip unnumber name."                       -"Interface configured load sharing priority."                       �"Interface configured load sharing waterline.
             The waterline is an option attribute,
             if only when you have set the attribute priority 
             then you can set waterline."                       ."Interface configured load sharing bandwidth."                       -"Interface effective load sharing bandwidth."                       ."Interface configured ip load sharing policy."                       ."Interface configured mulitpule sharing cost."                       6"Interface configured whether it's gateway interface."                       �"A textual string containing information about the
             interface.  This string may be set by the network
             management system."                       D"The flag of the interface effective mac-address is anycast or not."                       m"Row status.active(1),notInService(2),notReady(3),createAndGo(4),
             createAndWait(5),destroy(6)."                       "Interface track table"                       $"A list of interface track entries."                       "Interface name"                       "Track name"                       "Interface index"                       �"Track type: 
            l2(1)   --zxr10IfTrackTrackName is l2 track 
            ipv4(2) --zxr10IfTrackTrackName is ipv4 track
            ipv6(3) --zxr10IfTrackTrackName is ipv6 track
            "                       �"Group track flag:
            false(0) --zxr10IfTrackTrackName is not group track 
             true(1) --zxr10IfTrackTrackName is group track
             "                                               ,"A list of interface group binding entries."                       l"An entry containing management information applicable to a
            particular interface binded group."                       +"The textual name of the member interface."                       *"The textual name of the interface group."                                "A list of cip binding entries."                       T"An entry containing objects for binding interface on a cip
            interface."                       ("The textual name of the cip interface."                       0"The textual name of the cip binding interface."                                                   "Interface trigger table"                       &"A list of interface trigger entries."                       "Interface name"                       "Track name"                       "Interface index"                      �"Track trigger: 
            block(1)       --whether or not to block the interface according  
                             to track status.
            shutdown(2)    --whether or not to shutdown the interface according 
                             to track status.
            none(3)        --no configuration of track trigger.  
            reverse(4)     ----whether or not to make the  
                           --interface physical down according to track status
            "                       �"Group track flag:
            true(1)  --zxr10IfTriggerTrackName is group track.
            false(2) --zxr10IfTriggerTrackName is not group track. 
            "                       )"The time of keeping the port shutdown. "                               "Ipv6 address config table."                       ""                       "Interface Index"                       "Interface name"                       %"The ipv6 address on this interface "                       '"The length of the ipv6 address prefix"                      >"The type of the ipv6 address:
            linklocal(1)  --linklocal address
            eui-64(2)     --eui-64 address
            anycast(3)    --anycast address
            unicast(4)    --unicast address
         If the result is 0,interface exist and support this node,
         but configuration is empty."                                      