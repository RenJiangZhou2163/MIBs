G--  ************************************************
--  ZXR10-ETH-MGT.mib: MIB for query status and configuration of the linear APS instance
--  
--  2012-07-18, lvzhi, ZTE Corp.
--   
--  Copyright(c) 2012 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************          
   "APS switch command"               "APS bridge type"               "APS state"               "APS active state"               "APS packet sending mode"               "APS revertive mode"                                     C"MIB for query status and configuration of the linear APS instance" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201705161600Z" "201611071600Z" "201607251600Z" "201601211600Z" "201503121600Z" "201409011600Z" "201408271600Z" "201207180000Z" 6"Modify DESCRIPTION of zxAPSLineProtectPGStatusState."S"Modify INTEGER of ApsStatusState.
        Add TEXTUAL-CONVENTION of ApsBridgeType.
        Add zxAPSLineProtectTGBridgeType in ZxAPSLineProtectTGConfigEntry.
        Add zxAPSLineProtectPWBridgeType in ZxAPSLineProtectPWConfigEntry.
        Modify DESCRIPTION of zxAPSLineProtectPWStatusState.
        Modify DESCRIPTION of zxAPSLineProtectTGStatusState.
        Expand the maxmum value of zxAPSLineProtectTGSwitchFlag from 5 to 7.
        Expand the maxmum value of zxAPSLineProtectPWSwitchFlag from 5 to 7.
        Expand the maxmum value of zxAPSLineProtectPGSwitchFlag from 5 to 7." S"Expand the maxmum value of zxAPSLineProtectTGStatusTGID from 32768 to 4294967295." �"Modify DESCRIPTION of zxAPSLineProtectTGStatusState.

        Modify DESCRIPTION of zxAPSLineProtectPWStatusState.

        Modify DESCRIPTION of zxAPSLineProtectPGSwitchFlag.

        Modify DESCRIPTION of zxAPSLineProtectPGStatusState." �"Add description for zxAPSLineProtectTGConfigEntry,zxAPSLineProtectPWConfigEntry,zxAPSLineProtectTGStatusEntry
       zxAPSLineProtectPWStatusEntry,zxAPSLineProtectPGConfigEntry,zxAPSLineProtectPGStatusEntry."�"Modify DESCRIPTION of zxAPSLineProtectTGConfigTable:
       from 'Posnet configuration table' to 'Configuration table of tunnel protection group's APS'.
 
       Modify DESCRIPTION of ZxAPSLineProtectPWConfigEntry:
       from 'Posnet configuration table' to 'Configuration table of pw group's APS'.

       Modify DESCRIPTION of ZxAPSLineProtectTGStatusEntry:
       from 'Posnet configuration table' to 'Status table of tunnel protection group's APS'.

       Modify DESCRIPTION of zxAPSLineProtectPWStatusTable:
       from 'Posnet configuration table' to 'Status table of pw group's APS'.

       Modify DESCRIPTION of zxAPSLineProtectPGConfigTable:
       from 'Posnet configuration table' to 'Configuration table of port protection group's APS'.

       Modify DESCRIPTION of zxAPSLineProtectPGStatusTable:
       from 'Posnet configuration table' to 'Status table of port group's APS'.

       Modify syntax errors of description, such as: make to makes, noraml to normal.""Modify syntax of zxAPSLineProtectPGStatusPGID:
       from DisplayString (SIZE(1..256)) to DisplayString (SIZE(1..65536)). 
       
       Modify syntax of zxAPSLineProtectPGPGID:
       from DisplayString (SIZE(1..256)) to DisplayString (SIZE(1..65536))." "Initial created"               6"Configuration table of tunnel protection group's APS"                       6"Configuration entry of tunnel protection group's APS"                       '"The group id of this protection group"                       {"The active state of this protection group
            restoreRun(0): Restore to run APS
            pause(1): Pause APS"                       �"The protection mode of this protection group
            send(0): To send APS packets
            nosend(1): Not to send APS packets"                       ,"The hold-off time of this protection group"                      �"The revertive mode of this protection group
            revertive(0): APS is in revertive operation, which normal traffic 
            signal is restored to the working transport entity after the 
            condition(s) causing a switch has been cleared
            nonrevertive(1): APS is in non-revertive operation, which normal 
            traffic signal is allowed to remain on the protection transport 
            entity even after a switch reason has been cleared"                       3"The wait-to-restore time of this protection group"                      �"The switch command of this protection group
            none(0): The switch command hasn't been configured or has been cleared
            clear(1): Clear the externally initiated command and WTR
            lockout(2): Prevent a working signal from being selected from the 
            protection transport entity
            fsP(3): Force the normal traffic to the protection entity
            msP(4): In the absence of a failure of a working or protection 
            entity,Force the normal traffic to the protection entity
            exercise(5): Exercise of the APS protocol
            msW(7): Manual switch normal traffic to working"                       �"The bridge type of this protection group
            selector(2): Selector bridge
            broadcast(1): Broadcast bridge"                       '"Configuration table of pw group's APS"                       '"Configuration entry of pw group's APS"                       )"The group name of this protection group"                       {"The active state of this protection group
            restoreRun(0): Restore to run APS
            pause(1): Pause APS"                       �"The protection mode of this protection group
            send(0): To send APS packets
            nosend(1): Not to send APS packets"                       ,"The hold-off time of this protection group"                      �"The revertive mode of this protection group
            revertive(0): APS is in revertive operation, which normal traffic 
            signal is restored to the working transport entity after the 
            condition(s) causing a switch has been cleared
            nonrevertive(1): APS is in non-revertive operation, which normal 
            traffic signal is allowed to remain on the protection transport 
            entity even after a switch reason has been cleared"                       3"The wait-to-restore time of this protection group"                      �"The switch command of this protection group
            none(0): The switch command hasn't been configured or has been cleared
            clear(1): Clear the externally initiated command and WTR
            lockout(2): Prevent a working signal from being selected from the 
            protection transport entity
            fsP(3): Force the normal traffic to the protection entity
            msP(4): In the absence of a failure of a working or protection 
            entity,Force the normal traffic to the protection entity
            exercise(5): Exercise of the APS protocol
            msW(7): Manual switch normal traffic to working"                       �"The bridge type of this protection group
            selector(2): Selector bridge
            broadcast(1): Broadcast bridge"                       /"Status table of tunnel protection group's APS"                       /"Status entry of tunnel protection group's APS"                       '"The group id of this protection group"                      �"The current APS state of this protection group
            noRequestNull(0): There is no request or the far end has 
            configured lockout
            noRequestNormal(1): The far end has request which makes normal
            traffic signal be selected from the protection transport entity
            lockout(2): Lockout has been configured
            forcedSwitch(3): Force switch has been configured
            signalFailW(4): The working transport entity has SF
            signalFailP(5): The protection transport entity has SF
            manualSwitch(6): Manual switch has been configured
            waitToRestore(7): SF or SD in the working transport entity has 
            been cleared
            exerciseNull(8): Exercise of the APS protocol when normal traffic 
            signal is selected from the working transport entity
            exerciseNormal(9): Exercise of the APS protocol when normal traffic 
            signal is selected from the protection transport entity
            doNotRevert(10): There is no request after a switch reason has been 
            cleared in non-revertive operation
            signalDegrW(11): The working transport entity has SD
            signalDegrP(12): The protection transport entity has SD
            manualSwitchW(13): Manual switch to working has been configured
            reverseRequestNull(17): Exercise has been configured at the far end and
            normal traffic signal is selected from the working transport entity
            reverseRequestNormal(18): Exercise has been configured at the far end and
            normal traffic signal is selected from the protection transport entity
            "                        "Status table of pw group's APS"                        "Status entry of pw group's APS"                       )"The group name of this protection group"                      �"The current APS state of this protection group
            noRequestNull(0): There is no request or the far end has 
            configured lockout
            noRequestNormal(1): The far end has request which makes normal 
            traffic signal be selected from the protection transport entity
            lockout(2): Lockout has been configured
            forcedSwitch(3): Force switch has been configured
            signalFailW(4): The working transport entity has SF
            signalFailP(5): The protection transport entity has SF
            manualSwitch(6): Manual switch has been configured
            waitToRestore(7): SF or SD in the working transport entity has 
            been cleared
            exerciseNull(8): Exercise of the APS protocol when normal traffic 
            signal is selected from the working transport entity
            exerciseNormal(9): Exercise of the APS protocol when normal traffic 
            signal is selected from the protection transport entity
            doNotRevert(10): There is no request after a switch reason has been 
            cleared in non-revertive operation
            signalDegrW(11): The working transport entity has SD
            signalDegrP(12): The protection transport entity has SD
            manualSwitchW(13): Manual switch to working has been configured
            mappingSwitchW(15): The far end has request which makes normal traffic
            signal be selected from the working transport entity
            mappingSwitchP(16): The far end has request which makes normal traffic
            signal be selected from the protection transport entity
            reverseRequestNull(17): Exercise has been configured at the far end and
            normal traffic signal is selected from the working transport entity
            reverseRequestNormal(18): Exercise has been configured at the far end and
            normal traffic signal is selected from the protection transport entity
            "                       4"Configuration table of port protection group's APS"                       4"Configuration entry of port protection group's APS"                       '"The group id of this protection group"                       {"The active state of this protection group
            restoreRun(0): Restore to run APS
            pause(1): Pause APS"                       ,"The hold-off time of this protection group"                      �"The revertive mode of this protection group
            revertive(0): APS is in revertive operation, which normal traffic
            signal is restored to the working transport entity after the 
            condition(s) causing a switch has been cleared
            nonrevertive(1): APS is in non-revertive operation, which normal
            traffic signal is allowed to remain on the protection transport
            entity even after a switch reason has been cleared"                       3"The wait-to-restore time of this protection group"                      �"The switch command of this protection group
            none(0): The switch command hasn't been configured or has been cleared
            clear(1): Clear the externally initiated command and WTR
            lockout(2): Prevent a working signal from being selected from the 
            protection transport entity
            fsP(3): Force the normal traffic to the protection entity
            msP(4): In the absence of a failure of a working or protection 
            entity,Force the normal traffic to the protection entity
            exercise(5): Exercise of the APS protocol
            fsW(6): Forced switch normal traffic to working
            msW(7): Manual switch normal traffic to working"                       ""Status table of port group's APS"                       ""Status entry of port group's APS"                       '"The group id of this protection group"                      �"The current APS state of this protection group
            noRequestNull(0): There is no request or the far end has 
            configured lockout
            noRequestNormal(1): The far end has request which makes normal 
            traffic signal be selected from the protection transport entity
            lockout(2): Lockout has been configured
            forcedSwitch(3): Force switch has been configured
            signalFailW(4): The working transport entity has SF
            signalFailP(5): The protection transport entity has SF
            manualSwitch(6): Manual switch has been configured
            waitToRestore(7): SF or SD in the working transport entity has 
            been cleared
            exerciseNull(8): Exercise of the APS protocol when normal traffic 
            signal is selected from the working transport entity
            exerciseNormal(9): Exercise of the APS protocol when normal traffic 
            signal is selected from the protection transport entity
            doNotRevert(10): There is no request after a switch reason has been 
            cleared in non-revertive operation
            signalDegrW(11): The working transport entity has SD
            signalDegrP(12): The protection transport entity has SD
            manualSwitchW(13): Manual switch to working has been configured 
            forcedSwitchW(14): Force switch to working has been configured
            reverseRequestNull(17): Exercise has been configured at the far end and
            normal traffic signal is selected from the working transport entity
            reverseRequestNormal(18): Exercise has been configured at the far end and
            normal traffic signal is selected from the protection transport entity"                              