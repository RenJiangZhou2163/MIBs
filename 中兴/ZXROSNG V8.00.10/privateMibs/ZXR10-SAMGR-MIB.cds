%--  ************************************************
--  $Id: samgr.mib 8 2010-05-17 guojun $
--
--  samgr.mib: samgr MIB file
--  
--  MAR. 2010, GuoJun
--   
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                     "ZXROS SMI MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201507210900Z" "201403110900Z" "201307031100Z" "201303180900Z" "201003220000Z" )"add:   zxr10samgrTrackObjectIfStateType" ("add:   zxr10samgrTrackGroupUpDelayTime"@"modify: in the IMPORTS section, RFC1155-SMI was 
             replaced by SNMPv2-SMI;
     modify: delete hyphen in the labels;
     modify: DisplayString definition was replace by
             the IMPORTS section.
     modify: delete the IMPORTS of TruthValue
     modify: zxr10samgrTrackObjectPingDetectGroupNO" )"add:   zxr10samgrTrackObjectTransStatus" ;"This mib defines management information objects for SAMGR"               -"Samgr track group config information table."                       -"Samgr track group config information entry."                       "Samgr track-group name."                       "Track group policy."                       /"The total track object number in track-group."                       6"When this value is 1,this track-group has been used."                       " Track-group state."                       +" The flag that show group policy default."                       " Track-group delay up time."                       ("Track object config information table."                       ("Track object config information entry."                       "Track name."                       "Detect type."                       "MD of CFM."                       "MA of CFM."                       "Local MEP ID of CFM."                       "Remote MEP ID of CFM."                       "Interface name of EFM."                       V"Ping-detect group ID.
            The range of this parameter depend on the device."                       T"Mpls-oam tunnel ID.
            The range of this parameter depend on the device."                       "Mpls-oam ingress ID."                       "Mpls-oam egress ID."                       "Link BFD local IPv4 address."                       "Link BFD remote IPv4 address."                       "Link BFD out-interface name."                       "Peer BFD local IPv4 address."                       "Peer BFD remote IPv4 address."                       "vrf name."                       "Ldp BFD FEC IPv4 address."                       "Ldp BFD prefix length."                       "RSVP BFD tunnel ID."                       "PW BFD vc ID."                       "PW BFD peer ID."                       
"PW type."                       *"BFD packets tx interval in milliseconds."                       %"BFD packets min rx in milliseconds."                       "BFD detect multiplier."                       "PW vc ID."                       "PW peer ID."                       
"PW type."                       "VRRP interface name."                       "VRRP group ID."                       1"When this value is 1, this track has been used."                       "Track state."                       "SQA instance ID."                       #"Track object state change number."                       &"Track object state last change time."                       "L2 BFD session name."                       "BFD session name."                       
"PW name."                       "TP-oam meg."                       "Interface name."                       "Track trans state."                       !"Interface protocol status type."                       "Samgr bind information table."                       "Samgr bind information entry."                       )"Track object which accept state change."                       :"Track object or track-group which transfer state change."                       "Track type."                       -"Samgr track-group member information table."                       -"Samgr track-group member information entry."                       "The track group name."                       &"The track name attach to this group."                       "Track state."                          