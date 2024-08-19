#!../../bin/linux-x86_64/lsplc

## You may have to change lsplc to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/lsplc.dbd"
lsplc_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("StepMTst","10.4.1.206:502",0,0,1)
modbusInterposeConfig("StepMTst",0,5000,0)

# The LSPLC - XGT - modbusTCP, Function code
# Read 32 bits, Coil Status.    Function code=1.   
# Address = 0XXXX, Response Length = 2000 Coils(2000bits)
drvModbusAsynConfigure("Step_Motor_CIn_Bit",   "StepMTst", 0, 1,  04000, 040,    0,  100, "Modicon")

# Read 32 bits, Discret Input.  Function code=2.   
# Address = 1XXXX, Response Length = 2000 Coils(2000bits)
drvModbusAsynConfigure("Step_Motor_DIn_Bit",   "StepMTst", 0, 2,  04000, 040,    0,  100, "Modicon")

# Read 8 words (128 bits). Read Holding Registers.  Function code=3.   
# Address = 4XXXX, Response Length = 125 Registers(1600bits)
drvModbusAsynConfigure("Step_Motor_WHR,",     "StepMTst", 0, 3, 040400, 010,    0,  100, "Modicon")

# Read 8 words (128 bits). Read Input Registers.  Function code=4.   
# Address = 3XXXX, Response Length = 125 Registers(1600bits)
drvModbusAsynConfigure("Step_Motor_WIn",  "StepMTst", 0, 4, 040500, 010,    0,  100, "Modicon")

# Write 1 bit.  Function code=5.
# Address = 0XXXX, Response Length = 1 Coil(1bits)
drvModbusAsynConfigure("Step_Motor_BOut",  "StepMTst", 0, 5,  04000, 040,    0,  1, "Modicon")

# Write 8 words (128 bits).  Function code=6.
# Address = 4XXXX, Response Length = 1 Register (1Register, 8bits)
drvModbusAsynConfigure("Step_Motor_WOut", "StepMTst", 0, 6, 040500, 010,    0,  100, "Modicon")

# Access the same 256 bits as array outputs.  Function code=15.
# Address = 0XXXX, ...
drvModbusAsynConfigure("Step_Motor_BAOut",  "StepMTst", 0, 15,  06000, 0400,   0,   1, "Modicon")

# We access the same 16 words as array outputs (256 bits). Function code=16.
# Address = 4XXXX, ...
drvModbusAsynConfigure("Step_Motor_WAOut", "StepMTst", 0, 16, 040600, 020,    0,   1, "Modicon")

# Enable ASYN_TRACEIO_HEX on modbus server
asynSetTraceIOMask("Step_Motor_CIn_Bit",0,4)

# Dump up to 512 bytes in asynTrace
asynSetTraceIOTruncateSize("Step_Motor_CIn_Bit",0,512)

dbLoadTemplate("StepMTst.substitutions")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=ctrluserHost"
