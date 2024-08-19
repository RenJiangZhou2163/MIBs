#!/usr/local/risp/epics/iocTop/isol/bin/linux-x86/ISOL

## You may have to change MOBIIXA to something else
## everywhere it appears in this file

#cd /home/epics/iocBoot/iocMOBIIXA

#TOP = "/usr/local/risp/epics/iocTop/isol"
epicsEnvSet("SYS", "FE-TFC")

cd /usr/local/risp/epics/iocTop/isol/iocBoot/iocISOL
< envPaths

## Register all support components
dbLoadDatabase("$(TOP)/dbd/ISOL.dbd",0,0)
ISOL_registerRecordDeviceDriver(pdbbase) 

#
### save_restore setup
# We presume a suitable initHook routine was compiled into....
# See also create_monitor_set(), after iocInit() .
cd "$(TOP)/iocBoot/$(IOC)"
###< save_restore.cmd
#cd "$(TOP)"
#

## Load record instances
< st.hvdb.cmd

< st.targetdb.cmd

< st.steerersdb.cmd
< st.eqtdb.cmd

< st.vacuumdb.cmd

dbLoadTemplate("pid_slow.template")

iocInit()


## Start any sequence programs
#seq sncMOBIIXA,"user=ywkim"
#

cd "$(TOP)/iocBoot/$(IOC)"
#===== Start up the autosave task and tell it what to do. =====================================
#save_restoreDebug=20
### Start up the save_restore task and tell it what to do.
# The task is actually named "save_restore".
#
# save positions every five seconds
###create_monitor_set("auto_positions.req",5,"SYS=FE-TFC")
# save other things every thirty seconds
#create_monitor_set("auto_settings.req",60,"P=$(P),M=P_SR")
#
# Handle autosave 'commands' contained in loaded databases.
## makeAutosaveFiles()
## create_monitor_set("info_positions.req",5,"P=$(P)")
## create_monitor_set("info_settings.req",30,"P=$(P)")
#
# =============================================================================================
### Start the saveData task. This fuction need from sscan record.
## saveData_Init("saveData.req","P=$(P)")
# =============================================================================================

