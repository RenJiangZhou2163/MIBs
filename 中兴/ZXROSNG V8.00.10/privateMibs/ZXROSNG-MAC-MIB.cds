'--*****************************************************************
-- ZXROSNG-MAC-MIB.mib
-- MAC MIB Definitions
-- lizhuo10114767
-- 2013-03-22
--
-- Copyright (c) 1985-2013 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
--
                                                         V"This MIB contains managed object
             definitions for MAC config and status" r"    Li zhuo(Chen zehan)
             Tel:    +86-1865165xxxx
             E-Mail:li.zhuo3@zte.com.cn
        " "201807131800Z" "201705221800Z" "201602231800Z" "201601081800Z" "201511181800Z" "201412221800Z" "201410221800Z" "201403041800Z" "201312031800Z" "201311181000Z" "201311051000Z" "201307251000Z" "201306221800Z" "201303221800Z" "201205141800Z" m"   add:
            zxMacPortCfgRowStatus
            modify:
            zxMacPortCfgLimitMax
        "7"   modify DEFVAL: 
            zxMacVpnCfgStpTunnelled,
            zxMacVpnCfgLldpTunnelled,
            zxMacVpnCfgDot1xTunnelled,
            zxMacVpnCfgDot3xTunnelled,
            zxMacVpnCfgLacpTunnelled,
            zxMacVpnCfgGarpTunnelled,
            zxMacVpnCfgAllBriMultiTunnelled,
            zxMacVpnCfgZdpZtpTunnelled,
            zxMacVpnCfgVTPTunnelled,
            zxMacVpnCfgCDPTunnelled
            add: 
            zxMacVpnCfgZesrTunnelled,
            zxMacVpnCfgPvstPlusTunnelled,
            zxMacVpnCfgUdldTunnelled,
            zxMacVpnCfgMstpTunnelled,
            zxMacVpnCfgRstpTunnelled,
            zxMacVpnCfgGvrpTunnelled,
            zxMacVpnCfgMacInMacTunnelled,
            zxMacVpnCfgEfmTunnelled,
            zxMacVpnCfgCfmTunnelled,
            zxMacVpnCfgY1731,
            zxMacVpnCfgPbbTeTunnelled,
            zxMacVpnCfgUserProtocolName,
            zxMacVpnCfgUserProtocolTunnelled,
            zxMacVpnCfgGmrpTunnelled,
            zxMacVpnCfgDldpTunnelled,
            zxMacVpnCfgErpsTunnelled
        " M"   add value shutdown for  
            zxMacPortCfgLimitPolicy.
        ""   add : 
            zxMacVxlanItemTable
            obsolete:
            zxMacItemCfgVxlanId,
            zxMacItemCfgRemoteIp,
            zxMacItemCfgRemoteIpv6,
            zxMacItemCfgRemoteIpType,
            zxMacItemOnVlanVxlanId,
            zxMacItemOnVlanRemoteIp,
            zxMacItemOnVlanRemoteIpv6,
            zxMacItemOnVlanRemoteIpType,
            zxMacItemOnPortVxlanId,
            zxMacItemOnPortRemoteIp,
            zxMacItemOnPortRemoteIpv6,        
            zxMacItemOnPortRemoteIpType
        ""   add : 
            zxMacItemOnPortRemoteIpv6,
            zxMacItemOnVlanRemoteIpv6,
            zxMacItemCfgRemoteIpv6
            zxMacItemOnPortRemoteIpType,
            zxMacItemOnVlanRemoteIpType,
            zxMacItemCfgRemoteIpType
        " Q"   modify DESCRIPTION:
            id to ID,
            mac to MAC
        " �"   add:
            zxMacItemCfgVxlanId,
            zxMacItemCfgRemoteIp,
            zxMacItemOnVlanVxlanId,
            zxMacItemOnVlanRemoteIp,
            zxMacItemOnPortVxlanId,
            zxMacItemOnPortRemoteIp
        "/"   modify DEFVAL:
            zxMacVplsPortCfgTrbcAction,
            zxMacVplsPortCfgTrmcAction,
            zxMacVplsPortCfgTrucAction,
            zxMacVplsPortCfgTrkcAction
            modify DESCRIPTION:
            zxMacVplsPortCfgTrafficMax,
            zxMacGlobalCfgAgingTime
        " a"   add:
            zxMacItemOnVlanTable          
            zxMacItemOnPortTable
        "�"   del:
            enterprises
            add:
            zxMacGlobalCfgAutoWrite
            zxMacGlobalCfgAutoWriteInterval
            zxMacGlobalStatusStaticMacNum
            zxMacGlobalStatusDynamicMacNum
            zxMacGlobalStatusPerMacNum
            zxMacGlobalStatusFiltMacNum
            zxMacGlobalStatusToPerMacNum
            zxMacVplsItemCfgTime
            zxMacPortCfgToPermanent
            zxMacItemCfgTime
            zxMacPortStatusStaticMacNum
            zxMacPortStatusDynamicMacNum
            zxMacPortStatusPerMacNum
            zxMacPortStatusFiltMacNum
            zxMacPortStatusToPerMacNum
        " 5"   add:
            zxMacItemCfgNickName
        " 3"   add:
            zxMacNotifications
        " ?"   add:
            type topermanent for item flag
        ":"   add:
            zxMacGlobalCfg
            zxMacGlobalStatus
            zxMacVlanCfgTable
            zxMacPortCfgTable
            zxMacItemCfgTable
            zxMacVplsPortStatusTable
            zxMacVpnStatusTable
            zxMacVlanStatusTable
            zxMacPortStatusTable
            " &" Initial version of this MIB module."       --2018-07-13 18:00
               '"Configuration of Global MAC learning."                       ]"Configuration of Global max MAC number.
            Default value is determined by device."                       0"Configuration of Global max MAC number policy."                       "Configuration of higig learn."                       *"Configuration of Global alarm threshold."                       }"Configuration of Global aging time.
            Default value is determined by device.
            Zero means not to age."                       @"Configuration of MAC movable between port of default priority."                       <"Configuration of MAC movable between port of low priority."                       ?"Configuration of MAC movable between port of normal priority."                       ="Configuration of MAC movable between port of high priority."                       7"Configuration of auto write to-permanent MAC to file."                       8"Configuration of auto write to-permanent MAC interval."                           "Global current MAC number."                       !"Global current VPLS MAC number."                       -"Global current VPLS MAC number of AC port ."                       ,"Global current VPLS MAC number of PW port."                       "Global protect status."                       "Global history max count."                       #"Global current static MAC number."                       $"Global current dynamic MAC number."                       &"Global current permanent MAC number."                       !"Global current filt MAC number."                       ("Global current topermanent MAC number."                           %"Configuration for MAC on VPLS port."                       %"Configuration for MAC on VPLS port."                       "VPLS inst name."                       "Port name."                       "Port index."                       c"Configuration of max MAC number on VPLS port.
            Default value is determined by device."                       6"Configuration of max MAC number action on VPLS port."                       _"Configuration of aging time on VPLS port.
            Default value is determined by device."                       b"Configuration of traffic rate maximum on VPLS port.
            4294967295 means no rate limit."                       ="Configuration of broadcast limit rate maximum on VPLS port."                       <"Configuration of broadcast limit rate action on VPLS port."                       ="Configuration of multicast limit rate maximum on VPLS port."                       <"Configuration of multicast limit rate action on VPLS port."                       B"Configuration of unknow-unicast limit rate maximum on VPLS port."                       A"Configuration of unknow-unicast limit rate action on VPLS port."                       @"Configuration of know-unicast limit rate maximum on VPLS port."                       ?"Configuration of know-unicast limit rate action on VPLS port."                       "VPLS MAC table."                       "VPLS MAC table."                       "VPLS name of the MAC address."                       "Port name of the MAC address."                       "MAC address."                       "VLAN ID of the MAC address."                       "Type of the MAC address."                       "Time of the MAC address."                       )"Configuration for MAC on VPLS instance."                       )"Configuration for MAC on VPLS instance."                       "VPLS instance name."                       1"Configuration of MAC learning on VPLS instance."                       2"Configuration of MAC anti-move on VPLS instance."                       g"Configuration of max MAC number on VPLS instance.
            Default value is determined by device."                       :"Configuration of max MAC number action on VPLS instance."                       "Index of VPLS instance."                       c"Configuration of aging time on VPLS instance.
            Default value is determined by device."                       >"Configuration of remote no learning policy on VPLS instance."                       0"Configuration of l2pt policy on VPLS instance."                       8"Configuration of l2pt policy for STP on VPLS instance."                       9"Configuration of l2pt policy for LLDP on VPLS instance."                       :"Configuration of l2pt policy for DOT1X on VPLS instance."                       :"Configuration of l2pt policy for DOT3X on VPLS instance."                       9"Configuration of l2pt policy for LACP on VPLS instance."                       G"Configuration of 
            l2pt policy for GARP on VPLS instance."                       T"Configuration of 
            l2pt policy for AllBRIDGEMULTIAST on VPLS instance."                       ;"Configuration of l2pt policy for ZDPZTP on VPLS instance."                       ?"Configuration of traffic limit rate maximum on VPLS instance."                       A"Configuration of broadcast limit rate maximum on VPLS instance."                       @"Configuration of broadcast limit rate action on VPLS instance."                       B"Configuration of multicast limit rate  maximum on VPLS instance."                       @"Configuration of multicast limit rate action on VPLS instance."                       U"Configuration of 
            unknown-unicast limit rate maximum on VPLS instance."                       T"Configuration of 
            unknown-unicast limit rate action on VPLS instance."                       S"Configuration of 
            default priority MAC move policy on VPLS instance."                       Q"Configuration of 
            lower priority MAC move policy on VPLS instance."                       R"Configuration of 
            normal priority MAC move policy on VPLS instance."                       R"Configuration of 
            higher priority MAC move policy on VPLS instance."                       8"Configuration of l2pt policy for VTP on VPLS instance."                       8"Configuration of l2pt policy for CDP on VPLS instance."                       9"Configuration of l2pt policy for ZESR on VPLS instance."                       :"Configuration of l2pt policy for PVST+ on VPLS instance."                       9"Configuration of l2pt policy for UDLD on VPLS instance."                       9"Configuration of l2pt policy for MSTP on VPLS instance."                       9"Configuration of l2pt policy for RSTP on VPLS instance."                       9"Configuration of l2pt policy for GVRP on VPLS instance."                       ?"Configuration of l2pt policy for MAC in MAC on VPLS instance."                       8"Configuration of l2pt policy for EFM on VPLS instance."                       8"Configuration of l2pt policy for CFM on VPLS instance."                       :"Configuration of l2pt policy for Y1731 on VPLS instance."                       8"Configuration of l2pt policy for PBB on VPLS instance."                       P"Configuration of l2pt policy for user protocol template name on VPLS instance."                       B"Configuration of l2pt policy for user protocol on VPLS instance."                       9"Configuration of l2pt policy for GMRP on VPLS instance."                       9"Configuration of l2pt policy for DLDP on VPLS instance."                       9"Configuration of l2pt policy for ERPS on VPLS instance."                        "Configuration for MAC on VLAN."                        "Configuration for MAC on VLAN."                       
"VLAN ID."                       ("Configuration of MAC learning on VLAN."                       ^"Configuration of max MAC number on VLAN.
            Default value is determined by device."                       1"Configuration of max MAC number policy on VLAN."                        "Configuration for MAC on port."                        "Configuration for MAC on port."                       "Port name."                       ("Configuration of MAC learning on port."                       ^"Configuration of max MAC number on port.
            Default value is determined by device."                       1"Configuration of max MAC number policy on port."                       ."Configuration of MAC learn priority on Port."                       ,"Configuration of MAC to-permanent on port."                       h"This object allows entries to be created and deleted
                       in the zxMacPortCfgTable."                       "MAC table."                       "MAC table."                       "MAC address."                       "VLAN ID of the MAC address."                       "Port name of the MAC address."                       "Type of the MAC address."                       "Nickname of the MAC address."                       "Time of the MAC address."                       "VXLAN of the MAC address."                        "Remote IP of the MAC address. "                       ""Remote IPv6 of the MAC address. "                       %"Remote IP type of the MAC address. "                       "Status for MAC on VPLS port."                       "Status for MAC on VPLS port."                       "VPLS instance name."                       "Port name."                       ""Current MAC number on VPLS port."                       "Protect status on VPLS port."                       "Status for MAC on VPLS."                       "Status for MAC on VPLS."                       "VPLS instance name."                       "Current MAC number on VPLS."                       "Protect status on VPLS."                       "Status for MAC on VLAN."                       "Status for MAC on VLAN."                       
"VLAN ID."                       "Current MAC number on VLAN."                       "Protect status on VLAN."                       "Status for MAC on port."                       "Status for MAC on port."                       "Port name."                       "Current MAC number on Port."                       "Protect status on Port."                       $"Current static MAC number on Port."                       %"Current dynamic MAC number on Port."                       '"Current permanent MAC number on Port."                       ""Current filt MAC number on Port."                       )"Current topermanent MAC number on Port."                       "MAC table on VLAN."                       "MAC table on VLAN."                       "VLAN ID of the MAC address."                       "MAC address."                       "Port name of the MAC address."                       "Type of the MAC address."                       "Nickname of the MAC address."                       "Time of the MAC address."                       "VXLAN of the MAC address."                        "Remote IP of the MAC address. "                       ""Remote IPv6 of the MAC address. "                       %"Remote IP type of the MAC address. "                       "MAC table on port."                       "MAC table on port."                       "Port name of the MAC address."                       "VLAN ID of the MAC address."                       "MAC address."                       "Type of the MAC address."                       "Nickname of the MAC address."                       "Time of the MAC address."                       "VXLAN of the MAC address."                        "Remote IP of the MAC address. "                       ""Remote IPv6 of the MAC address. "                       %"Remote IP type of the MAC address. "                       "VXLAN MAC table."                       "VXLAN MAC table."                       "MAC address."                       "VLAN ID of the MAC address."                       "VXLAN of the MAC address."                       "Port name of the MAC address."                       "Type of the MAC address."                       "Tunnel of the MAC address."                       "Time of the MAC address."                        "Remote IP of the MAC address. "                       ""Remote IPv6 of the MAC address. "                       %"Remote IP type of the MAC address. "                           "MAC change notify."                        