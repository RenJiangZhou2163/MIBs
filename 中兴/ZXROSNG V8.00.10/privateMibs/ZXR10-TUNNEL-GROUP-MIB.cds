�--  ************************************************
--  $Id: ZXR10-TUNNEL-GROUP-MIB.mib 12 2012-06-10 16:10:23Z wangchuanming$
--
--  ZXR10-TUNNEL-GROUP-MIB.mib: ZXR10 ethnet query and  configuration MIB file
--  
--  June. 2012, wangchuanming
--   
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************          
   ,"protection switching type of tunnel group."               ""protection type of tunnel group."               ""switch strategy of tunnel group."               "switch state of tunnel group."               ,"protection receiving type of tunnel group."               0"state of working tunnel and protection tunnel."                                                     2"ZXROS v4.6.03 ethnet query and configuration MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201607251600Z" "201403061000Z" "201310221000Z" "201206100000Z" N"Expand the maxmum value of zxTunnelGroupStatusTGID from 32768 to 4294967295." c"Modify the description of self define type.
               Modify the description of leaf nodes." �"modify: ProtectType
                ProtectDirection
                ProtectReceiver
                SwitchStrategy
                TunnelState
                SwitchFlag               
                zxTunnelGroupID" "The Mib for Tunnel Protection"       --2016-07-25 16:00
       "Posnet configuration table"                       ""                       _"ID of the tunnel group,
             it's maximum value depends on the performance parameter"                       %"Protection type of the tunnel group"                       /"Protection switching type of the tunnel group"                       /"Protection receiving type of the tunnel group"                       "ID of the working tunnel"                       "ID of the protection tunnel"                       %"Switch strategy of the tunnel group"                       "Posnet configuration table"                       ""                       "ID of the tunnel group"                       "State of the working tunnel"                        "State of the protection tunnel"                       ""Switch state of the tunnel group"                          