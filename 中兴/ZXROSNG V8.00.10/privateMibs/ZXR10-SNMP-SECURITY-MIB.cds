-- *****************************************************************
-- SNMPSECURITY.mib 
-- chen meijin
-- 2010-3-10 9:35
-- 
--
-- Copyright (c) 1985-2008 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
   ""               ""               ""                                                 "" "ZTE" "201504140000Z" "200905200000Z" �"Delete the TAB char,
            modify definition of SecurityStage,
                   definition of ChangeStage,
                   definition of ChangeReason,
                   and SYNTAX of secTryCount from INTEGER to Counter32." "snmp-security"               "The wrong community string."                       "The source ip."                       "The current stage."                       "The time of loging off."                       +"The stage which the security model is in."                       *"The reason which result to change stage."                       "The count of failure try."                           ,"when a failed login happened, send a trap."                 ,"when a failed login happened, send a trap."                    