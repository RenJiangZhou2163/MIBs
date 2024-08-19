TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

USR_INCLUDES += -I${RAON_SITELIBS}/include/
USR_DBDFLAGS += -I${RAON_SITELIBS}/dbd/
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

snmpMon_DIR += ${RAON_SITELIBS}/lib/$(T_A)
timeStamp_DIR += $(RAON_SITELIBS)/lib/$(T_A)

#=============================
# Build the IOC application

PROD_IOC = moxa6650
# moxa6650.dbd will be created and installed
DBD += moxa6650.dbd

# moxa6650.dbd will be made up from these files:
moxa6650_DBD += base.dbd

# Include dbd files from all support applications:
#moxa6650_DBD += xxx.dbd
moxa6650_DBD += snmpRecord.dbd
moxa6650_DBD += timestampRecord.dbd
moxa6650_DBD += snmpDevSoft.dbd
moxa6650_DBD += timestampDevSoft.dbd

# Add all the support libraries needed by this IOC
#moxa6650_LIBS += xxx
moxa6650_LIBS += snmpMon timeStamp

# moxa6650_registerRecordDeviceDriver.cpp derives from moxa6650.dbd
moxa6650_SRCS += moxa6650_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
moxa6650_SRCS_DEFAULT += moxa6650Main.cpp
moxa6650_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#moxa6650_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
moxa6650_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
