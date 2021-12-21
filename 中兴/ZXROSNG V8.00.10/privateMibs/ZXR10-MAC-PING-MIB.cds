@--  ************************************************
--  $Id: zxr10ping.mib 8 2005-07-28 12:17:08Z zhanglh $
--
--  zxr10macping.mib: ZXR10 Ping MIB file
--
--  JUL. 2005, Zhang lihui
--
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
   "mac ping option type"                                                                         "ZTE MAC-PING MIB
        " h"       Zhao yanhua
        Tel:    +86-25-52870000
        E-Mail: zhao.yanhua3@zte.com.cn
        " "201305141430Z" "201303191130Z" "200504120000Z"�"modify:    zxr10PingMacInternalVlanId
                    zxr10PingMacExternalVlanId
                    zxr10PingMacVlanId
                    size(1..4094) change to size(0.4094)
                    zxr10PingMacTrapOncompletion
                    default value from true to false
         add:       description of some nodes
                    default value for some nodes
                    fix compiling warnings
        " �"add:       zxr10PingMacInternalVlanId
                    zxr10PingMacExternalVlanId
                    zxr10PingMacVlanId
                    zxr10MacPingGlobalObjects
        " /"Initial version of this MIB module.
        "               U"zxr10 is the root OBJECT IDENTIFIER for ZTE
         routers and switches pruducts"                       "mac ping information table."                       "mac ping information entry."                       "serial number"                       
"dest mac"                       "output interface if-index"                       "option,default:none"                       "packet count"                       	"timeout"                       "hops"                       "result type"                       o"The value of this object determines when and whether to
             generate a notification for this entry."                       \"This object allows to start ping or destroy entries
            in the zxr10MacPingTable."                       "entry owner"                       �"Controls the type of the mac-ping request.
              0: ce ping, need zxr10PingMacControlOutEtherIf
              1: pe ping, need zxr10PingMacVfiName and
                 zxr10PingMacPeerAddress"                       %"The vpls/vpws name for PE mac-ping."                       &"The peer IP address for PE mac-ping."                       V"Internal VlanId, which is optional.
             0: do not configure internal vlan."                       V"External VlanId, which is optional.
             0: do not configure external vlan."                       H"Vlan Id, which is optional.
             0: do not configure vlan id."                       "mac ping result table."                       "mac ping result entry."                       "serial number"                       "send packets"                       "receive packets"                       	"min RTT"                       	"max RTT"                       "average RTT"                       #"result type:(0:summary, 1:detail)"                       "destination interface"                       "destination hostname"                       "source interface"                       "source hostname"                       "out vlanid"                       "in vlanid"                       "entry owner"                       	"min RWT"                       	"max RWT"                       "average RWT"                           c"The newMaster trap indicates that the sending agent
         has transitioned to 'Master' state."                     %"Control whether mac ping is enable."                          