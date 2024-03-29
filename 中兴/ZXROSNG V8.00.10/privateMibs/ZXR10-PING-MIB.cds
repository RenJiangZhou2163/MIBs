=--  ************************************************
--  $Id: zxr10ping.mib 8 2005-07-28 12:17:08Z zhanglh $
--
--  zxr10ping.mib: ZXR10 Ping MIB file
--
--  JUL. 2005, Zhang lihui
--
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                     "ZTE PING MIB
        " h"       Zhao yanhua
        Tel:    +86-25-52870000
        E-Mail: zhao.yanhua3@zte.com.cn
        " "201606291510Z" "201305141430Z" "201303191130Z" "200901070000Z" ;"modify:    max value of zxr10PingCommonDataLen.
        ""modify:    default value of zxr10PingCommonTrapOncompletion
                    size of zxr10PingCommonPatternString
                    description of some nodes.
         add:       default value for some nodes
                    description of some nodes
        "k"modify:    zxr10PingTimeout
         add:       zxr10PingCommonDcn
                    zxr10PingCommonDomainName
                    zxr10PingCommonPktSendMode
                    zxr10PingCommonLimitNumber
                    zxr10PingCommonInterval
                    zxr10PingCommonInterface
                    zxr10PingCommonPatternString
        " /"Initial version of this MIB module.
        "               "ping information table."                       "ping information entry."                       "serial number"                       w"ping type,default:common
              0: uses zxr10PingCommonDestAddr
              1: uses zxr10PingCommonVrfName"                       "target IP address "                       "vrf name  "                       "option,default:none  "                       "repeat count,default:5    "                       !"timeout in seconds,default:2   "                       "datagram size,default:  100"                       ""extended commands,default:none  "                       "source address   "                       "type of service,default:0   "                       "time to live,default:255    "                       ,"set DONT FRAG(0--may frag,1--don't frag)  "                       "extended commands  "                       " ip address   "                       " ip address   "                       " ip address   "                       " ip address   "                       " ip address   "                       " ip address   "                       " ip address   "                       " ip address   "                       " ip address   "                       "number of hops"                       "number of timestamps"                       Y"This object allows to start ping or destroy entries
            in the zxr10PingTable."                       "entry owner"                       n"The value of this object determines when and whether to
             generate a notification for this entry"                       �"Controls whether the vrf is a DCN or not:
               1: means the vrf name is ?_dcn
               2: uses zxr10PingCommonVrfName"                       "Domain name"                       �"Specify the mode of sending packets,
              1: limit mode, control the sending packets number per second.
              2: interval mode, control time interval between packets."                       k"Controls how many packets will be sent per second, 0 means
            absolute mode with no limitation."                       0"Controls the time between two sending packets."                       7"Controls which interface the packet will be sent out."                       "Specify the pattern string."                       "ping result table."                       "ping result entry."                       "serial number"                       "send packet"                       "receive packet"                       	"min RTT"                       	"max RTT"                       "average RTT"                       "timestamp"                       "ip address"                       "entry owner"                       "min wobble time"                       "max wobble time"                       "average wobble time"                           c"The newMaster trap indicates that the sending agent
         has transitioned to 'Master' state."                            