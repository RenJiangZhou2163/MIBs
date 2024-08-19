#!../../bin/linux-x86_64/streamsim

## You may have to change streamsim to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH", ".:../../protocols")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/streamsim.dbd"
streamsim_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=ctrluserHost")
dbLoadRecords("db/streamsim.db","PREFIX=STREAMSIM")

drvAsynIPPortConfigure("Sim1","10.1.4.64:9004",0,0,1)
asynOctetSetInputEos("Sim1",0,"\r\n")
asynOctetSetOutputEos("Sim1",0,"\r\n")

cd "${TOP}/iocBoot/${IOC}"
iocInit


## Start any sequence programs
#seq sncxxx,"user=ctrluserHost"
