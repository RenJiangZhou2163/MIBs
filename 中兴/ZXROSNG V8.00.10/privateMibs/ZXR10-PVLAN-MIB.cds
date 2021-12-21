N--  ************************************************
--  $Id: zxr10-PVLAN-MIB.mib 8 2013-11-05 12:17:08Z xiaguibin $
--
--  zxr10-PVLAN-MIB.mib: ZXR10 PVLAN MIB file
--
--  Mar. 2013, Xia Guibin
--   
--  Copyright(c) 2014 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                         5"The MIB module to describe PVLAN table information." |"
            Name:  Xia guibin
            Tel:   +86-25-52870000
            Email: xia.guibin@zte.com.cn
           " "201311061314Z" $"Initial version of this MIB module"       -- 2013-11-06 13:14 
               +"The PVLAN isolate port information table."                       %"The PVLAN isolate port table entry."                       "The PVLAN session ID."                       /"The isolate port name, the max number is 256."                       *"The PVLAN promis port information table."                       $"The PVLAN promis port table entry."                       "The PVLAN session ID."                       ,"The promis port name, the max number is 4."                       -"The PVLAN community port information table."                       '"The PVLAN community port table entry."                       "The PVLAN session ID."                       0"The community port name, the max number is 16."                       *"The PVLAN vlan bitmap information table."                       $"The PVLAN vlan bitmap table entry."                       "The PVLAN session ID."                       %"The vlan bitmap infomation(1-4094)."                                  