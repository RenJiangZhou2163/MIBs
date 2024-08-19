TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ecris
# ecris.dbd will be created and installed
DBD += ecris.dbd

# ecris.dbd will be made up from these files:
ecris_DBD += base.dbd

# Include dbd files from all support applications:
#ecris_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#ecris_LIBS += xxx

# ecris_registerRecordDeviceDriver.cpp derives from ecris.dbd
ecris_SRCS += ecris_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ecris_SRCS_DEFAULT += ecrisMain.cpp
ecris_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ecris_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ecris_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

