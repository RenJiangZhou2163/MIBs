�--  ************************************************
--  $Id: ZXROSNG-PROTECT-GROUP-MIB.mib 12 2012-10-20 16:10:23Z wangchuanming$
--
--  ZXROSNG-PROTECT-GROUP-MIB.mib:ZXR10 ethnet query and configuration MIB file
--  
--  June. 2012, wangchuanming
--   
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************          
    "protetc group list group type."                                                                                     2"ZXROS v4.6.03 ethnet query and configuration MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201310221000Z" "201210200000Z" t"modify: ProtectGroupType
                zxPGListConfigMasterTGID
                zxPGListSlaveTGConfigSlaveTGID" #"The Mib for Protection Group List"       --2013-10-22 10:00
       "Protection Group List table"                       $"Protection Group List Config Entry"                       '"The number of this protect group list"                       3"The protect group type of this protect group list"                       y"The master tunnel group of this protect group list.
             The maximum can be configured is dynamically defined."                       0"The master pw group of this protect group list"                       "row status"                       ="Protection group list tunnel group type configuration table"                       ""                       '"The number of this protect group list"                       x"The slave tunnel group of this protect group list.
             The maximum can be configured is dynamically defined."                       3"The slave tunnel group of this protect group list"                       "Posnet configuration table"                       ""                       '"The number of this protect group list"                       /"The slave pw group of this protect group list"                       "row status"                          