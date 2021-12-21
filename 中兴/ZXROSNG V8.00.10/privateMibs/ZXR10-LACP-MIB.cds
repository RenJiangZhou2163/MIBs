h--  ********************************************************
--  $Id: ZXR10-LACP.mib 2006-09-01 01:34:21Z wuxiaoxiang $
--
--  ZXR10-LACP.mib: ZXR10 LACP MIB file
--
--  Sep. 2006, Wu XiaoXiang
--  modify by yuly 155208
--  Copyright(c) 2006 by ZTE Corporation
--  All rights reserved
--
--  ********************************************************
   "LACP Backup Type"               "LACP Restore Mode Type"               "LACP Port State Type"               "LACP Port Timeout Type"               "LACP Port Type"               "LACP Mode"               "LACP Load Balance Type"               "LACP Fast Respond Type"                                                                                 C"This MIB contains managed object definitions for the ZXROSng LACP" y"  Yang Zengfang
               Tel : +86-25-15051656440
               E-mail: yang.zengfang@zte.com.cn
            " "201810300000Z" "201603280000Z" "201512300000Z" "201305130000Z" "201303180000Z" f"modify LACPLoadBalanceType:
               add dlbFlowFixed,dlbFlowTimeout,dlbPacket.
            " 0"add:  zxr10LacpAggPortDispersion
            " m"modify LACPLoadBalanceType:
               add dstIpDstPort,srcIpSrcPort,srcDstIpSrcDstPort.
            " �"add:  zxr10LacpAggHoldOff 
                   zxr10LacpMclagTable 
                   zxr10LacpEnableMclag                             
            " #"Update version of this MIB module"       --2018-10-30 00:00
               ("Configure Aggregating Port parameters."                       a"Each row index by ifIndex And 
                       contain imformation of Aggregating Port."                       "Smartgroup interface name."                       a"Mac address,the LACP module 
                           don't provide the SG interface's MAC !"                       "LACP System priority."                       "Aggregation Type."                        "Aggregation Load Balance Type."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       !"Aggregation Minimum Member Num."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       "Aggregated Port Name."                       !"Aggregation Minimum Member Num."                       "Aggregation Fast Respond."                       "Aggregation Active Limition."                       "Aggregation Restore Mode."                       "Aggregation Restore Time."                       "Aggregation TimeOut."                       ""The HoldOff Time of Aggregation."                       2"The flag whether the Aggregation configed mclag."                       ,"The port dispersion switch of Aggregation."                       )"Aggregating port bound aggregated port."                       a"Each row index by smartgroup 
                           port index and aggregated port index."                       "Smartgroup interface index."                       "Aggregated interface index."                       ."Configure Aggregating Port mclag parameters."                       g"Each row index by ifIndex And contain mclag 
                       imformation of Aggregating Port."                       "Smartgroup interface index."                       *"Mclag Iccp ID binded by each smartgroup."                       )"Mclag Roid configed by each smartgroup."                       +"Mclag NodeID configed by each smartgroup."                       )"Mclag Mode configed by each smartgroup."                       1"Mclag Restore Mode configed by each smartgroup."                       1"Mclag Restore Time configed by each smartgroup."                       ."Mclag Priority configed by each smartgroup. "                       /"Mclag System Mac configed by each smartgroup."                       4"Mclag System Priority configed by each smartgroup."                       1"Mclag Actor Backup configed by each smartgroup."                       ^"The Partner System Mac of 
                            the smartgroup which configed mclag."                       k"The Mclag Partner System Priority of the 
                              smartgroup which configed mclag."                       e"The Mclag Partner Priority  of 
                              the smartgroup which configed mclag."                       _"The Mclag Partner Roid of 
                             the smartgroup which configed mclag."                       a"The Mclag Partner NodeID of 
                             the smartgroup which configed mclag."                       a"The Mclag Partner Backup of 
                             the smartgroup which configed mclag."                           '"Configure Aggregated Port parameters."                       �"Each row index by aggregating and aggregated ifIndex 
                            And contain imformation of Aggregated Port."                       "Add to smartgroup interface."                       "Aggregated interface name."                       "LACP Port Type."                       "LACP Port Timeout."                       "Lacp Priority."                       "Lacp Port Operation Key."                       "Lacp Port Operation Status."                       "Lacp Partner Operation Key."                        "Lacp Partner Operation Status."                       "Aggregated interface index."                       "Lacp Partner Port Priority."                       "Lacp Port Backup."                       "Lacp Port Acitive Status."                       "Lacp Port Track Name."                       $"Lacp Port Partner System Priority."                        "Lacp Port Partner Mac Address."                          