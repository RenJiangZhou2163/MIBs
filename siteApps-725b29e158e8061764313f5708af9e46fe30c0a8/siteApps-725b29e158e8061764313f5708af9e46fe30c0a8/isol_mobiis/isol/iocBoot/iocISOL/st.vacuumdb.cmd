var s7plcDebug 1
s7plcConfigure(FEPLC:0, 192.168.1.202, 2000, 128, 12, 1, 2000, 100)
dbLoadRecords("$(TOP)/db/PLC_Vacuum.db", "SYS=$(SYS)")
