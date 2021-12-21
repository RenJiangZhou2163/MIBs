--  ************************************************
--  ZXR10-IP-SOURCE-GUARD-MIB.mib 
--  ZXR10 IP Source guard configuration MIB file
--  Dec. 2012
--  Copyright(c) 2012 by ZTE Corporaton
--  All rights reservered
--  ************************************************
                                                                                         F"The MIB module to describe IP data filtering policy of interface(s)." _"Xiao Niankun  ZTE Corporation 
		 Mail: xiao.niankun@zte.com.cn
         Tel : +86-21-64673" "201212250000Z" ""                       &"IP Source Guard configuration table."                       &"IP Source Guard configuration entry."                       "Interface name."                       A"Set ip-source-guard mode base on mac(1),ip(2) or mac and ip(3)."                      "Designate VLAN ID of ip-source-guard. 
             The value of 0 means no VLAN being designated.
             The range from 1 to 4094 means appointed VLAN ID.
             The other values is invalid. 
			 It must be set together with zxr10IPSourceGuardMode."                      E"Designate default VLAN of ip-source-guard.
             The value of 0 means no VLAN being designated,
             or specific VLAN appointed by zxr10IPSourceGuardVLAN.
             The value of 1 means default VLAN,
			 the same as all VLAN being designated. 
			 It must be set together with zxr10IPSourceGuardMode."                       "Interface name."                                  