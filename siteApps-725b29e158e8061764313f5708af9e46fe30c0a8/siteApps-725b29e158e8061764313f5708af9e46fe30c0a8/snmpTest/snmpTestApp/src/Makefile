TOP=../..

include $(TOP)/configure/CONFIG


USR_INCLUDES += -I${RAON_SITELIBS}/include/
USR_DBDFLAGS += -I${RAON_SITELIBS}/dbd/
USR_INCLUDES += -I$(EPICS_EXTENSIONS)/include
USR_DBDFLAGS += -I${EPICS_SYNAPPS}/alive-1-0/aliveApp/src
USR_INCLUDES += -I${EPICS_SYNAPPS}/alive-1-0/include


USR_INCLUDES += -I${EPICS_SYNAPPS}/devIocStats-3-1-13/include/os/Linux
USR_INCLUDES += -I${EPICS_SYNAPPS}/devIocStats-3-1-13/devIocStats
USR_DBDFLAGS += -I${EPICS_SYNAPPS}/devIocStats-3-1-13/dbd


snmpMon_DIR += ${RAON_SITELIBS}/lib/$(T_A)
timeStamp_DIR += $(RAON_SITELIBS)/lib/$(T_A)
alive_DIR += ${EPICS_SYNAPPS}/alive-1-0/lib/$(T_A)


devIocStats_DIR += ${EPICS_SYNAPPS}/devIocStats-3-1-13/lib/$(T_A)



#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = snmpTest
# snmpTest.dbd will be created and installed
DBD += snmpTest.dbd

# snmpTest.dbd will be made up from these files:
snmpTest_DBD += base.dbd
snmpTest_DBD += snmpRecord.dbd
snmpTest_DBD += timestampRecord.dbd
snmpTest_DBD += aliveRecord.dbd
snmpTest_DBD += aliveSupport.dbd

snmpTest_DBD += devIocStats.dbd
snmpTest_DBD += devVxStats.dbd
snmpTest_DBD += iocAdmin.dbd

# Include dbd files from all support applications:
#snmpTest_DBD += xxx.dbd
snmpTest_DBD += snmpDevSoft.dbd
snmpTest_DBD += timestampDevSoft.dbd

# Add all the support libraries needed by this IOC
#snmpTest_LIBS += xxx
snmpTest_LIBS += snmpMon timeStamp
snmpTest_LIBS += alive

snmpTest_LIBS += devIocStats


# snmpTest_registerRecordDeviceDriver.cpp derives from snmpTest.dbd
snmpTest_SRCS += snmpTest_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
snmpTest_SRCS_DEFAULT += snmpTestMain.cpp
snmpTest_SRCS_vxWorks += -nil-


# Add support from base/src/vxWorks if needed
#snmpTest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
snmpTest_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

