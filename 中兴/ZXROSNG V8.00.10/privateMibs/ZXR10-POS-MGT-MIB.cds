c--  ************************************************
--  $Id: ZXR10-POS-MGT-MIB.mib 12 20010-08-13 01:01:17Z taowq $
--
--  ZXR10-ETH-MGT.mib: ZXR10 pos query and  configuration MIB file
--  
--  Jun. 2010, liu chao
--   
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
  �"A unique value, greater than zero, for each interface or
            interface sub-layer in the managed system.  It is
            recommended that values are assigned contiguously starting
            from 1.  The value for each interface sub-layer must remain
            constant at least from one re-initialization of the entity's
            network management system to the next re-initialization."                                     2"ZXROS v4.6.03 ethnet query and configuration MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201501120000Z" "201008170000Z" 8"Add zxr10PosRecvStatsOverRun in zxr10POSRecvStatsTable" ""                       "Posnet configuration table"                       ""                       #"Physical Posnet interface ifIndex"                       ""Physical Posnet interface ifName"                       "Physical Posnet interface No"                       %"Physical Posnet interface EncapType"                       &"Physical Posnet interface SingleComm"                       ""Physical Posnet interface IpLdsh"                       )"Physical Posnet interface LdshBandwidth"                       %"Physical Posnet interface StrictMtu"                       *"Physical Posnet interface LoopbackStatus"                       &"Physical Posnet interface frame type"                       "Physical Posnet interface CRC"                       $"Physical Posnet interface Scramble"                       &"Physical Posnet interface clock mode"                       #"Physical Posnet interface flag c2"                        "Posnet receive statistic table"                       ""                       ""                       ""                       ""                       ""                       ""                       ""                       ""                       ""                       $"Received OverRun Packets on Posnet"                              