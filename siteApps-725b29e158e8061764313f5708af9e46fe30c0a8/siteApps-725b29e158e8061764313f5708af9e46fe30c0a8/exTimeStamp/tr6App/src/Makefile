TOP=../..

include $(TOP)/configure/CONFIG


USR_INCLUDES  += -I$(RAON_SITELIBS)/include
USR_DBDFLAGS  += -I$(RAON_SITELIBS)/dbd
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

ifStatMon_DIR += $(RAON_SITELIBS)/lib/$(T_A)
timeStamp_DIR += $(RAON_SITELIBS)/lib/$(T_A)


#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = tr6
# tr6.dbd will be created and installed
DBD += tr6.dbd

# tr6.dbd will be made up from these files:
tr6_DBD += base.dbd
tr6_DBD += menuInOut.dbd
tr6_DBD += ifstatRecord.dbd
tr6_DBD += timestampRecord.dbd

# Include dbd files from all support applications:
#tr6_DBD += xxx.dbd
tr6_DBD += ifstatDevSoft.dbd
tr6_DBD += timestampDevSoft.dbd

# Add all the support libraries needed by this IOC
#tr6_LIBS += xxx
tr6_LIBS += ifStatMon timeStamp

# tr6_registerRecordDeviceDriver.cpp derives from tr6.dbd
tr6_SRCS += tr6_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
tr6_SRCS_DEFAULT += tr6Main.cpp
tr6_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#tr6_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
tr6_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

