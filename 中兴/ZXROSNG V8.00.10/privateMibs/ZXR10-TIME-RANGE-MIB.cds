�--  ******************************************************
--  $Id: zxr10TimeRange.mib 12 2009-02-18 10:38:49Z  $
--
--  zxr10TimeRange.mib: ZXR10 time range MIB file
--  
--  Jan. 2009, Meng Jian
--   
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--  UR-ZXROS-090116-01/UR-ZXROS-090213-03
--
--  modified list:
--  V1.6  zxr10TimeRangeIsActive is added by mengj 2009.03.02
--  ******************************************************
   ""               �"For periodic time range, 
             weekdays: form monday to friday,
             weekend: saturday and sunday, 
             daily: everyday"               ""               "The type of timerange rule."                                                                 "" "ZTE" "201503200000Z" "200405140000Z" �"Delete the Chinese char and TAB char,
             modify invalid TC definition: WEEKDAY, TimeRangeStatus,
             EentryType and TrStatus,
             rename WEEKDAY for WeekDay." "TIMERANGE"               ""Time range is enable or disable."                       ."It displays the configuration of time range."                       ("It displays the content of time range."                       ""The name of the time range list."                       ("Whether the time range list is active."                       /"The sequence of the entry in time range list."                       U"The type of the entry in time range list,
             it is absolute or periodic."                       ,"The start time of the absolute time range."                       *"The end time of the absolute time range."                       +"The start day of the periodic time range."                       3"The time of the day at start periodic time range."                       )"The end day of the periodic time range."                       1"The time of the day at end periodic time range."                          