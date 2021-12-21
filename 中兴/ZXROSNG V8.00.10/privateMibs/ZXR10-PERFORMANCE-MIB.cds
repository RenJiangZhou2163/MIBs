 �--  ************************************************
--  Id: ZXR10-PERFORMANCE-MIB.mib 
--
--  2013-01-30, Yu Xiangnan
--
--  Copyright(c) 2013 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                         "ZXROS performance MIB" �"ZTE Corporation
         Nanjing Institute of ZTE Corporation

         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China" "201307090000Z" "zxr10PerfMIB"                   �"Can set value:{
                       300: Data save interval 300s(5min)
                       900: Data save interval 900s(15min)
                   }"                       "Perf data-update period table"                       ."An entry containing data-update period info:"                      �"Can set value:{
                       17   : Ethport interface checkPtType,
                       18   : Posport interface checkPtType,
                       19   : Cposport interface checkPtType,
                       22   : Atmport interface checkPtType,
                       36   : Subport interface checkPtType,
                       65535: All interface checkPtType
                   }"                      i"Can set value:{
                      2 : set update interval 2s,
                      5 : set update interval 5s,
                      10: set update interval 10s,
                      30: set update interval 30s,
                      60: set update interval 60s
                   }
    Distinguish project, param value 2 and 5 is for 89 project."                       �"The status of the row.The writable columns in a row can not be changed if the row
        is active. All columns must have a valid value before a row can be activated."                       "Perf 0Supress table"                       -"An entry containing zero supress state info"                       W"Can set value:{
                       65535 : all checkPtType
                   }"                       ,"62 byte with value 255(0xff) in every byte"                       �"Can set value:{
                      1: currentQtime,
                      2: historyQtime,
                      3: currentDtime,
                      4: historyDtime,
                   }"                       E"The status of the row
    active(1) :SuppressState is Unsuppressed"                              