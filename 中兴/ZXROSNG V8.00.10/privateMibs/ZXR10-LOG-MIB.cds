 �-- *****************************************************************
-- log.mib 
--
-- 2008-4-1 18:53
-- 
--
-- Copyright (c) 1985-2007 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
--
   "enum for login type"                                                                 ."The MIB module to describe the LOG protocol." |"      sun nianhua
               Tel:    +86-25-52870000
               E-Mail: sun.nianhua1@zte.com.cn
               " "201407080000Z" "201308210000Z" "201307050000Z" "201305131056Z" "200804021000Z" /"modify:    add disconnect(5) to operLogResult" "discard:    syncLogTable" "modify:    operLogType" "modify:    operLogResult" %"Initial version of this MIB module."               %"A list of sync logging information."                       !"An entry to sync logging table."                       ""Flow identifier or serial number"                       "Command identifier"                       "Command string"                       "Time stamp of logging"                       "IP address"                       '"Vty number. 0:con0, 1-n:vty0-vty(n-1)"                       *"A list of operating logging information."                       &"An entry to operating logging table."                       ""Flow identifier or serial number"                       "Command identifier"                       "Command string"                       "Time stamp of logging"                       "IP address"                       '"Vty number. 0:con0, 1-n:vty0-vty(n-1)"                       "User name"                       "Logging type"                       "Result of command processing"                           "The class of the message."                       "The level of the message."                      "The text of the message.  If the text of the message
                 exceeds 255 bytes, the message will be truncated to
                 254 bytes and a '*' character will be appended -
                 indicating that the message has been truncated."                        "The time stamp of the message."                           c"Send the trap of the operating logging information 
                 to uniform network manager."                    