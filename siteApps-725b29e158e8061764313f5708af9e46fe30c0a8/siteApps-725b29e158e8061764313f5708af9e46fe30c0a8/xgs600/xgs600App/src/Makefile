TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = xgs600
# xgs600.dbd will be created and installed
DBD += xgs600.dbd

# xgs600.dbd will be made up from these files:
xgs600_DBD += base.dbd

# Include dbd files from all support applications:
#xgs600_DBD += xxx.dbd
xgs600_DBD += stream.dbd
xgs600_DBD += asyn.dbd
xgs600_DBD += drvAsynSerialPort.dbd
xgs600_DBD += drvAsynIPPort.dbd



# Add all the support libraries needed by this IOC
#xgs600_LIBS += xxx
xgs600_LIBS += stream asyn

# xgs600_registerRecordDeviceDriver.cpp derives from xgs600.dbd
xgs600_SRCS += xgs600_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
xgs600_SRCS_DEFAULT += xgs600Main.cpp
xgs600_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#xgs600_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
xgs600_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

