;--  ************************************************
--  $Id: zxr10cli.mib 8 2010-10-25 12:17:08Z songb $
--
--  zxr10cli.mib: ZXR10 CLI MIB kfile
--
--  Oct. 2010, songbo 170727
--
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                                                         >"clock manager: timezone and summer time 
                  " "ZTE" "201707241008Z" "201503311600Z" "201404211108Z" "201311051550Z" "201010250000Z" �"add zxr10TimeZoneGlobalObjects
                 zxr10SummerTimeGlobalObjects
                 zxr10TimeGlobalObjects
                 zxr10SyncSourceObjects
                 zxr10SyncControlObjects
                 " "add summerTimeSignOffset" p"modify TimezoneOffset
                    the max value of TimezoneOffset change to 899
                    ""modify timezoneName
                    summerTimeName
                    summerTimeStartTime
                    summerTimeEndTime
                    the max length of timezonename change to 32
                    and SYNTAX DisplayString add length
                    " "CLI"                   "Name of time zone."                       "Offset from UTC in minutes. "                           "Name of time zone in summer. "                       h"Offset to add in minutes(1-240). 
                Replace summerTimeOffset with summerTimeSignOffset."                       1"Start time is relative to yyyy-mm-dd hh:mm:00. "                       /"End time is relative to yyyy-mm-dd hh:mm:00. "                       "Offset to add in minutes. "                           "Name of time zone."                       "Offset from UTC in hours."                       "Offset from UTC in minuts."                               ["An indication of whether the summer time feature
             is worked on this device. "                       "Summer time table."                       "Summer time entry."                       5"The ID of the summer time. It can only be set to 0."                       "The name of the summer time."                      x"The type of the summer time.
             If type is recurring, the summer time feature will work 
             every year on this device. 
             If the type is once,the summer time feature will work only
             once on this device. 
             When the type is recurring, the zxr10SummerTimeStartYear and 
             zxr10SummerTimeEndYear are valid."                       <"The starting year of the summer time. 65535 means invalid."                       ("The starting month of the summer time."                      ]"The day mode of the summer time.
             If the day mode is date, the zxr10SummerTimeStartDate and  
             zxr10SummerTimeEndDate are valid. 
             If the day mode is weekDay, the zxr10SummerTimeStartWeek, 
             zxr10SummerTimeStartWeekDay, zxr10SummerTimeEndWeek, 
             zxr10SummerTimeEndWeekDay are valid."                       :"The starting date of the summer time. 255 means invalid."                       '"The starting week of the summer time."                       "The starting day in week."                       �"The starting time of the summer time. 
             To convert a time HH:MM into a value in units of
             minutes, the following algorithm should be used:
             value = HH * 60 + MM "                       :"The ending year of the summer time. 65535 means invalid."                       &"The ending month of the summer time."                       8"The ending date of the summer time. 255 means invalid."                       %"The ending week of the summer time."                       "The ending day in week."                       �"The ending time of the summer time.
             To convert a time HH:MM into a value in units of
             minutes, the following algorithm should be used:
             value = HH * 60 + MM "                       A"The number of minutes to add or to subtract during summer time."                       $"The sign of zxr10SummerTimeOffset."                      �"The status of this conceptual row.
            
             The supported actions of this conceptual row only include:
             'createAndGo' and 'destroy'.

             To create a row in this table, a manager must set this object to 
             createAndGo(4).
    
             To delete a row in this table, a manager must set this object to 
             destroy(6). 
             
             To get this object, the agent always returns active(1)."                           "The system UTC time."                       "The system local time."                           &"The threshold switch of sync offset."                       2"The max threshold of sync offset,0 means invalid"                           '"The priority of NTP,10 means invalid."                       '"The priority of PTP,10 means invalid."                          