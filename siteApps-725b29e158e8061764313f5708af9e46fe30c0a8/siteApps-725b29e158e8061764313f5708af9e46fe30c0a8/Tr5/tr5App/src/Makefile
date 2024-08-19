TOP=../..

include $(TOP)/configure/CONFIG


USR_INCLUDES += -I$(EPICS_PATH)/siteLibs/include
USR_INCLUDES += -I$(EPICS_PATH)/extensions/include
USR_DBDFLAGS += -I$(EPICS_PATH)/siteLibs/dbd

ifStatMon_DIR   += $(EPICS_PATH)/siteLibs/lib/$(T_A)


#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = tr5
# tr5.dbd will be created and installed
DBD += tr5.dbd

# tr5.dbd will be made up from these files:
tr5_DBD += base.dbd
tr5_DBD += ifstatRecord.dbd

# Include dbd files from all support applications:
#tr5_DBD += xxx.dbd
tr5_DBD += ifstatDevSoft.dbd

# Add all the support libraries needed by this IOC
#tr5_LIBS += xxx
tr5_LIBS += ifStatMon

# tr5_registerRecordDeviceDriver.cpp derives from tr5.dbd
tr5_SRCS += tr5_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
tr5_SRCS_DEFAULT += tr5Main.cpp
tr5_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#tr5_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
tr5_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

