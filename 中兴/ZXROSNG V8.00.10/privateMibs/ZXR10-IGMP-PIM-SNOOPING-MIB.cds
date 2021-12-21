     "A type value for the submode"                                                                                     $"ZXROS SWITCH IGMP/PIM SNOOPING MIB" �"ZTE Corporation 
             Nanjing Institute of ZTE Corporation
         
             No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China" "201704011000Z" "201406161000Z" "201306251000Z" "201304021000Z" �"modify: zxr10IgmpSnoopingMrouterVlan
                     zxr10IgmpSnoopingNDLVlan
                     zxr10PimSnoopingHostVlan
                     zxr10IgmpSnoopingMrouterGuardVlan
                     zxr10IgmpSnoopingIfConfigVlan" 9"modify: zxr10IgmpSnoopingSubmodeLastMemberQueryInterval" a"modify: zxr10IgmpSnoopingHostTable
                     zxr10IgmpSnoopingHostFilterSourceTable" �"add:    zxr10IgmpSnoopingIfConfigTable
                     zxr10IgmpSnoopingSummary
                     zxr10IgmpSnoopingSummarySubmodeTable
             modify: zxr10IgmpSnoopingSubmodeTable"                   ."Enable/disable IGMP snooping in this device."                       -"Enable/disable PIM snooping in this device."                       -"Enable/disable IGMP Queries in this device."                       �"The Query Interval is the interval between 
             General Queries sent by the Querier.  
             Default: 125 seconds."                       v"The Max Response Time inserted into the periodic General Queries.
             Default: 100 ticks (1 tick = 100ms)."                       c"The multicast limit number,
             it is not supported now,but reserved for compatibility."                       -"The disposal mode of IGMPV1 Report message."                       3"The disposal mode of IGMPV2 Report/Leave message."                       -"The disposal mode of IGMPV3 Report message."                           -"Number of multicast group access currently."                       2"Number of multicast group which exist IGMP host."                       :"Number of multicast group which configured as drop mode."                       ="Number of multicast group which configured as prejoin mode."                       B"Number of multicast group which configured with max host number."                       ="Number of source-specific multicast group access currently."                       >"Number of anycast-specific multicast group access currently."                       ""Number of host access currently."                       *"Number of dynamic host access currently."                       )"Number of static host access currently."                       3"Number of multicast router port access currently."                       ;"Number of dynamic multicast router port access currently."                       :"Number of static multicast router port access currently."                      "IGMP snooping submode configuration table, 
             IGMP snooping supports submodes such as : VLAN, Service, VPLS, 
             SUPERVLAN, VBUI, IP-GLOBAL and VRF.
             Some submodes are not supported now,             
             but reserved for compatibility."                       �"IGMP snooping submode entry.   
             When submode type is VLAN, IP-GLOBAL,
             index is {submode, submode ID, 0}.  
             When submode type is VPLS, VBUI and VRF,  
             index is {submode, 0, VPN name}."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       �"Submode instance ID of VLAN and IP-GLOBAL,
             if submode is VLAN, it is VLAN ID,             
             if submode is IP-GLOBAL, it is 1,
             it is 0 for other submodes."                       0"Enable/disable IGMP snooping in this instance."                       /"Enable/disable PIM snooping in this instance."                       -"Enable/disable group membership fast leave."                      v"The Last Member Query Interval is the Max Response 
             Time inserted into Group-Specific Queries sent in 
             response to Leave Group messages, and is also the 
             amount of time between Group-Specific Query messages. 
             Its minimum value and default value both are 1 second, 
             maximum value depends on the product."                       <"Max number of multicast group can access in this instance."                       >"Number of multicast group access to this instance currently."                       ("Host aging-time. Default: 260 seconds."                       9"Multicast router port aging-time. Default: 260 seconds."                       *"Enable/disable Querier in this instance."                        "Querier version: V1, V2 or V3."                       *"Work mode: Proxy, Transparent or Router."                       e"ACL number of this instance,it is not supported now, 
             but reserved for compatibility."                       ("Proxy IP address is configured or not."                       g"This IP address is used as source IP when sending 
             IGMP Report and Leave in proxy mode."                       ("Query IP address is configured or not."                       O"This IP address is used as source IP when sending 
             IGMP Query. "                       ("Number of group which exist IGMP host."                       0"Number of group which configured as drop mode."                       3"Number of group which configured as prejoin mode."                       8"Number of group which configured with max host number."                       l"Name specified for each configured instance, 
         only valid when submode type is VPLS, VBUI or VRF."                       "ACL name of this instance."                       ="All ports are not allowed to learn dynamic mrouter port(s)."                      "Submode instance ID,
             if submode is VLAN, it is VLAN ID,
             if submode is VPLS, it is VPLS ID,
             if submode is VBUI, it is VBUI ID,
             if submode is IP-GLOBAL, it is IP-GLOBAL ID,
             if submode is VRF, it is VRF ID."                       "IGMP snooping group table."                       "IGMP snooping group entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       "Group IP address."                       �"Enable/disable drop mode of this group.
             When it is enabled, the mulitcast flow will be dropped
             if there is no host in this group."                       �"Enable/disable prejoin mode of this group.
             When it is enabled, report will be sent to multicast router
             even if there is no host in this group."                       3"Max number of IGMP host can access to this group."                       5"Number of IGMP host access to this group currently."                       4"Number of PIM host access to this group currently."                       "Group MAC address."                       "IGMP snooping host table."                       "IGMP snooping host entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       "Group IP address."                       j"Mode of this host. It is dynamic if learned from IGMP Report, 
             or is static if configured."                       A"Port type of this host, there are 2 types: physical port or PW."                       "Port/PW index of this host."                      "For IPTV or SUPERVLAN hosts, it's user VLAN.
             For IP-Global or VRF hosts, it's a computed value,
             the high 16 bits is internal VLAN, 
             and the low 16 bits is external VLAN.
             Otherwise, it's equal to submode instance ID."                       �"CIP index of this host, only valid when the host is in 
             Service or VPLS, and port type is physical port,it is 
             not supported now,but reserved for future use."                       "Interface name."                       ("Physical interface index of this host."                       ,"IGMP snooping multicast router port table."                       '"IGMP snooping multicast router entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       i"Mode of this port. It is dynamic if learned from IGMP Query, 
             or is static if configured."                       A"Port type of this port, there are 2 types: physical port or PW."                       "Port/PW index of this port."                       y"VLAN ID which this multicast router port belongs to,
             it is not supported now,but reserved for future use."                       �"CIP index of this port, only valid when the port is in 
             Service or VPLS, and port type is physical port,it is 
             not supported now,but reserved for future use."                       "Interface name."                       �"IGMP snooping no-dynamic-learn port table.
             When it is a no-dynamic-learn port, multicast router port won't 
             be created even if IGMP Query is received."                       ,"IGMP snooping no-dynamic-learn port entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       a"Port type of this no-dynamic-learn port, 
             there are 2 types: physical port or PW."                       ."Port/PW index of this no-dynamic-learn port."                       y"VLAN ID which this no-dynamic-learn port belongs to,it is 
             not supported now,but reserved for future use."                       �"CIP index of this port, only valid when the port is in 
             Service or VPLS and port type is physical port,it is 
             not supported now,but reserved for future use."                       "Interface name."                       "PIM snooping host table."                       "PIM snooping host entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       "Group IP address."                       "Source IP address."                       A"Port type of this host, there are 2 types: physical port or PW."                       "Port/PW index of this host."                       h"VLAN ID which this host belongs to,it is 
             not supported now,but reserved for future use."                       �"CIP index of this host, only valid when the host is in 
             Service or VPLS and port type is physical port,it is 
             not supported now,but reserved for future use."                       "PIM snooping neighbor table."                       "PIM snooping neighbor entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       @"VPN ID,it is not supported now,but reserved for compatibility."                       "Neighbor ID."                       "Neighbor source IP address."                       "Neighbor port name."                       r"IGMP snooping MVLAN backup table,this table is 
             not supported now, but reserved for compatibility."                       #"IGMP snooping MVLAN backup entry."                       "Master VLAN ID."                       "Backup VLAN ID."                       "Working VLAN ID."                       #"Detection status of master VLAN. "                       #"Detection status of backup VLAN. "                       "Enable/Disable restore mode."                       )"Restore delay time. Default: 5 minutes."                       '"Switch delay time. Default: 0 second."                       "Switch flag of master VLAN."                       "Track session of master VLAN."                       "Track session of backup VLAN."                      5"IGMP snooping host filter source table. Source filtering 
             is the ability of a system to report interest in receiving
             packets *only* from specific source addresses, or from 
             *all but* specific source addresses, sent to a particular 
             multicast address. "                       )"IGMP snooping host filter source entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       "Group IP address."                       A"Port type of this host, there are 2 types: physical port or PW."                       "Port/PW index of this host."                      "For IPTV or SUPERVLAN hosts, it's user VLAN.
             For IP-Global or VRF hosts, it's a computed value,
             the high 16 bits is internal VLAN, 
             and the low 16 bits is external VLAN.
             Otherwise, it's equal to submode instance ID."                      ,"Host filter source mode,in INCLUDE mode, reception 
             of packets sent to the specified multicast address 
             is requested *only* from those IP source addresses,
             and in EXCLUDE mode, from all IP source addresses 
             *except* those IP source addresses."                        "Host filter source IP address."                       ("Physical interface index of this host."                       �"IGMP snooping multicast router guard table. When it 
             is a multicast-router-guard port, IGMP Query will be 
             discarded when received from this port."                       -"IGMP snooping multicast router guard entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       ^"Port type of this mrouter-guard port, 
             there are 2 types: physical port or PW."                       +"Port/PW index of this mrouter-guard port."                       t"VLAN ID which this mrouter-guard port belongs to, 
             it is not supported now, reserved for future use."                       �"CIP index of this port, only valid when the port is in 
             Service or VPLS and port type is physical port,it is 
             not supported now, reserved for future use."                       "Interface name."                       �"IGMP snooping interface config table. When it 
             is disabled port, IGMP packet will be 
             discarded when received from this port."                       ."IGMP snooping interface configuration entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       P"Port type of this port, 
             there are 2 types: physical port or PW."                       "Port/PW index of this port."                       f"VLAN ID which this port belongs to, 
             it is not supported now, reserved for future use."                       �"CIP index of this port, only valid when the port is in 
             Service or VPLS and port type is physical port,it is 
             not supported now, reserved for future use."                       "Interface name."                       ,"Enable/disable Interface in this instance."                      "IGMP snooping submode summary table, 
             IGMP snooping supports submodes such as : VLAN, Service, VPLS, 
             SUPERVLAN, VBUI, IP-GLOBAL and VRF.
             Some submodes are not supported now,
             but reserved for compatibility."                       &"IGMP snooping submode summary entry."                       w"Submode type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       U"Submode instance ID,
             the value refer to zxr10IgmpSnoopingInstanceIdx."                       >"Number of multicast group access to this instance currently."                       2"Number of multicast group which exist IGMP host."                       :"Number of multicast group which configured as drop mode."                       ="Number of multicast group which configured as prejoin mode."                       B"Number of multicast group which configured with max host number."                       ="Number of source-specific multicast group access currently."                       ]"Number of anycast-specific multicast group 
            access to this instance currently."                       3"Number of host access to this instance currently."                       ;"Number of dynamic host access to this instance currently."                       :"Number of static host access to this instance currently."                      