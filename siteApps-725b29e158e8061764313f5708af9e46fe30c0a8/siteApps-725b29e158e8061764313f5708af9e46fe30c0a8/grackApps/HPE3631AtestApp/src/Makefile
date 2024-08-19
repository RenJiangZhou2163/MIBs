TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = HPE3631Atest
# HPE3631Atest.dbd will be created and installed
DBD += HPE3631Atest.dbd

# HPE3631Atest.dbd will be made up from these files:
HPE3631Atest_DBD += base.dbd

# Include dbd files from all support applications:
#HPE3631Atest_DBD += xxx.dbd

HPE3631Atest_DBD += stream.dbd
HPE3631Atest_DBD += drvAsynSerialPort.dbd
HPE3631Atest_LIBS += stream asyn

# Add all the support libraries needed by this IOC
#HPE3631Atest_LIBS += xxx

# HPE3631Atest_registerRecordDeviceDriver.cpp derives from HPE3631Atest.dbd
HPE3631Atest_SRCS += HPE3631Atest_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
HPE3631Atest_SRCS_DEFAULT += HPE3631AtestMain.cpp
HPE3631Atest_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#HPE3631Atest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
HPE3631Atest_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

