TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = keithley6514
# keithley6514.dbd will be created and installed
DBD += keithley6514.dbd

# keithley6514.dbd will be made up from these files:
keithley6514_DBD += base.dbd

# Include dbd files from all support applications:
#keithley6514_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#keithley6514_LIBS += xxx

# keithley6514_registerRecordDeviceDriver.cpp derives from keithley6514.dbd
keithley6514_SRCS += keithley6514_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
keithley6514_SRCS_DEFAULT += keithley6514Main.cpp
keithley6514_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#keithley6514_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
keithley6514_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

