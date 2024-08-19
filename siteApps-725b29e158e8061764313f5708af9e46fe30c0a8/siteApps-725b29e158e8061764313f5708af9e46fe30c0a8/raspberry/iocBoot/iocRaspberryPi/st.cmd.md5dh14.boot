#!../../bin/linux-arm/md5dh14

## You may have to change RaspberryPi to something else
## everywhere it appears in this file

epicsEnvSet("ARCH","linux-arm")
epicsEnvSet("IOC","iocRaspberryPi")
epicsEnvSet("TOP","/home/pi/epics/R3.14.12.5/siteApps/raspberry")


cd ${TOP}

## Register all support components
dbLoadDatabase "${TOP}/dbd/md5dh14.dbd"
md5dh14_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("${TOP}/db/md5dh14.db", "SYS=ECR11,SUBSYS=PCU,DEV=SMO")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
seq seqStep "SYS=ECR11,SUBSYS=PCU,DEV=SMO"
