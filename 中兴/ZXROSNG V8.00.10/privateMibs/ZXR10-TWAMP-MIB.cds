L--  ************************************************
--  $Id: ZXR10-TWAMP-MIB.mib  2017-11-14 15:30:22Z SONGYAN $
--
--  ZXR10-TWAMP-MIB.mib: ZXR10 TWAMP query MIB file
--
--  Nov. 2017, Song Yan
--
--  Copyright(c) 2012 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                                         "ZXROS SMI MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201711140000Z" 
"twampMib"       -- Nov 14, 2017
       ."The configuration table of TWAMP connection."                       r"An entry containing configuration informations which apply to the 
             particular connection of TWAMP."                       6"Connection ID used to identify the TWAMP connection."                       ?"The server IP address which is specified by TWAMP connection."                       ="The server TCP port which is specified by TWAMP connection."                       #"The VRF name of TWAMP connection."                       @"The failed repetition number of TWAMP connection.(default :10)"                       C"The failed repetition interval of TWAMP connection.(default :30s)"                       "Row status"                       +"The configuration table of TWAMP session."                       n"An entry containing configuration informations which apply to the 
            particular session of TWAMP."                       4"The connection ID applies to the session of TWAMP."                       $"The identity of the TWAMP session."                       )"The sender IP address of TWAMP session."                       '"The sender UDP port of TWAMP session."                       +"The receiver IP address of TWAMP session."                       )"The receiver UDP port of TWAMP session."                        "The VRF name of TWAMP session."                       7"The detect path type of TWAMP session.(default :down)"                       t"The inbound-interface of TWAMP session, and it applies to 
            condition when the detect path type is up."                       ."The DSCP value of TWAMP session.(default :0)"                       }"The length of packet padding, and the upper limit of this 
             parameter depends on the device.(default :27bytes)"                       �"Timeout ranges from 1s to 10s. Within this time, the 
            server needs to reflect the test message, otherwise 
            the message is discarded.(default :5s)"                      �"The sending packet mode:
            continuous:In this mode,the test packets will always be sent 
            until the user stops.
            packets:In this mode,the test will be stopped until the number of 
            sending packet reaches the configured value.
            seconds:In this mode,the test will be stopped until the time of 
            sending packet reaches the configured value.(default :continuous)"                       �"The number of sending packet which applies to condition when 
            the sending packet mode is packets.The test will be stopped 
            until the number of sending packet reaches the configured value."                       �"Sending time of packets which applies to condition when the 
            sending packet mode is seconds. The test will be stopped until 
            the time of sending packets reaches the configured value."                       r"The unit of sending interval which including second, millisecond 
            and microsecond.(default :second)"                       �"Packet sending interval:
            If the unit is assigned second,it ranges from 1 to 60.
            If the unit is assigned millisecond,it ranges from 1 to 1000.
            If the unit is assigned microseconds,it ranges from 50 to 1000."                       >"The statistics interval,ranges from 5s to 60s.(default :15s)"                       "Row status"                       2"The configuration table of proactive TWAMP test."                       r"An entry containing configuration information applicable to a 
             particular proactive test of TWAMP."                       ;"The connection ID applies to the proactive test of TWAMP."                       Z"The proactive operation type which including start and stop.
           (default :stop)"                       2"The configuration table of on-demand TWAMP test."                       r"An entry containing configuration information applicable to a 
             particular on-demand test of TWAMP."                       ;"The connection ID applies to the on-demand test of TWAMP."                       ["The on-demand operation type which including start and stop.
            (default :stop)"                           Y"The status of TWAMP server,including enable and disable.
           (default: disable)"                       <"Inactivity timeout,ranges from 10s to 1800s.(default: 900)"                       "The maximum duration of connection,ranges from 0h to 24h.
            If this node is assigned 0,it means permanence connection unless 
            stopped manually.If it is assigned 1h to 24h,it means connection 
            lasting time.(default: 0)"                       �"The maximum number of connections which the minimum value is 1,
            and the maximum value of this parameter depends on the device.
           (default: 64)"                       �"The maximum number of sessions which the minimum value is 1, and 
            the maximum value of this parameter depends on the device.
            (default: 128)"                       �"The maximum session number of each connection which the minimum 
            value is 1, and the maximum value of this parameter depends on the
            device.(default: 8)"                       ["The port number of server, ranges from 1025 to 65535, or 862.
            (default: 862)"                       h"The ignore-vrf status,including enable and disable.
            (default value depends on the device)"                       Z"The status of client list, including enable and disable.
            (default: disable)"                       /"The configuration table of TWAMP client list."                       n"An entry containing configuration information applicable to a 
             particular client list of TWAMP"                       "IP address of the white list."                       "Row status"                       &"The result table of TWAMP detecting."                       T"An entry containing result information applicable to TWAMP
            detecting."                       +"The connection ID,ranges from 1 to 65535."                       ("The session ID,ranges from 1 to 65535."                       "The count of sending packets."                       !"The count of receiving packets."                       "The count of lossing packets."                       9"The packet loss ratio which the precision is 1/1000000."                       "Two way delay.(unit: ns)"                       )"The minimum of two way delay.(unit: ns)"                       )"The maximum of two way delay.(unit: ns)"                       )"The average of two way delay.(unit: ns)"                       +"Delay jitter of two way packet.(unit: ns)"                       7"The minimum delay jitter of two way packet.(unit: ns)"                       7"The maximum delay jitter of two way packet.(unit: ns)"                       7"The average delay jitter of two way packet.(unit: ns)"                       %"The forward packet delay.(unit: ns)"                       0"The minimum of forward packet delay.(unit: ns)"                       0"The maximum of forward packet delay.(unit: ns)"                       0"The average of forward packet delay.(unit: ns)"                       /"Delay jitter of the forward packet.(unit: ns)"                       >"The minimum of delay jitter of the forward packet.(unit: ns)"                       >"The maximum of delay jitter of the forward packet.(unit: ns)"                       >"The average of delay jitter of the forward packet.(unit: ns)"                       %"The reverse packet delay.(unit: ns)"                       0"The minimum of reverse packet delay.(unit: ns)"                       0"The maximum of reverse packet delay.(unit: ns)"                       0"The average of reverse packet delay.(unit: ns)"                       ,"The reverse packet delay jitter.(unit: ns)"                       >"The minimum of delay jitter of the reverse packet.(unit: ns)"                       >"The maximum of delay jitter of the reverse packet.(unit: ns)"                       >"The average of delay jitter of the reverse packet.(unit: ns)"                          