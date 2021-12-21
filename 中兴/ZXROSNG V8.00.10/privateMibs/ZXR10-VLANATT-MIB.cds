g--  ********************************************************
--  $Id: ZXR10-VLAN.mib 2010-03-01 01:34:21Z Jiashurui $
--
--  ZXR10-VlanAtt-MIB: ZXR10 VLAN MIB file
--
--  Mar. 2010, Jia Shurui
--  modify by yuly 187517
--  Copyright(c) 2010 by ZTE Corporation
--  All rights reserved
--
--  ********************************************************
   '"A simple status value for the object."               "Pidtag Type"               
"Enc Type"                                                                         "ZXROS SMI MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201404041000Z" "201308061000Z" "201306041400Z" "201303261400Z" "201101190000Z" O"modify:    
                    zxr10VlanIfConfigEntry DESCRIPTION
        " 7"modify:    
                    PidtagType
        " �"modify:    zxr10VlanAttExterPid
                    zxr10VlanAttInterPid
                    zxr10VlanAttRangeFlag
                    zxr10VlanAttSingleLayer
        " �"add:       zxr10VlanTpidTable
                    zxr10VlanRangeFlagTable
                    PidtagType
                    EnabledStatus
         modify:    EncapsulationType
        " ""       --2014-04-04 10:00
                   %"Configure VLAN Intf Att parameters."                       \"Each row index by ifIndex and AttNo
                     And contain imformation of VLAN."                       "Interface Index."                       "Interface Name."                       "Parent Interface Index."                       "Parent Interface Name."                       "Encapsulation Type."                       "Att No"                       "Internal Vlan."                       "External Vlan."                       ""Traffic Statistic for qinq vlan."                       x"Each row index by ifIndex and internal vlan id or 
                 external vlan id And contain imformation of VLAN."                       "Interface Index."                       "Interface Name."                       "Inter vlan id."                       "Exter vlan id."                       " In Packets."                       " In Bytes."                       " Out Packets."                       " Out Bytes."                       " In Discards."                       " Out Discards."                       1"Configuration infomation of vlan sub-interface."                      "Each row index by ifName and internal vlan id and 
                 external vlan id And contain imformation of VLAN.
                 In project 5900 and 9900,user can set dot1q type
                 vlan only,and vlanid 1 is not allowed to configurate."                       "Interface Name."                       "InnerVlan infomation."                       "OuterVlan infomation."                       "Row Status infomation."                       ("TPID infomation of vlan sub-interface."                       N"Each row index by ifName 
                 And contain imformation of VLAN."                       "Interface Name."                       �"Value of External Pid,valid value is 1-6,they 
                       separately mean 88a8 8100 9100 9200 9300 88e8,
                       default value can be set by different project."                       �"Value of Internal Pid,valid value is 1-6,they 
                       separately mean 88a8 8100 9100 9200 9300 88e8,
                       default value can be set by different project."                       ."Range Flag infomation of vlan sub-interface."                       "Each row index by ifName ."                       "Interface Name."                       d"Vlan range broadcast flag,1 mean enable,2 mean
                       disable,default value is 2."                       q"Vlan range broadcast singlelayer flag,1 mean 
                       enable,2 mean disable,default value is 2."                          