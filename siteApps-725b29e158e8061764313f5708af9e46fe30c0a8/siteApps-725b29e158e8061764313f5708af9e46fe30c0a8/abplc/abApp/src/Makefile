TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ab
# ab.dbd will be created and installed
DBD += ab.dbd

# ab.dbd will be made up from these files:
ab_DBD += base.dbd

# Include dbd files from all support applications:
#ab_DBD += xxx.dbd
ab_DBD += ether_ip.dbd

# Add all the support libraries needed by this IOC
#ab_LIBS += xxx
ab_LIBS += ether_ip

# ab_registerRecordDeviceDriver.cpp derives from ab.dbd
ab_SRCS += ab_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ab_SRCS_DEFAULT += abMain.cpp
ab_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ab_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ab_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

