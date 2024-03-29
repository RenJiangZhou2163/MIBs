�--  ************************************************************************************
--  $Id: ZXR10-DHCP-RELAY-SERVER-MIB.mib 13 2010-12-09 01:01:26Z suqing $
--
--  ZXR10-DHCP-RELAY-SERVER-MIB.mib:  ROSNG DHCP RELAY AND SERVER Configuration MIB file
--  
--  Dec. 2010, Su Qing
--   
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--
--  *************************************************************************************
                                                                     "ROSNG 2.0 DHCP config MIB" �"ZTE Corporation 
             Nanjing Institute of ZTE Corporation
         
             No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
             Tel: +86-25-52870000" "201901230000Z" "201812240000Z" "201801230000Z" "201712260000Z" "201704180000Z" "201612060000Z" "201611160000Z" "201608230000Z" "201607050000Z" "201603160000Z" "201601050000Z" "201407090000Z" "201406060000Z" "201403110000Z" "201402180000Z" "201401170000Z" "201310240000Z" "201310140000Z" "201306240000Z" "201305240000Z" "201305060000Z" "201304010000Z" "201012250000Z"["Add a new table zxr10dhcpRlySvrGrpFwdTable for DHCP relay 
            information, here are five leaves under this table:
            zxr10dhcpRlySvrOnlineFwdAlg,
            zxr10dhcpRlySvrOnlineFwdRenew,
            zxr10dhcpRlySvrOnlineFwdRebind,
            zxr10dhcpRlySvrOnlineFwdRelease,
            zxr10dhcpRlySvrOnlineFwdDecline" P"Add a new leaf node zxr10dhcpPoolOptionFromReqPkt in zxr10dhcpPoolOptionTable." M"Add a new leaf node zxr10dhcpPoolCommLsTimSecond in zxr10dhcpPoolCommTable." I"Change SYNTAX of zxr10dhcpRelaySvrGrpDead from (5..3600) to (0..3600) ." +"Add a new INTEGER value in zxr10dhcpMode." Q"Add a new leaf zxr10dhcpRelaySvrGrpServerVrf in zxr10dhcpRelaySvrGrpServerTabl." T"Add a new leaf zxr10dhcpRelaySvrGrpServerPublic in zxr10dhcpRelaySvrGrpServerTabl."�"Add a new table zxr10dhcpPoolOption125Table for DHCP pool information,
            here are thirteen leaf under this table:
            zxr10dhcpPoolOpt125DhcpPoolName,
            zxr10dhcpPoolOption125code,
            zxr10dhcpPoolOption125SubOptCode,
            zxr10dhcpPoolOption125AsciiStr,
            zxr10dhcpPoolOption125HexStr,
            zxr10dhcpPoolOption125IpAddress1,
            zxr10dhcpPoolOption125IpAddress2,
            zxr10dhcpPoolOption125IpAddress3,
            zxr10dhcpPoolOption125IpAddress4,
            zxr10dhcpPoolOption125IpAddress5,
            zxr10dhcpPoolOption125IpAddress6,
            zxr10dhcpPoolOption125IpAddress7,
            zxr10dhcpPoolOption125IpAddress8" C"Add node zxr10dhcpRelayReportUserCfg in zxr10dhcpGlobalRelayConf.""1.Add node zxr10dhcpUpgradeLsTimDays in 
               zxr10dhcpGlobalCommConfig;
             2.Add node zxr10dhcpUpgradeLsTimHours in 
               zxr10dhcpGlobalCommConfig;
             3.Add node zxr10dhcpUpgradeLsTimMinutes in 
               zxr10dhcpGlobalCommConfig." O"Add a new leaf node zxr10dhcpPoolIgnoreRequestList in zxr10dhcpPoolCommTable."g"Add a new table zxr10dhcpRelayAgentIndexConfTable,
             here are six leaf under this table:
             zxr10dhcpRlyAgentIndexIfName,
             zxr10dhcpRlyAgentIndex,
             zxr10dhcpRlyAgentIndexIP,
             zxr10dhcpRlyAgentIndexOptCode,
             zxr10dhcpRlyAgentIndexOptType,
             zxr10dhcpRlyAgentIndexOptText." �"1.Change SYNTAX of zxr10dhcpRelaySvrGrpSvrIndex from (1..8)
             to (1..128);     
             2.Change SYNTAX of zxr10dhcpRelaySvrGrpServerIndex from (1..8)
             to (1..128)." �"1.Modify SYNTAX of zxr10dhcpRelayOpt82Policy,delete 
               drop(1) and rewrite(4);      
             2.Modify SYNTAX of zxr10dhcpRelayOpt82UserCfgPolicy,
               delete vlan(3)." �"1.Modify the node zxr10dhcpPoolCommIppoolName in 
               zxr10dhcpPoolCommTable,change this displayString 
               SIZE(0..16) to SIZE(0..32).""1.Modify the node zxr10dhcpRelaySvrGrpSvrMode in 
               zxr10dhcpRelaySvrGrpSvrTable,change the STATUS from current
               to obsolete;
             2.Modify the node zxr10dhcpRelaySvrGrpServerMode in 
               zxr10dhcpRelaySvrGrpServerTable,change the STATUS from current
               to obsolete;
             3.Add node zxr10dhcpRelayIfConfFwdMode in 
               zxr10dhcpRelayIfConfTable;
             4.Add node zxr10dhcpRelaySvrGrpLocalSvr in 
               zxr10dhcpRelaySvrGrpTable." �"1.Change length range of zxr10dhcpPoolOptionAsciiStr from (0..64)
             to (0..200);      
             2.Change length range of zxr10dhcpPoolOptionHexStr from (0..64)
             to (0..200)."<"1.Modify description of zxr10dhcpPoolCommLsTimMinute for 
               'DHCP pool leasetime minutes.';      
             2.Modify description of zxr10dhcpPoolStaticClientMask for
               'DHCP pool static user mask address.';
             3.Modify description of zxr10dhcpPoolStaticClientIp for
               'DHCP pool static user IP address.';
             4.Modify 'numbers' in description of zxr10dhcpRelayMaxUserCfg
               for 'number';
             5.Modify 'numbers' in description of zxr10dhcpRelayMaxUser
               for 'number'."W"1.Add one table for DHCP relay information:
               zxr10dhcpGlobalRelayConf;
             2.Add six table for DHCP pool information:
               zxr10dhcpPoolCommTable,zxr10dhcpPoolDnsTable,
               zxr10dhcpPoolDftRouterTable,zxr10dhcpPoolStaticTable,
               zxr10dhcpPoolOptionTable,zxr10dhcpPoolOpt212Table." ]"1.Add client mode for zxr10dhcpIfMode;
             2.Add zxr10dhcpRelaySvrGrpServerTable."j"As the revision of 201304010000Z which has not published was
             not designed well,this revision is added for modifing the last
             revision.
             1.Move zxr10dhcpAccListTable and zxr10dhcpAccListRuleTable
             from zxr10dhcpRelayConfig to zxr10dhcpGlobalCommConfig.
             2.Move zxr10dhcpRelayUserTable and zxr10dhcpRelayIfConfTable
             forward.
             3.Change data type of zxr10dhcpRelayUserMac from DisplayString
             to OCTET STRING.
             4.Change length range of zxr10dhcpRelayUserBoardName from (1..32)
             to (1..31).""Add one table for DHCP interface information:
             zxr10dhcpIfCommonTable,and add four tables for DHCP relay
             information:zxr10dhcpAccListTable, zxr10dhcpAccListRuleTable,
             zxr10dhcpRelayUserTable, zxr10dhcpRelayIfConfTable." :"This mib defines management information objects for DHCP"       -- Jan. 23, 2019
           "Enable DHCP process"                       "Enable DHCP user ramble"                       "Max hops of DHCP message"                       "Suppress DHCPNAK message"                       "DHCP upgrade leasetime days."                       "DHCP upgrade leasetime hours."                       !"DHCP upgrade leasetime minutes."                       "DHCP access list table."                       0"This list contains DHCP access list parameters"                       "DHCP access list name."                       -"DHCP access list default rule operate type."                       *"DHCP access list default rule date type."                       "DHCP access list rule table."                       5"This list contains DHCP access list rule parameters"                       "DHCP access list name."                       #"The DHCP access list rule number."                       P"The DHCP access list rule operate type is deny
                       or not."                       R"The DHCP access list rule operate type is permit
                       or not."                       4"The DHCP access list rule data type is any or not."                       Q"The DHCP access list rule data type is option60
                       or not."                       ,"The DHCP access list rule option60 string."                       U"The DHCP access list rule option60 is partial match
                       or not."                           $"DHCP configure table of interface."                       S"This list contains DHCP common parameters of user access 
             interface"                       "DHCP work mode."                       0"Specify quota of DHCP users on this interface."                       "DHCP server discover timer."                       "DHCP source mac check."                       ("DHCP configuration table of interface."                       R"This list contains DHCP common parameters of user access
             interface"                       "DHCP interface name."                       "DHCP work mode."                       0"Specify quota of DHCP users on this interface."                               Y"Max user number of DHCP relay, default value is set
                       by project."                       7"Forbid DHCP relay sends DHCPRELEASE to server or not."                       !"Set client lease time of proxy."                       "DHCP relay option82 format."                       ."Insert relay option82 or not in BOOTREQUEST."                       $"The option82 policy of DHCP relay."                       -"DHCP option82 policy of user configuration."                       -"The circuit-id subitem of uniform option82."                       ,"The remote-id subitem of uniform option82."                       1"Enable DHCP relay configurate source ip or not."                       "DHCP relay source ip."                       ,"Set the arp deadtime to dhcp lease or not."                       *"DHCP relay configure table of interface."                       C"This list contains DHCP relay parameters of user access interface"                       "DHCP relay agent ip address."                       '"Option82 circuit-id of the interface."                       &"Option82 remote-id of the interface."                       1"DHCP relay server group index of the interface."                       4"DHCP relay helper-address policy of the interface."                       "DHCP relay source ip."                        "DHCP relay server group table."                       7"This list contains DHCP relay server group parameters"                       !"DHCP relay server group number."                       $"DHCP relay server group algorithm."                        "Deadtime of DHCP relay server."                       4"Max retry times of DHCP relay server group server."                       )"Description of DHCP relay server group."                       #"DHCP relay switch to local server"                       '"DHCP relay server group server table."                       >"This list contains DHCP relay server group server parameters"                       "The server number."                       2"The IP address of the relay server group server."                       "The server mode."                        "The server is master or slave."                       '"DHCP relay server policy group table."                       >"This list contains DHCP relay server policy group parameters"                       #"Relay server policy group number."                       V"Relay server group number of this relay server policy
                       group."                       ."Vclass id of this relay server policy group."                       %"The start vlan id of internal vlan."                       %"The start vlan id of external vlan."                       #"The end vlan id of internal vlan."                       #"The end vlan id of external vlan."                       ,"DHCP relay server policy group vlan table."                       C"This list contains DHCP relay server policy group vlan parameters"                       '"Relay server policy group vlan index."                       %"The start vlan id of internal vlan."                       %"The start vlan id of external vlan."                       #"The end vlan id of internal vlan."                       #"The end vlan id of external vlan."                       "DHCP relay user table."                       /"This list contains DHCP relay user parameters"                       5"Board name of the slot on which DHCP relay user be."                       "DHCP relay user MAC."                       "DHCP relay user IP address."                       "DHCP relay user bind state."                       *"DHCP relay user remanent leasetime(sec)."                       ("DHCP relay user access interface name."                       "DHCP relay user VRF name."                       0"Number of the slot on which DHCP relay user be"                       ,"DHCP relay user total count on this board."                       ."DHCP relay configuration table of interface."                       C"This list contains DHCP relay parameters of user access interface"                       "DHCP interface name."                       "DHCP relay agent ip address."                       '"Option82 circuit-id of the interface."                       &"Option82 remote-id of the interface."                       1"DHCP relay server group index of the interface."                       4"DHCP relay helper-address policy of the interface."                       "DHCP relay source ip."                       )"DHCP access list name of the interface."                       "DSCP value of the interface."                       R"DHCP server relay destination UDP port of the
                       interface."                       "DHCP relay forward mode."                       9"DHCP relay agent algorithm configurate under interface."                       "DHCP relay agent algorithm."                       '"DHCP relay server group server table."                       >"This list contains DHCP relay server group server parameters"                       %"The DHCP relay server group number."                       "The server number."                       2"The IP address of the relay server group server."                       "The server mode."                        "The server is master or slave."                       >"DSCP value of DHCP relay when it sends packet to the server."                       %"The server is public server or not."                       "The VRF of this server."                           Y"Max user number of DHCP relay, default value is set
                       by project."                       7"Forbid DHCP relay sends DHCPRELEASE to server or not."                       !"Set client lease time of proxy."                       "DHCP relay option82 format."                       ."Insert relay option82 or not in BOOTREQUEST."                       $"The option82 policy of DHCP relay."                       -"DHCP option82 policy of user configuration."                       -"The circuit-id subitem of uniform option82."                       ,"The remote-id subitem of uniform option82."                       ,"Set the arp deadtime to dhcp lease or not."                       8"Set forwarding DHCP reply packet without limit or not."                       3"Set reporting DHCP relay user information or not."                       -"DHCP relay agent index configuration table."                       O"This list contains DHCP relay agent index parameters of user access interface"                       J"Under this DHCP interface,configurate DHCP relay agent index parameters."                       "DHCP relay agent index."                       "DHCP relay agent ip address."                       %"DHCP relay agent index option code."                       %"DHCP relay agent index option type."                       %"DHCP relay agent index option text."                       >"DHCP relay server group online user forward algorithm table."                       @"This list contains DHCP relay online user fwd algorithm params"                       8"DHCP relay server group online-user forward algorithm."                       6"DHCP relay forward online-user renew-request or not."                       :"DHCP relay forward online-user rebinding-request or not."                       0"DHCP relay forward online-user release or not."                       0"DHCP relay forward online-user decline or not."                           #"DHCP pool common configure table."                       :"This list contains DHCP pool common configure parameters"                       "DHCP pool name."                       "DHCP pool IP pool name."                       "DHCP pool leasetime days."                       "DHCP pool leasetime hours."                       "DHCP pool leasetime minutes."                       )"DHCP pool leasetime is infinite or not."                       *"DHCP pool is ignore request list or not."                       "DHCP pool leasetime seconds."                       '"DHCP relay server group server table."                       4"This list contains DHCP pool DNS server parameters"                       "DHCP pool name."                       ""DHCP pool DNS server IP address."                       !"DHCP pool default router table."                       8"This list contains DHCP pool default router parameters"                       "DHCP pool name."                       &"DHCP pool default router IP address."                       #"DHCP pool common configure table."                       :"This list contains DHCP pool common configure parameters"                       "DHCP pool name."                       "DHCP pool VRF name."                       $"DHCP pool static user MAC address."                       #"DHCP pool static user IP address."                       %"DHCP pool static user mask address."                       #"DHCP pool common configure table."                       A"This list contains DHCP pool common option configure parameters"                       "DHCP pool name."                       "DHCP pool option code."                       #"DHCP pool option sub-option code."                       +"DHCP pool option ASCII string configured."                       )"DHCP pool option HEX string configured."                       )"DHCP pool option IP address configured."                       )"DHCP pool option IP address configured."                       )"DHCP pool option IP address configured."                       )"DHCP pool option IP address configured."                       )"DHCP pool option IP address configured."                       )"DHCP pool option IP address configured."                       )"DHCP pool option IP address configured."                       )"DHCP pool option IP address configured."                       ."Get option value from request packet or not."                       "DHCP pool option212 table."                       ="This list contains DHCP pool option212 configure parameters"                       "DHCP pool name."                       *"DHCP pool option212 IPv6 prefix address."                       )"DHCP pool option212 IPv6 prefix length."                       ""DHCP pool option212 mask length."                       #"DHCP pool option212 BR address 1."                       #"DHCP pool option212 BR address 2."                       #"DHCP pool option212 BR address 3."                       #"DHCP pool option212 BR address 4."                       #"DHCP pool option212 BR address 5."                       #"DHCP pool common configure table."                       D"This list contains DHCP pool common option125 configure parameters"                       "DHCP pool name."                       &"DHCP pool option125 enterprise code."                       &"DHCP pool option125 sub-option code."                       ."DHCP pool option125 ASCII string configured."                       ,"DHCP pool option125 HEX string configured."                       ,"DHCP pool option125 IP address configured."                       ,"DHCP pool option125 IP address configured."                       ,"DHCP pool option125 IP address configured."                       ,"DHCP pool option125 IP address configured."                       ,"DHCP pool option125 IP address configured."                       ,"DHCP pool option125 IP address configured."                       ,"DHCP pool option125 IP address configured."                       ,"DHCP pool option125 IP address configured."                              