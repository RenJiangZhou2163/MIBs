?--  ************************************************
--  $Id: zxr10ping.mib 8 2005-07-28 12:17:08Z zhanglh $
--
--  zxr10ping.mib: ZXR10 Ping MIB file
--
--  Mar. 2008, Cailei 153843
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                     "" q"Chen Wenbo
               Tel: 675166      
               E-Mail: chen.wenbo@zte.com.cn    
               " "201507210000Z" "201503230000Z" "201503030000Z" "201407020000Z" "201406160000Z" "201306250000Z" "201303270000Z" "200905200000Z" 8"Add zxr10TelnetAclFilterTable and zxr10TelnetACLFilter" a"Modify the range of zxr10StyMaxLinkNumber 
                 and zxr10StyMaxSourceConnectNumber"d"Modify DESCRIPTION of node: zxr10StyStat,zxr10StyName,
                 zxr10StyUser,zxr10StyHosts,zxr10StyLocation,
                 zxr10StyDSCP,zxr10StyMaxSourceConnectNumber,
                 Modify the value range of zxr10StyDSCP,
                 zxr10StyMaxSourceConnectNumber,
                 Modify the default value of zxr10StyServerState" R"
                Add leaf node:zxr10StyMaxSourceConnectNumber
                " �"Modify the max length of zxr10StyUser and staticUserName,
                 Delete the default vaule of zxr10StyDSCP,
                 Modify the max value of zxr10StyDSCP" �"
                Modify UNITS of zxr10StyConMaxOnlineTime,zxr10StyConMaxIdle,
                zxr10StyMaxIdle,zxr10StyMaxOnlineTime, zxr10StyIdle
                "v"Add:zxr10StyConMaxIdle
                     zxr10StyConMaxOnlineTime
                     zxr10StyIpv4Acl
                     zxr10StyIpv6Acl,
                     zxr10StyMaxLinkNumber
                     zxr10StyServerState
                     zxr10StyListenPort
                     zxr10StyDSCP
                     zxr10StyTerminalLength
                 " "TELNET"                       h"Maximum console idle time in minutes.
            Distinguish project,support performance parameter. "                       j"Maximum console online time in minutes.
            Distinguish project,support performance parameter. "                       -"IPv4 ACL for Filtering telnet connections. "                       -"IPv6 ACL for Filtering telnet connections. "                       #" Maximum number of telnet links. "                       -"Telnet server state(enable(2),disable(1)). "                       6"Telnet listening port when telnet server is enable. "                       1"The value of telnet DSCP, 255 is invalid value."                       d" Maximum number of telnet links which connect from the same IP,
              0 is invalid value."                       g"Maximum telnet idle time in minutes.
            Distinguish project,support performance parameter. "                       i"Maximum telnet online time in minutes.
            Distinguish project,support performance parameter. "                       "Information table. "                       "Information table entry. "                       %"Sty status, 0: offline, 1: online. "                       U"The name composed by line number, 
             terminal type and terminal number."                       "Username."                       "Remote server IP address. "                       "Client IP address. "                       "Idle time in minutes. "                       "Login time. "                       "Number of lines on screen. "                       !"A list of static user entries. "                       b"An entry containing management information applicable to 
            a particular static user."                       "Local user name."                       "Local privilege."                       " Telnet ACL filter table."                       " Telnet ACL filter entry."                       "ACL trap index."                       )"The app type of ACL filter (telnet(1))."                        "Protocol type (tcp(1),udp(2))."                       3"The address type of source IP and destination IP."                       "Source IPv4 or IPv6 address."                       "Source port number."                       #"Destination IPv4 or IPv6 address."                       "Destination port number."                           �"A notification is sent when login fail because of ACL filter,
             included the app type,protocol type,source address,source port,
             destination address,destination port,address type."                    