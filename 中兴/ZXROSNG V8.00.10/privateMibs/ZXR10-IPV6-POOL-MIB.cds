�--  ************************************************************************************
--  $Id: ZXR10-IPV6-POOL-MIB.mib 13 2011-04-01 01:01:26Z suqing $
--
--  ZXR10-IPV6-POOL-MIB.mib:  ROSNG IPv6 pool Configuration MIB file
--  
--  April. 2011, Su Qing
--   
--  Copyright(c) 2011 by ZTE Corporaton
--  All rights reservered
--
--  *************************************************************************************
                                                         "M6000 60 IPv6 pool config MIB" �"ZTE Corporation 
             Nanjing Institute of ZTE Corporation
         
             No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
             Tel: +86-25-52870000" "201504030000Z" "201503101530Z" "201402101530Z" "201310300000Z" "201012250000Z"�"1.Change range of zxr10IPv6AddrPoolSummaryRangeNum from (0..100)
               to (0..65535);      
             2.Change range of zxr10IPv6AddrPoolSummaryExcludeRangeNum 
             from (0..100) to (0..65535);
             3.Change range of zxr10IPv6PrefixPoolSummaryRangeNum 
             from (0..100) to (0..65535);
             4.Change range of zxr10IPv6PrefixPoolSummaryExcludeRangeNum 
             from (0..100) to (0..65535)."B"1.Modify SYNTAX of zxr10IPv6AddrPoolSummaryPoolName,
               change from DisplayString(SIZE(1..15)) to DisplayString(SIZE(1..31));      
             2.Modify SYNTAX of zxr10IPv6AddrPoolRangePoolName,
               change from DisplayString(SIZE(1..15)) to DisplayString(SIZE(1..31));   
             3.Modify SYNTAX of zxr10IPv6AddrPoolExcludeRangePoolName,
               change from DisplayString(SIZE(1..15)) to DisplayString(SIZE(1..31));   
             4.Modify SYNTAX of zxr10IPv6AddrPoolConflictPoolName, 
               change from DisplayString(SIZE(1..15)) to DisplayString(SIZE(1..31));   
             5.Modify SYNTAX of zxr10IPv6PrefixPoolSummaryPoolName,
               change from DisplayString(SIZE(1..15)) to DisplayString(SIZE(1..31));   
             6.Modify SYNTAX of zxr10IPv6PrefixPoolPrefixPoolName,
               change from DisplayString(SIZE(1..15)) to DisplayString(SIZE(1..31));   
             7.Modify SYNTAX of zxr10IPv6PrefixPoolExcludePoolName, 
               change from DisplayString(SIZE(1..15)) to DisplayString(SIZE(1..31)).""1.Modify DESCRIPTION of zxr10IPv6PrefixPoolPrefixDelegationLenth,
               change to 'IPv6 delegation length.';      
             2.Modify DESCRIPTION of zxr10IPv6PrefixPoolPrefixLenth,
               change to 'IPv6 prefix length.';
             3.Modify DESCRIPTION of 
               zxr10IPv6PrefixPoolExcludePrefixDelegationLenth,
               change to 'IPv6 delegation length.';
             4.Modify DESCRIPTION of zxr10IPv6PrefixPoolExcludePrefixLenth, 
               change to 'IPv6 prefix length.';
             5.In zxr10IPv6AddrPoolExcludeTable,the 
               zxr10IPv6AddrPoolExcludeRangeFreeIPNum and 
               zxr10IPv6AddrPoolExcludeRangeUsedIPNum has INTEFER syntax 
               with range, change the range (0..2048) to (0..131072); 
             6.In zxr10IPv6PrefixPoolExcludeTable,the 
               zxr10IPv6PrefixPoolExcludeFreePrefixNum and 
               zxr10IPv6PrefixPoolExcludeUsedPrefixNum has INTEFER syntax 
               with range, change the range (0..2048) to (0..131072)."W"1.Add five nodes in zxr10IPv6AddrPoolSummaryTable as follows,
               zxr10IPv6AddrPoolSummaryTIPNumH1,
               zxr10IPv6AddrPoolSummaryTIPNumH2,
               zxr10IPv6AddrPoolSummaryTIPNumH3,
               zxr10IPv6AddrPoolSummaryTIPNumH4
               and zxr10IPv6AddrPoolSummaryUtlRatio;      
             2.Add five nodes in zxr10IPv6PrefixPoolSummaryTable as follows,
               zxr10IPv6PrefixPoolSumryTIPNumH1,
               zxr10IPv6PrefixPoolSumryTIPNumH2,
               zxr10IPv6PrefixPoolSumryTIPNumH3,
               zxr10IPv6PrefixPoolSumryTIPNumH4
               and zxr10IPv6PrefixPoolSumryUtlRatio; 
             3.Add eight nodes in zxr10IPv6PoolStatGroup as follows,
               zxr10IPv6PoolStatAddrTFreeNumH1,
               zxr10IPv6PoolStatAddrTFreeNumH2,
               zxr10IPv6PoolStatAddrTFreeNumH3,
               zxr10IPv6PoolStatAddrTFreeNumH4,
               zxr10IPv6PoolStatPrefxTFreeNumH1,
               zxr10IPv6PoolStatPrefxTFreeNumH2,
               zxr10IPv6PoolStatPrefxTFreeNumH3
               and zxr10IPv6PoolStatPrefxTFreeNumH4;
             4.In zxr10IPv6PrefixPoolPrefixTable,the 
               zxr10IPv6PrefixPoolPrefixDelegationLenth and 
               zxr10IPv6PrefixPoolPrefixLenth has INTEFER syntax without range,
               add range (1..128) to them.
             5.In zxr10IPv6PrefixPoolExcludeTable,the 
               zxr10IPv6PrefixPoolExcludePrefixDelegationLenth and 
               zxr10IPv6PrefixPoolExcludePrefixLenth has INTEFER syntax 
               without range, add range (1..128) to them." :"This mib defines management information objects for DHCP"       -- April 3, 2015
           ,"The summary table of current address pool."                       <"This list contains IPv6 address pool summary configuration"                       "IPv6 address pool name."                       2"The number of current IPv6 address pool's range."                       :"The number of current IPv6 address pool's exclude range."                       S"The high 8 octets of IPv6 address number which is not 
                    used."                       U"The lower 8 octets of IPv6 address number which is not 
                     used."                       P"The high 8 octets of IPv6 address number which is 
                     used."                       Q"The lower 8 octets of IPv6 address number which is 
                     used."                        "The threshold of current pool."                       ""The locked flag of current pool."                       /"The confilict address number of current pool."                       "IPv6 address conflict time."                       s"The first high 4 octets of total address number which 
                    current IPv6 address pool configured."                       t"The second high 4 octets of total address number which 
                    current IPv6 address pool configured."                       s"The third high 4 octets of total address number which 
                    current IPv6 address pool configured."                       m"The last 4 octets of total address number which 
                    current IPv6 address pool configured."                       1"Utilization ratio of current IPv6 address pool."                       #"The detail table of current pool."                       :"This list contains IPv6 address pool range configuration"                       "IPv6 address pool name."                       *"The start IPv6 address of current range."                       ("The end IPv6 address of current range."                       +"VRF name which binded with current range."                       T"The high 8 octets of IPv6 address number which is not 
                     used."                       T"The lower 8 octets of IPv6 address number which is not 
                    used."                       O"The high 8 octets of IPv6 address number which is 
                    used."                       Q"The lower 8 octets of IPv6 address number which is 
                     used."                       $"The exclude table of current pool."                       <"This list contains IPv6 address pool exclude configuration"                       "IPv6 address pool name."                       2"The start IPv6 address of current exclude range."                       0"The end IPv6 address of current exclude range."                       3"VRF name which binded with current exclude range."                       /"The number of IPv6 address which is not used."                       +"The number of IPv6 address which is used."                       %"The conflict table of current pool."                       @"This list contains IPv6 address pool conflict IPv6 information"                       "IPv6 address pool name."                       "IPv6 address conflict time."                       "IPv6 conflict address."                       "VRF name."                       *"The stamp time of IPv6 conflict address."                           +"The summary table of current prefix pool."                       ;"This list contains IPv6 prefix pool summary configuration"                       "IPv6 prefix pool name."                       S"The number of current IPv6 prefix pool's prefix 
                    delegation."                       ["The number of current IPv6 prefix pool's exclude prefix 
                    delegation."                       S"The high 8 octets of IPv6 address number which is not 
                    used."                       U"The lower 8 octets of IPv6 address number which is not 
                     used."                       9"The high 8 octets of IPv6 address number which is used."                       :"The lower 8 octets of IPv6 address number which is used."                        "The threshold of current pool."                       ""The locked flag of current pool."                       k"The first high 4 octets of total number which current IPv6 
                     prefix pool configured."                       l"The second high 4 octets of total number which current IPv6 
                     prefix pool configured."                       k"The third high 4 octets of total number which current IPv6 
                     prefix pool configured."                       e"The last 4 octets of total number which current IPv6 
                     prefix pool configured."                       8"Utilization ratio of current IPv6 prefix address pool."                       #"The detail table of current pool."                       E"This list contains IPv6 prefix pool prefix delegation configuration"                       "IPv6 prefix pool name."                       "IPv6 prefix delegation."                       "IPv6 delegation length."                       "IPv6 prefix length."                       /"VRF name which binded with prefix delegation."                       T"The high 8 octets of IPv6 address number which is not 
                     used."                       U"The lower 8 octets of IPv6 address number which is not 
                     used."                       P"The high 8 octets of IPv6 address number which is 
                     used."                       Q"The lower 8 octets of IPv6 address number which is 
                     used."                       $"The exclude table of current pool."                       ;"This list contains IPv6 prefix pool exclude configuration"                       "IPv6 prefix pool name."                       !"IPv6 exlcude prefix delegation."                       "IPv6 delegation length."                       "IPv6 prefix length."                       N"VRF name which binded with exclude prefix 
                     delegation."                       /"The number of IPv6 address which is not used."                       +"The number of IPv6 address which is used."                           f"The high 8 octets of total address number 
                     which IPv6 address pool configured."                       g"The lower 8 octets of total address number 
                     which IPv6 address pool configured."                       W"The high 8 octets of used address number 
                     in IPv6 address pool."                       X"The lower 8 octets of used address number 
                     in IPv6 address pool."                       )"Utilization ratio of IPv6 address pool."                       e"The high 8 octets of total address 
                     number which IPv6 prefix pool configured."                       f"The lower 8 octets of total address 
                     number which IPv6 prefix pool configured."                       V"The high 8 octets of used address number 
                     in IPv6 prefix pool."                       V"The lower 8 octets of used address number 
                    in IPv6 prefix pool."                       ("Utilization ratio of IPv6 prefix pool."                       ""Total usable address and prefix."                       c"The first high 4 octets of total free address 
                     number in IPv6 address pool."                       d"The second high 4 octets of total free address 
                     number in IPv6 address pool."                       c"The third high 4 octets of total free address 
                     number in IPv6 address pool."                       ]"The last 4 octets of total free address 
                     number in IPv6 address pool."                       `"The first high 4 octets of total free address
                    number in IPv6 prefix pool."                       a"The second high 4 octets of total free address
                    number in IPv6 prefix pool."                       `"The third high 4 octets of total free address
                    number in IPv6 prefix pool."                       Z"The last 4 octets of total free address
                    number in IPv6 prefix pool."                          