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

PROD_IOC = brocade6910
# brocade6910.dbd will be created and installed
DBD += brocade6910.dbd

# brocade6910.dbd will be made up from these files:
brocade6910_DBD += base.dbd
brocade6910_DBD += snmpRecord.dbd
brocade6910_DBD += timestampRecord.dbd
brocade6910_DBD += snmpDevSoft.dbd
brocade6910_DBD += timestampDevSoft.dbd

# Include dbd files from all support applications:
#brocade6910_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#brocade6910_LIBS += xxx
brocade6910_LIBS += snmpMon timeStamp

# brocade6910_registerRecordDeviceDriver.cpp derives from brocade6910.dbd
brocade6910_SRCS += brocade6910_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
brocade6910_SRCS_DEFAULT += brocade6910Main.cpp
brocade6910_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#brocade6910_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
brocade6910_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

