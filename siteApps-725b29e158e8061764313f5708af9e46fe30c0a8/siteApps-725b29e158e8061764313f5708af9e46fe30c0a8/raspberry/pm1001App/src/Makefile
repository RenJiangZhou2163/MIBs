TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

USR_INCLUDES  += -I$(RAON_SITELIBS)/include
USR_DBDFLAGS  += -I$(RAON_SITELIBS)/dbd
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

USR_INCLUDES += -I/home/pi/wiringPi/wiringPi
wiringPi_DIR += /home/pi/wiringPi/wiringPi /home/pi/wiringPi/devLib

PROD_IOC = pm1001
# pm1001.dbd will be created and installed
DBD += pm1001.dbd

# pm1001.dbd will be made up from these files:
pm1001_DBD += base.dbd

# Include dbd files from all support applications:
#pm1001_DBD += xxx.dbd
pm1001_DBD += stream.dbd
pm1001_DBD += asyn.dbd
pm1001_DBD += drvAsynSerialPort.dbd

# Add all the support libraries needed by this IOC
#pm1001_LIBS += xxx
pm1001_LIBS += wiringPi
pm1001_LIBS += stream
pm1001_LIBS += asyn

# pm1001_registerRecordDeviceDriver.cpp derives from pm1001.dbd
pm1001_SRCS += pm1001_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
pm1001_SRCS_DEFAULT += pm1001Main.cpp
pm1001_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#pm1001_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
pm1001_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

