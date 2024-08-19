#!../../bin/linux-x86_64/xgs600

## You may have to change xgs600 to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH", ".:${TOP}/db")
epicsEnvSet("TTY","$(TTY=/dev/ttyS0)")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/xgs600.dbd"
xgs600_registerRecordDeviceDriver pdbbase

drvAsynSerialPortConfigure("XGS600", "$(TTY)", 0,0,0)

asynSetOption("XGS600", -1, "baud", "9600")
asynSetOption("XGS600", -1, "bits", "8")
asynSetOption("XGS600", -1, "parity", "none")
asynSetOption("XGS600", -1, "stop", "1")
asynSetOption("XGS600", -1, "clocal", "Y")
asynSetOption("XGS600", -1, "crtscts", "N")

#dbLoadRecords("db/xgs600-stream.db", "SYSDEV=RFQ:VAC, PORT=XGS600,ID=00")
dbLoadRecords("db/xgs600-stream.db", "SYSDEV=RFQ:VAC:,PORT=XGS600,ID=00")

cd "${TOP}/iocBoot/${IOC}"
iocInit
