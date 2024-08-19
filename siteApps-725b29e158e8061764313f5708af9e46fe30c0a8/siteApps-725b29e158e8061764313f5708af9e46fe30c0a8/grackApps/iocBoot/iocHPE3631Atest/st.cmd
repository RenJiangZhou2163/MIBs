#!../../bin/linux-x86/HPE3631Atest

## You may have to change HPE3631Atest to something else
## everywhere it appears in this file

< envPaths
epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/db" 

############################################################################### 
# Allow PV name prefixes and serial port name to be set from the environment 
epicsEnvSet "P" "$(P=hpE3631A)"
epicsEnvSet "R" "$(R=Test)"
epicsEnvSet "TTY" "$(TTY=/dev/ttyUSB0)"


## Register all support components
cd ${TOP}
dbLoadDatabase "dbd/HPE3631Atest.dbd"
HPE3631Atest_registerRecordDeviceDriver pdbbase

 
############################################################################### 
# Set up ASYN ports 
# drvAsynSerialPortConfigure port ipInfo priority noAutoconnect noProcessEos 
drvAsynSerialPortConfigure("L0","$(TTY)",0,0,0)
asynSetOption("L0", -1, "baud", "9600")
asynSetOption("L0", -1, "bits", "8")
asynSetOption("L0", -1, "parity", "none")
asynSetOption("L0", -1, "stop", "1")
asynSetOption("L0", -1, "clocal", "Y")
asynSetOption("L0", -1, "crtscts", "N")
asynOctetSetInputEos("L0", -1, "\n")
asynOctetSetOutputEos("L0", -1, "\n")
asynSetTraceIOMask("L0",-1,0x2)
asynSetTraceMask("L0",-1,0x9)


## Load record instances
#dbLoadRecords("db/xxx.db","user=rootHost")
dbLoadRecords("db/devHPE3631A.db","P=$(P),R=$(R),PORT=L0,A=0")
#dbLoadRecords("db/asynRecord.db","P=$(P)$(R),R=asyn,PORT=L0,ADDR=-1,OMAX=0,IMAX=0") 

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=rootHost"
