TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = lsplc
# lsplc.dbd will be created and installed
#DBD += $(MODBUS)/dbd/modbus.dbd
DBD += $(MODBUS)/dbd/modbusSupport.dbd
DBD += $(ASYN)/dbd/drvAsynIPPort.dbd
DBD += $(ASYN)/dbd/asyn.dbd
DBD += lsplc.dbd

# lsplc.dbd will be made up from these files:
lsplc_DBD += base.dbd
lsplc_DBD += $(TOP)/dbd/modbusSupport.dbd
lsplc_DBD += $(TOP)/dbd/drvAsynIPPort.dbd
lsplc_DBD += $(TOP)/dbd/asyn.dbd

# Include dbd files from all support applications:

# Add all the support libraries needed by this IOC
#lsplc_LIBS += xxx
lsplc_LIBS += asyn modbus

# lsplc_registerRecordDeviceDriver.cpp derives from lsplc.dbd
lsplc_SRCS += lsplc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
lsplc_SRCS_DEFAULT += lsplcMain.cpp
lsplc_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#lsplc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
lsplc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

