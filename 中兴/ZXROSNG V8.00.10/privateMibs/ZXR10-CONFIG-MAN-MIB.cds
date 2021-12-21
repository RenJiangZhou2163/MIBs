 �-- *****************************************************************
-- ZXR10-CONFIG-MAN-MIB.mib
-- Copyright (c) 1985-2012 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
--
                                                        �"this MIB intends to include only such operations as clearly
            relate to configuration.  Its primary emphasis is to
            track changes and saves of the running configuration.
            
            Information from zxcmConfigTraceTable can be used
            to track the exact configuration changes that took
            place within a particular Configuration History
            event. NMS' can use this information to update 
            the related components." �"
            Address: 68 hao, Zijinghua road, Yuhuatai District, Nanjing City,
                     Jiangsu Province, P.R. China 
            Zip    : 210012
            E-mail : hou.xiaoyan@zte.com.cn
            " "201709041030Z" "201410161030Z" "201304091600Z" �" Add the state which indicates whether the trap can be sent
         add:       zxr10ConfigGlobalObjects
                    zxr10ConfigurationTrapSwtich
        " "add:       zxr10cmRunLstChngedTmnlIpv4Addr
                    zxr10cmRunLstChngedTmnlIpv6Addr
                    zxr10cmRunLstChngedTmnlIpAddrTp
                    zxr10cmRunLstChngedTmnlTp
         modify:    zxr10cmRunningConfigChanged
        " %"Initial version of this MIB module."       --2017/9/4 10:30
          "The value of sysUpTime when the running configuration was 
            last changed.
            
            If the value of zxr10cmRunningLastChanged is greater than 
            zxr10cmRunningLastSaved, the configuration has been changed but 
            not saved."                      $"The value of sysUpTime when the running configuration
            was last saved (written) by TXT.   
            
            If the value of zxr10cmRunningLastChanged is greater than 
            zxr10cmRunningLastSaved, the configuration has been changed but 
            not saved."                      $"The value of sysUpTime when the running configuration
            was last saved (written) by ZDB.   
            
            If the value of zxr10cmRunningLastChanged is greater than 
            zxr10cmRunningLastSaved, the configuration has been changed but 
            not saved."                       E"The ip addr (ipv4) of the terminal which changed the configuration."                       E"The ip addr (ipv6) of the terminal which changed the configuration."                       C"The ip addr type of the terminal which changed the configuration."                       ;"The type of the terminal which changed the configuration."                           9"The state which indicates whether the trap can be sent."                               l"This notification indicates that the running
            configuration of the managed system has changed."                        