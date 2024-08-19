#!../../bin/linux-x86_64/sgi

## You may have to change sgi to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

epicsEnvSet "STREAM_PROTOCOL_PATH" "../../proto"

## Register all support components
dbLoadDatabase "dbd/sgi.dbd"
sgi_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("port16", "192.168.1.140:4016", 0, 0, 0)

## Load record instances
#dbLoadRecords("db/xxx.db","user=scwookHost")
dbLoadRecords("db/sgi.db", "SYS=ECRIS,SUBSYS=Mag,DEV=PS001,P=port16")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq seqRamp,"SYS=ECRIS,SUBSYS=Mag,DEV=PS001"
