#!../../bin/linux-x86_64/exAsyn

## You may have to change exAsyn to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/exAsyn.dbd"
exAsyn_registerRecordDeviceDriver pdbbase

## Configure direct devices
#vxi11Configure("L0","164.54.8.129",0,0.0,"gpib0",0,0)


## Load record instances
dbLoadRecords("db/asynRecord_ex.db","P=TEST:,R=ASYN,PORT=L0,ADDR=0,IMAX=100,OMAX=100")

cd ${TOP}/iocBoot/${IOC}
iocInit

#If you are using a LAN/Serial adapter or network attached device which uses a raw TCP ('telnet' style) connection you would replace the vxi11Configure command with a line like:
#drvAsynIPPortConfigure("L0","10.1.4.173:4001",0,0,0)

#If you are using a local serial port or USB/Serial adapter replace the vxi11Configure command with something like:
drvAsynSerialPortConfigure("L0","/dev/tty.PL2303-000013FA",0,0,0)
#asynSetOption("L0", -1, "baud", "9600")
#asynSetOption("L0", -1, "bits", "8")
#asynSetOption("L0", -1, "parity", "none")
#asynSetOption("L0", -1, "stop", "1")
#asynSetOption("L0", -1, "clocal", "Y")
#asynSetOption("L0", -1, "crtscts", "Y")

#OPI-medm
#medm -x -macro "P=TEST:,R=ASYN" /home/silee/epics/R3.14.12.4/modules/synApps_5_7/support/asyn-4-21/opi/medm

## Start any sequence programs
#seq sncxxx,"user=sileeHost"
