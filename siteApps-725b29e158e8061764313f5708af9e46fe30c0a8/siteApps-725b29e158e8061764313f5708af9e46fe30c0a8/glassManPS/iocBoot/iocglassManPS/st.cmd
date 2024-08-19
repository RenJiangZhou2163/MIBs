#!../../bin/linux-x86_64/glassManPS

## You may have to change glassManPS to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

epicsEnvSet "STREAM_PROTOCOL_PATH" "../../proto"

epicsEnvSet "ET50P40_VOLTAGE", "48.875855327468230"
epicsEnvSet "ET50P40_CURRENT", "0.0391006842619745"
epicsEnvSet "FJ01N120_VOLTAGE", "0.977517106549364"
epicsEnvSet "FJ01N120_CURRENT", "0.117302527859237"
epicsEnvSet "FJ10N12_VOLTAGE", "9.775171065493646"
epicsEnvSet "FJ10N12_CURRENT", "0.011730205278592"
epicsEnvSet "FJ50N024_VOLTAGE", "48.875855327468230"
epicsEnvSet "FJ50N024_CURRENT", "0.002346041055718"
epicsEnvSet "FJ50P024_VOLTAGE", "48.875855327468230"
epicsEnvSet "FJ50P024_CURRENT", "0.002346041055718"

## Register all support components
dbLoadDatabase "dbd/glassManPS.dbd"
glassManPS_registerRecordDeviceDriver pdbbase
drvAsynIPPortConfigure("port1", "10.1.5.80:4001", 0, 0, 0)

## Load record instances
#dbLoadRecords("db/xxx.db","user=scwookHost")

#Currently supported PS are et50p40, fj01n120, fj10n12, fj50n024, fj50p024
dbLoadRecords("db/glassManPS.db", "SYS=ECR11,SUBSYS=PCU,DEV=PS001,PS=fj01n120,P=port1,VCOF=$(FJ01N120_VOLTAGE),CCOF=$(FJ01N120_CURRENT)")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=scwookHost"
