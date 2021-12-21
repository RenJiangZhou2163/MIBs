;--  ************************************************
--  $Id: zxr10ntp.mib 8 2008-03-25 12:17:08Z qiujun $
--
--  zxr10ntp.mib: ZXR10 NTP MIB file
--
--  Mar. 2008, qiujun 154377
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                                     -"The MIB module to describe the NTP protocol" m"        qu yanxia
                Tel:    
                E-Mail: qu.yanxia@zte.com.cn
                " "201710101000Z" "201511021000Z" "201403210900Z" "201310311000Z" "201308051000Z" "201307021000Z" "201306251000Z" "201305271000Z" "201304181000Z" "201304011000Z"
"modify:add default value for 
                        zxr10ntpStatus
                        zxr10ntpPollTime;
                        set max-access to read-create for
                        zxr10ntpServerWithDnsCfgTable
                        zxr10ntpPeerWithDnsCfgTable;
                 add:   zxr10ntpAclGroupIPv4ServerOnly
                        zxr10ntpAclGroupIPv6ServerOnly
                        zxr10ntpAccessControlServerVrf
                        zxr10ntpAuthKeychain
                        " �"add:   zxr10ntpServerWithDnsCfgTable
                        zxr10ntpPeerWithDnsCfgTable
                        zxr10ntpConformance
                        " s"modify zxr10ntpAuthKeyId
                        change the minimum keyid from 0 to 1 
                        " �"modify zxr10ntpPollTime
                        zxr10ntpPoll
                        zxr10ntpAssocPoll
                        the max poll-interval change to 17 
                        " �"modify zxr10ntpMaster
                        zxr10ntpAuthEncryptedKey
                        zxr10ntpCurSrvRsltLock
                        " "add zxr10ntpSrcInterface""modify description of table:
                        zxr10ntpServerCfgTable
                        zxr10ntpPeerCfgTable
                        zxr10ntpBroadcastServerTable
                        zxr10ntpMulticastClientTable
                        zxr10ntpMulticastServerTable" W"modify zxr10ntpCurSrvRsltPriority
                        zxr10ntpCurSrvRsltIpv4Addr" �"modify zxr10ntpIPv4AclName
                        zxr10ntpIPv6AclName
                 add index zxr10ntpAssocIfName to table zxr10ntpAssocTable"�"add:     zxr10ntpPeerCfgTable
                          zxr10ntpConfig
                          zxr10ntpBroadcastClientTable
                          zxr10ntpBroadcastServerTable
                          zxr10ntpMulticastClientTable
                          zxr10ntpMulticastServerTable
                          zxr10ntpAuthTable
                          zxr10ntpCurSrvRsltInfo
                          zxr10ntpAssocTable
                "                   ("The NTP Authentication enable/disable."                       7"The NTP IPv4 access-group,acl name.Null means invalid"                       7"The NTP IPv6 access-group,acl name.Null means invalid"                       g"The NTP IPv4 source address.Source IP and source 
            interface can't be configured together"                       g"The NTP IPv6 source address.Source IP and source 
            interface can't be configured together"                       5"The NTP estimated round-trip delay in microseconds."                       "The NTP enable/disable."                       "The NTP stratum value."                       "The NTP poll interval."                       �"The NTP source interface.The L2 interface does not support. 
            Source IP and source interface can't be configured together"                       1"The NTP IPv4 server-only access-group,acl name."                       ""The NTP access-control,acl name."                       )"The NTP server access-control,Vrf name."                       9"The NTP status,where 0 means disable and 1 means enable"                       "The NTP type."                      8"The NTP poll interval time,where the
            interval argument is specified in seconds as a power 
            of two.The number is used in a power-of-two 
            (for example, 6 meaning 2 to the power of 6), 
            and can be in the range from 4 to 17. 
            The default value is 6."                       "The system current time."                       |"The NTP SynchStatus,where 0 means unsynchronized and 
            1 means synchronized,2 means ntp disable,have no status"                       z"The NTP Reference Clock,where 0 means unsynchronized,
            Local means as server,IP means synchronized to server"                       "The NTP server in use."                       2"The vrf of the used Server,null means not in vrf"                       :"The NTP master Stratum can be in the range from 1 to 15."                       ,"A table containing NTP server information."                       &"Information about the server of NTP."                       "The NTP server IP address."                       ;"The NTP server priority,the min number with high priority"                       Z"The NTP server lock status.0 means unlock,
            and 1 means the server is locked"                       W"The NTP server vrf name.Null means 
            the server is not bounded to the vrf"                       �"A table containing NTP server information.Setting the
            priority leaf node results in initializing the other leaf 
            nodes except the indexs and rowStatus.Suggest the whole 
            table setting."                       p"Information about the server of NTP. As indexs of the 
            table,IPv4 and IPv6 can't be set together."                       W"The NTP server vrf name.Null means 
            the server is not bounded to any vrf"                       3"vrf flag of mng,1 means vrf is mng;0 means no mng"                       "The NTP server IPv4 address."                       "The NTP server IPv6 address."                       ;"The NTP server priority,the min number with high priority"                       �"The NTP version number, it can be in the range from 1 
            to 4. The default value is 3 for ipv4,
            but it only be 4 for ipv6"                       Z"The NTP server lock status.0 means unlock,
            and 1 means the server is locked"                       "The NTP authentication key."                       "create or delete ntp server"                       �"A table containing NTP peer information.Setting the 
            priority leaf node results in initializing the other leaf
            nodes except the indexs and rowStatus.Suggest the whole 
            table setting."                       m"Information about the peer of NTP.As indexs of the 
            table,IPv4 and IPv6 can't be set together."                       S"The NTP peer vrf name.No null means 
             the peer is bounded to any vrf"                       ,"mng flag,1 means vrf is mng;0 means no mng"                       "The NTP peer IPv4 address."                       "The NTP peer IPv6 address."                       9"The NTP peer priority,the min number with high priority"                       �"The NTP version number, it can be in the range from 1 
            to 4. The default value is 3 for ipv4,
            but it only be 4 for ipv6"                       "The NTP authentication key"                       "create or delete ntp peer"                       �"A table containing NTP server information.Setting the 
            priority leaf node results in initializing the other leaf 
            nodes except the indexs and rowStatus.Suggest the whole 
            table setting."                       *"Information about the DNS server of NTP."                       W"The NTP server vrf name.Null means 
            the server is not bounded to any vrf"                       3"vrf flag of mng,1 means vrf is mng;0 means no mng"                       "The NTP server DNS name."                       ;"The NTP server priority,the min number with high priority"                       �"The NTP version number, it can be in the range from 1 
            to 4. The default value is 3 for ipv4,
            but it only be 4 for ipv6"                       ["The NTP server lock status. 2 means unlock,
            and 1 means the server is locked"                       "The NTP authentication key."                       &"create or delete ntp server with dns"                       �"A table containing NTP peer information.Setting the 
            priority leaf node results in initializing the other leaf
            nodes except the indexs and rowStatus.Suggest the whole 
            table setting."                       ("Information about the DNS peer of NTP."                       S"The NTP peer vrf name.No null means 
             the peer is bounded to any vrf"                       ,"mng flag,1 means vrf is mng;0 means no mng"                       "The NTP peer Dns name.No "                       9"The NTP peer priority,the min number with high priority"                       �"The NTP version number, it can be in the range from 1 
            to 4. The default value is 3 for ipv4,
            but it only be 4 for ipv6"                       "The NTP authentication key"                       $"create or delete ntp peer with dns"                       6"A table containing NTP broadcast Client information."                       8"A list of entries of ntp broadcast client information."                       *"The NTP broadcast client interface name."                       "active(1) destroy(6)." X"See definition of RowStatus in RFC 2579, 'Textual
            Conventions for SMIv2.'"                     �"A table containing NTP broadcast Server information.
            Setting some leaf nodes results in initializing the other 
            leaf nodes except the indexs and rowStatus.Suggest the
            whole table setting."                       8"A list of entries of ntp broadcast Server information."                       *"The NTP broadcast server interface name."                       *"The NTP breadcast server version number."                       2"The NTP breadcast server key id,0 means invalid."                       "active(1) destroy(6)." X"See definition of RowStatus in RFC 2579, 'Textual
            Conventions for SMIv2.'"                     6"A table containing NTP multicast Client information."                       �"A list of entries of ntp multicast client information.
            As indexs of the table,IPv4 and IPv6 can't be set together."                       *"The NTP multicast client interface name."                       ("The NTP multicast client IPv4 address."                       ("The NTP multicast client IPv6 address."                       !"active(1) create(4) destroy(6)." X"See definition of RowStatus in RFC 2579, 'Textual
            Conventions for SMIv2.'"                     �"A table containing NTP multicast Server information.
            Setting some leaf nodes results in initializing the other 
            leaf nodes except the indexs and rowStatus.Suggest the 
            whole table setting."                       �"A list of entries of ntp multicast Server information.As indexs 
            of the table,IPv4 and IPv6 can't be set together."                       *"The NTP multicast server interface name."                       ("The NTP multicast client IPv4 address."                       ("The NTP multicast client IPv6 address."                        "The NTP server version number."                       ("The NTP server key id,0 means invalid."                       Q"The NTP multicast server ttl,
             0 means not need to set ttl option."                       "active(1) destroy(6)." X"See definition of RowStatus in RFC 2579, 'Textual
            Conventions for SMIv2.'"                     4"A table containing NTP Authentication information."                       ."Information about the Authentication of NTP."                       /"The NTP authentication key id,max 255 record."                       "The NTP authentication key"                       ?"The NTP encrypted authentication key must have 24 characters."                       ."The NTP authentication key is trusted or not"                       )"create or delete ntp authication config"                       !"The NTP authentication keychain"                           W"The NTP server vrf name.Null means 
            the server is not bounded to the vrf"                       P"The NTP server IPv4 address,127.0.0.1 
             means reference is LOCAL."                       "The NTP server IPv6 address."                       i"The NTP server priority,the min number with high
            priority.The value of 0 is invalid value."                       Z"The NTP server lock status 2 means unlock,
            and 1 means the server is locked"                       1"A table containing NTP association information."                       ,"Information about the associations of NTP."                       %"The NTP association source address."                       #"The NTP association dest address."                       a"The NTP association vrf name.Null means 
            the association is not bounded to the vrf"                       "The NTP association mode"                       %"The NTP association interface name."                       0"The NTP association is persistent or ephemeral"                        "The NTP association key number"                       "The NTP association version"                       $"The NTP association is or not lock"                       #"The NTP association poll interval"                       "The NTP association stratum"                       "The NTP association priority"                       "The NTP association reach"                       "The NTP association delay"                       "The NTP association offset"                       6"The NTP association is or not the best source in use"                      