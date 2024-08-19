TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = bitwave
# bitwave.dbd will be created and installed
DBD += bitwave.dbd

# bitwave.dbd will be made up from these files:
bitwave_DBD += base.dbd

# Include dbd files from all support applications:
#bitwave_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#bitwave_LIBS += xxx

# bitwave_registerRecordDeviceDriver.cpp derives from bitwave.dbd
bitwave_SRCS += bitwave_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
bitwave_SRCS_DEFAULT += bitwaveMain.cpp
bitwave_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#bitwave_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
bitwave_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

