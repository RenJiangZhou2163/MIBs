TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = integrateTest
# integrateTest.dbd will be created and installed
DBD += integrateTest.dbd

# integrateTest.dbd will be made up from these files:
integrateTest_DBD += base.dbd

# Include dbd files from all support applications:
integrateTest_DBD += aliveRecord.dbd
integrateTest_DBD += aliveSupport.dbd
integrateTest_DBD += devIocStats.dbd
#integrateTest_DBD += devVxStats.dbd
#integrateTest_DBD += iocAdmin.dbd

# Add all the support libraries needed by this IOC
integrateTest_LIBS += alive
integrateTest_LIBS += devIocStats

# integrateTest_registerRecordDeviceDriver.cpp derives from integrateTest.dbd
integrateTest_SRCS += integrateTest_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
integrateTest_SRCS_DEFAULT += integrateTestMain.cpp
integrateTest_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#integrateTest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
integrateTest_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

