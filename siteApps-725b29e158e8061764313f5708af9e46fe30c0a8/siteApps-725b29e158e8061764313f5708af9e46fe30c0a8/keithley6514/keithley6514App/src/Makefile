TOP=../..

include $(TOP)/configure/CONFIG

# 
# RAON Specific Path
#
USR_INCLUDES += -I${RAON_SITELIBS}/include/
USR_DBDFLAGS += -I${RAON_SITELIBS}/dbd/
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

# 
# siteLibs Path
#
timeStamp_DIR += $(RAON_SITELIBS)/lib/$(T_A)
#
#


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

#
# siteLibs DBD
#
keithley6514_DBD += timestampRecord.dbd
keithley6514_DBD += timestampDevSoft.dbd
#
#
#

# Include dbd files from all support applications:
#keithley6514_DBD += xxx.dbd
keithley6514_DBD += stream.dbd
keithley6514_DBD += drvAsynSerialPort.dbd


# Add all the support libraries needed by this IOC
#keithley6514_LIBS += xxx
keithley6514_LIBS += stream asyn
#
#
# siteLibs LIBS
keithley6514_LIBS += timeStamp

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

