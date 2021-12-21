1--  ************************************************
--  $Id: ZXR10-mac-config.mib 2010-04-10 $
--
--  ZXR10_mac.mib: ZXR10 mac config MIB file
--  
--  April 2010, 
--   
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                     "ZXROSNG MAC config" �"ZTE Corporation
         Nanjing Institute of ZTE Corporation

         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China

         Tel: +86-25-52870000" "201305021000Z" "201304021000Z" "201004100000Z"B"
            delete tab
            delete '(1..4094)' not allowed
            delete definition : DisplayString,BOOL,LEARNSTRATEGY
                                HIGIGLEARN,SAFEMODEPOLICY,MAXNUMTYPE
                                MacFilterType,WorkingMode
            delete hyphen of enumerated label
        "{"
        change to obsolete:
            macGlobalProtect
            macGlobalProtectTime
            macGlobalLearnStrategy
            macGlobalHigigLearn
            macGlobalLogAlarm
            macGlobalToPermanentAutoWrite
            macGlobalToPermanentAutoWriteInterval
            macInterfaceConfig
            macVlanConfig
            macItem
        " ""       --2013-05-02 10:00
           "Current MAC Number Total."                       "Max MAC number Total."                       "MAC aging-time."                       &"Configuration of MAC protect global."                       $"Configuration of MAC protect-time."                       X"Configuration of MAC learning global. 
                            Default is enable."                       x"Configuration of MAC learn-strategy, include:
                     by-switchchip and by-NP. Default is by-switchchip."                       p"Configuration of MAC global higig learn, include: 
                    normal and special. Default is normal."                       T"Configuration of MAC alarm for mac-move. 
                    Default is disable."                       `"Configuration of autowrite toPermanent 
                    MAC to FLASH. Default is disable."                       ["Interval for autowrite toPermanent MAC to FLASH.
                    Default is one day."                       "MAC alarm threshold."                       "MAC history max num."                           1"Configuration and status for MAC table on port."                       ""                       "Port out-index."                       "Port name."                       ;"Configuration of MAC learning on port. Default is enable."                       �"Configuration of max MAC number on port. Command of limit-num 
                  and unknow-filter-limit-num can change this value both."                       "Current MAC number on port."                       g"Configuration of discarding unknownsource MAC or not on port. 
                  Default is disable."                       ;"Configuration of MAC protect on port. Default is disable."                       \"Configuration of MAC toPermanent function on port. 
                  Default is disable."                       �"Configuration of MAC policy for safemode on port. Including 
              disable, enableAlarm and enableShutdown. Default is disable."                       �"Configuration of MAC policy while reach max MAC on port. 
              Command of limit-num can set stopLearn, and 
              command of unknow-filter-limit-num can set unknownFilt. 
              Default is stopLearn."                           1"Configuration and status for MAC table in vlan."                       ""                       
"Vlan ID."                       ("Configuration of MAC learning in vlan."                       "Current MAC number in vlan."                           "MAC table items."                       ""                       
"Vlan ID."                       "Mac address."                       "Port name."                       ["MAC filter type. Including noFilter, srcFilter, 
              dstFilter and bothFilter."                       v"Status of item storage in MAC table. Including dynamic, 
              static, permanent, toStatic and toPermanent."                          