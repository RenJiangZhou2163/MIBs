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

PROD_IOC = wiener6023
# wiener6023.dbd will be created and installed
DBD += wiener6023.dbd

# wiener6023.dbd will be made up from these files:
wiener6023_DBD += base.dbd
wiener6023_DBD += snmpRecord.dbd
wiener6023_DBD += timestampRecord.dbd
wiener6023_DBD += snmpDevSoft.dbd
wiener6023_DBD += timestampDevSoft.dbd

# Include dbd files from all support applications:
#wiener6023_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#wiener6023_LIBS += xxx
wiener6023_LIBS += snmpMon timeStamp


# wiener6023_registerRecordDeviceDriver.cpp derives from wiener6023.dbd
wiener6023_SRCS += wiener6023_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
wiener6023_SRCS_DEFAULT += wiener6023Main.cpp
wiener6023_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#wiener6023_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
wiener6023_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

