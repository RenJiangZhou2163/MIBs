     "A type value for the instance"                                                                                                     7"The MIB module to describe the MLD Snooping protocol." k"       Liu ning
         Tel : +86-25-52870000        
         E-Mail: liu.ning8@zte.com.cn
         " "201406161000Z" "201403111000Z" "201311201000Z" H"Modify description of zxmlsinsLastMemQryInterval to explain the range." u"Modify description of zxmlsinsMaxGroupNum,zxmlsinsAclName,
             zxmlsGroupMaxHostNum to explain the range." &"Initial resivion of this MIB module."                   -"Enable/disable MLD snooping in this device."                       5"Enable/disable MLD snooping Queries in this device."                       �"The Query Interval is the interval between 
             General Queries sent by the Querier.  
             Default: 125 seconds."                       v"The Max Response Time inserted into the periodic General Queries.
             Default: 100 ticks (1 tick = 100ms)."                               h"MLD snooping instance configuration table, 
             supports instances such as : VLAN and VPLS. "                       �"MLD snooping instance entry.   
             When instance type is VLAN,
             index is {type, idx, 0}.  
             When instance type is VPLS,  
             index is {type, 0, VPN name}."                       &"Instance type, 1 is VLAN, 3 is VPLS."                       s"Instance ID of VLAN,
             if instance is VLAN, it is VLAN ID,
             it is 0 for other instances."                       `"Name specified for each configured instance, 
         only valid when instance type is VPLS."                       /"Enable/disable MLD snooping in this instance."                       -"Enable/disable group membership fast leave."                      �"The Last Member Query Interval is the Max Response 
             Time inserted into Multicast-Address-Specific Queries sent in 
             response to Done messages, and is also the 
             amount of time between Multicast-Address-Specific Query messages. 
             Its minimum value and default value both are 1 second, 
             maximum value depends on the product."                       �"Max number of multicast group can access in this instance.
             Its minimum value is 1, maximum value depends on the product."                       ("Host aging-time. Default: 260 seconds."                       9"Multicast router port aging-time. Default: 260 seconds."                       *"Enable/disable Querier in this instance."                       "Querier version: V1 or V2."                       *"Work mode: Proxy, Transparent or Router."                       "ACL name of this instance."                       P"The status of this row, support 'createAndGo' and 'destroy' for set operation."                           "MLD snooping group table."                      S"MLD snooping group entry.
             When opertation is set, zxmlsGroupSourceIp should be 0,
             zxmlsGroupInstanceType should be VLAN or VPLS.
             When instance type is VLAN or IP-GLOBAL, zxmlsGroupInstanceName should be 0.
             When instance type is VPLS, VBUI or VRF, zxmlsGroupInstanceIdx should be 0."                       x"Instance type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       �"Instance ID of VLAN and IP-GLOBAL,
             if instance is VLAN, it is VLAN ID,             
             if instance is IP-GLOBAL, it is 1,
             it is 0 for other instances."                       m"Name specified for each configured instance, 
         only valid when instance type is VPLS, VBUI or VRF."                       "MLD snooping Group IPv6 Addr."                        "MLD snooping Source IPv6 Addr."                       �"Enable/disable drop mode of this group.
             When it is enabled, the mulitcast flow will be dropped
             if there is no host in this group."                       �"Max number of MLD snooping host can access to this group.
             Its minimum value is 1, maximum value depends on the product."                       ="Number of MLD snooping host access to this group currently."                       "Group MAC address."                      "The status of this row, by which new group entries with dropEnable or maxHostNum may be
             created, or old group entries with dropEnable or maxHostNum deleted from this table.
             Support 'createAndGo' and 'destroy' for set operation."                           "MLD snooping host table."                      M"MLD snooping host entry.
             When operation is set, zxmlsHostSourceIp should be 0,
             zxmlsHostInstanceType should be VLAN or VPLS.
             When instance type is VLAN or IP-GLOBAL, zxmlsHostInstanceName should be 0.
             When instance type is VPLS, VBUI or VRF, zxmlsHostInstanceIdx should be 0."                       x"Instance type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       �"Instance ID of VLAN and IP-GLOBAL,
             if instance is VLAN, it is VLAN ID,             
             if instance is IP-GLOBAL, it is 1,
             it is 0 for other instances."                       m"Name specified for each configured instance, 
         only valid when instance type is VPLS, VBUI or VRF."                       "MLD snooping host IPv6 Addr."                       %"MLD snooping host source IPv6 Addr."                       "Interface name."                      ^"For IPTV or SUPERVLAN hosts, it's user VLAN.
             For M-VPLS hosts, it's user VPLS.
             For VPLS hosts,it's 0.
             For IP-Global or VRF hosts, it's a computed value,
             the high 16 bits is internal VLAN, 
             and the low 16 bits is external VLAN.
             Otherwise, it's equal to instance ID."                       "Physical Interface name."                       i"Mode of this host. It is dynamic if learned from MLD Report, 
             or is static if configured."                       "Filter mode of this host."                       �"The status of this row, by which new static host entries may be
             created, or old static host entries deleted from this table.
             Support 'createAndGo' and 'destroy' for set operation."                           +"MLD snooping multicast router port table."                      +"MLD snooping multicast router port entry.
             When operation is set, zxmlsMrInstanceType should be VLAN or VPLS.
             When instance type is VLAN or IP-GLOBAL, zxmlsMrInstanceName should be 0.
             When instance type is VPLS, VBUI or VRF, zxmlsMrInstanceIdx should be 0."                       x"Instance type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       �"Instance ID of VLAN and IP-GLOBAL,
             if instance is VLAN, it is VLAN ID,             
             if instance is IP-GLOBAL, it is 1,
             it is 0 for other instances."                       m"Name specified for each configured instance, 
         only valid when instance type is VPLS, VBUI or VRF."                       "Interface name."                       �"Mode of this multicast router port. 
             It is dynamic if learned from MLD Query, 
             or is static if configured."                       ("Version of this multicast router port."                      "The status of this row, 
             by which new static multicast router port entries may be created, 
             or old static multicast router port entries deleted from this table.
             Support 'createAndGo' and 'destroy' for set operation."                               -"Number of multicast group access currently."                       1"Number of multicast group which exist MLD host."                       :"Number of multicast group which configured as drop mode."                       ="Number of multicast group which configured as prejoin mode."                       B"Number of multicast group which configured with max host number."                       ="Number of source-specific multicast group access currently."                       >"Number of anycast-specific multicast group access currently."                       ""Number of host access currently."                       *"Number of dynamic host access currently."                       )"Number of static host access currently."                       3"Number of multicast router port access currently."                       ;"Number of dynamic multicast router port access currently."                       :"Number of static multicast router port access currently."                          	"MLD snooping instance summary table, 
             MLD snooping supports instances such as : VLAN, Service, VPLS, 
             SUPERVLAN, VBUI, IP-GLOBAL and VRF.
             Some instances are not supported now,
             but reserved for compatibility."                       &"MLD snooping instance summary entry."                       x"Instance type, 1 is VLAN, 2 is Service, 3 is VPLS, 4 is SUPERVLAN, 
             5 is VBUI, 6 is IP-GLOBAL, 7 is VRF."                       �"Instance ID of VLAN and IP-GLOBAL,
             if instance is VLAN, it is VLAN ID,
             if instance is IP-GLOBAL, it is 1,
             it is 0 for other instances."                       m"Name specified for each configured instance, 
         only valid when instance type is VPLS, VBUI or VRF."                       >"Number of multicast group access to this instance currently."                       1"Number of multicast group which exist MLD host."                       :"Number of multicast group which configured as drop mode."                       ="Number of multicast group which configured as prejoin mode."                       B"Number of multicast group which configured with max host number."                       ="Number of source-specific multicast group access currently."                       ]"Number of anycast-specific multicast group 
            access to this instance currently."                       3"Number of host access to this instance currently."                       ;"Number of dynamic host access to this instance currently."                       :"Number of static host access to this instance currently."                      