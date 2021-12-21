R--  ********************************************************
--  $Id: ZXR10-mc-elam.mib 2010-05-21 13:40:21Z zhujie $
--
--  ZXR10-mc-elam.mib: ZXR10 mc-elam MIB file
--
--  May. 2010, Zhu Jie
--  Copyright(c) 2010 by ZTE Corporation
--  All rights reserved
--
--  ********************************************************      
                                                                         E"This MIB contains managed object definitions for the ZXROSng MCELAM" y"  Yang Zengfang
               Tel : +86-25-15051656440
               E-mail: yang.zengfang@zte.com.cn
            " "201303180000Z" #"Update version of this MIB module"       -- 2013-3-18 00:00
           +"mc-elam instance information query table."                       "mc-elam instance"                       !"The mcelam instance Identifier."                       +"The source ip address of mcelam instance."                       0"The destination ip address of mcelam instance."                       )"The system priority of mcelam instance."                       $"The system mac of mcelam instance."                       )"The timer-advertise of mcelam instance."                       ,"SThe detect-multiplier of mcelam instance."                       &"The restore mode of mcelam instance."                       &"The restore time of mcelam instance."                       7"The smartgroup id which be binded by mcelam instance."                       ("The mode that mcelam bind smartgroup. "                       "The actor mcelam role."                       "The actor lacp role."                       $"Is  actor mcelam instance pwfault?"                       I"The actor smartgroup protocol state which be binded by mcelam instance."                       "The partner mcelam role."                       "The partner lacp role."                       &"Is  partner mcelam instance pwfault?"                       K"The partner smartgroup protocol state which be binded by mcelam instance."                       1"The timer-advertise of partner mcelam instance."                       3"The detect-multiplier of partner mcelam instance."                       ("mc-elam track information query table."                       "mc-elam track"                       "The track name."                       !"The mcelam instance Identifier."                       "The track type."                       "Is group type?"                          