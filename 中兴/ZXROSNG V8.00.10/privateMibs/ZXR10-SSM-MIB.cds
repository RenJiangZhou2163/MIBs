I--  ******************************************************
--  $Id: ZXR10-SSM-MIB.mib 2010-09-14$
--
--  ZXR10-SSM-MIB.mib: ZXR10 Switch Access List MIB file
--
--  Sep. 2010, wangdan 190001
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--  ******************************************************
                                 -"The MIB module to describe the SSM protocol" i"        qu yanxia
                Tel:
                E-Mail: qu.yanxia@zte.com.cn
                " "201903251000Z" "201506291000Z" "201410201000Z" "201404241200Z" "201401081000Z" "201310171555Z" "201307301000Z" "201306211430Z" "201305291630Z" "201304201630Z" "201303211630Z" ^"
                modify:zxr10SSMOutClkConfigId zxr10SSMCurOutClockConfigId
               " E"
                modify:zxr10SSMSaPosCfgRowStatus
               " B"
                modify:zxr10SSMAdmCurOutClkQL
               " �"
                modify:zxr10SSMCurOutClockState zxr10SSMAdmCurOutClkState 
                add new enum type unsupported(3)
               "�"
                  zxr10SSMPortConfigEntry
                  zxr10SSMTransDisableCfgEntry
                  zxr10SSMOutClkBindCfgEntry
                  zxr10SSMEdgeLinkCfgEntry
                  zxr10SSMTransS1CfgEntry
                  zxr10SSMSaPosCfgEntry
                  zxr10SSMWtrClkType
                  zxr10SSM
                  zxr10SSMStatusInfo
               " f"
                modify:zxr10SSMTransDisableCfgDisable zxr10SSMEdgeLinkCfgEdgeLink
               " >"
                modify:zxr10SSMWtrClkType
               " >"
                modify:zxr10SSMStatusMode
               " K"
                modify:zxr10SSMOutClkBindCfgSubClkType
               " �"add:
                        zxr10SSMEdgeLinkCfgTable
                        zxr10SSMTransS1CfgTable
                        zxr10SSMSaPosCfgTable
                modify: zxr10SSMSyncClkCfgTable zxr10SSMWTRClk zxr10SSMInit
               "-"add:     zxr10SSMSyncClkCfgTable
                          zxr10SSMEdgeLinkCfgTable
                          zxr10SSMTransS1CfgTable
                          zxr10SSMTransDisableCfgTable
                          zxr10SSMSaPosCfgTable
                          zxr10SSMOutClkCfgTable
                          zxr10SSMOutClkBindCfgTablez
                          zxr10SSMShowAdminCurOutClkTable
                          zxr10SSMWTRClkTable
                          zxr10SSMInit
                 modify:  zxr10SSMStatusInfo
                "               ,"This table contains SSM port config entry."                       �"This list contains SSM port config parameters
             and is indexed by zxr10SSMPortConfigClockType,zxr10SSMPortConfigIntName."                       "SSM port config ID."                       "SSM port config clock type."                       !"SSM port config interface name."                       "SSM port config priority."                       "SSM port config frame."                       "SSM port config receive mode."                       "SSM port config quality."                       $"SSM port config send S1 operation."                        "SSM port config send S1 value."                       "SSM port config edge link."                       "SSM port config lock status."                       "SSM port config wtr status."                       %"SSM port config receive sa postion."                       ""SSM port config send sa postion."                        "SSM port config switch status."                       "SSM port config lost status."                       !"create or delete ssm sync clock"                       2"A table that contains SSM out clock config info."                       9"A list of  entries of SSM out clock config information."                       8"The out clock id in the ssm out clock configure table."                       %"The out port name of the out clock."                       D"The quality limit value of the out clock. Its default value is 11."                       )"The select mode value of the out clock."                       "The type of the out clock."                       !"The port name of the out clock."                       R"The out priority of the out clock. Its value is 1~N, and its default value is 1."                           "SSM current clock clock type."                       #"SSM current clock interface name."                       "SSM current clock pll status."                       "SSM current clock SSM enable."                       ""SSM current clock switch status."                       "SSM current clock quality."                       3"A table that contains current SSM out clock info."                       9"A list of  entries of SSM out clock config information."                       <"The out clock id in current ssm out clock configure table."                       @"The current out clock type in the current ssm out clock table."                       5"The current out port name of the current out clock."                       )"The port name of the current out clock."                       %"The state of the current out clock."                       $"The mode of the current out clock."                       '"The quality of the current out clock."                           "SSM clock switch status."                       ""SSM clock switch interface name."                       "SSM clock switch clock type."                           "SSM status enable."                       "SSM status mode."                       "SSM status station."                       "SSM status station ID."                       "SSM status ID protect"                       "SSM status quality unknown."                       "SSM status sec quality."                       O"SSM status wtr time,waiting interval for clock recover after clearing alarms."                       $"Enable the SSM local quality limit"                       5"A table containing disable transmit s1 information."                       3"Information about the disable transmit s1 of SSM."                       #"The SSM sync clock interface name"                       "The SSM sync clock type."                       "Enable/Disable transmit s1."                       -"create or delete ssm transmit s1 sync clock"                       /"A table containing SSM out clock information."                       "SSM out clock information."                       ""The SSM out clock interface name"                       ""The SSM out clock quality limit."                       "The SSM out clock mode."                       "The SSM out clock bits."                        "create or delete ssm out clock"                       4"A table containing SSM out clock bind information."                       !"SSM out clock bind information."                       ""The SSM out clock interface name"                       ("The SSM out clock bind interface name."                       $"The SSM out clock bind clock type."                       "The SSM out clock priority."                       %"create or delete ssm out clock bind"                       3"A table that contains current SSM out clock info."                       ."A list of current SSM out clock information."                       3"The external clock name of the current out clock."                       4"The clock type in the current ssm out clock table."                       *"The clock name of the current out clock."                       %"The state of the current out clock."                       $"The mode of the current out clock."                       '"The quality of the current out clock."                           F"The interface name of the wtr sync clock,only write access is valid."                       B"The clock type of the wtr sync clock,only write access is valid."                       �"The flag of clear wtr sync clock,clear all or clear one clock.
            Only flag should be setted when clear all,when clear one clock,
            the all arrtibutions must be setted,only write access is valid."                       ~"Initial all SSM attribution,the value 1 means to execute initialization.
             read access has no actual importance."                       /"A table containing SSM edge link information."                       )"Information about the edge link of SSM."                       ("The SSM edge link clock interface name"                       "The SSM edge link clock type."                       ,"The SSM sync clock is or not other device."                       &"create or delete ssm edge link clock"                       0"A table containing SSM trasmit s1 information."                       +"Information about the transmit s1 of SSM."                       $"The SSM sync clock interface name."                       "The SSM sync clock type."                       "The transmit S1 operation."                       &"The S1 value for fixed transmitting."                       /"create or delete ssm trasmit s1 setting clock"                       1"A table containing SSM sa position information."                       "SSM sa position."                       ""The SSM external interface name."                       "The SSM sa receive position."                       "The SSM sa send position."                       )"create or delete ssm sa position clock."                      