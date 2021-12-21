0-- *****************************************************************
-- ZXROSNG-MPPP-MIB.mib 
-- MPPP MIB Definitions  
-- yangzhongming10106586
-- 2013-03-12
--
-- Copyright (c) 1985-2013 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
                                                                         C"This MIB contains managed object definitions for the ZXROSng MPPP" f" Yang Zhongming
         Tel:    +86-25-653460
         E-mail: yang.zhongming@zte.com.cn
       " "201706271000Z" "201706221000Z" "201503091025Z" "201307011100Z" "201303121400Z" Q"modify the description of zxr10MpppMemberConfigEPD and zxr10MpppMemberRemoteEPD" |"modify: change type of zxr10MpppMemberConfigEPD and zxr10MpppMemberRemoteEPD
          from OCTET STRING to DisplayString" ]"modify: change rang of zxr10MpppMemberRemoteEPD and zxr10MpppMemberRemoteEPD to SIZE(0..32)" �"del: zxr10MpppMultilinkRowStatus
          modify: zxr10MpppMultilinkLoadBalance
                  zxr10MpppMultilinkFragmentation
         " $"Initial version of this MIB module"       --2017-06-27 10:00
                       -"A table containing mppp member information."                        "Information about mppp member."                       ""The mppp member masterport name."                       "The mppp member ifname."                       #"The mppp member masterport index."                       "The mppp member ifindex."                       "The mppp member ifstate."                       a"The mppp member config-epd. When no configuration is available,
              N/A is obtained."                       ^"The mppp member remote-epd. When the value is not available,
              N/A is obtained."                       "The status of the row."                               0"A table containing mppp multilink information."                       #"Information about mppp multilink."                       "The mppp multilink port name."                        "The mppp multilink port index."                       !"The mppp multilink loadbalance."                       #"The mppp multilink fragmentation."                                  