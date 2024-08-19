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
USR_INCLUDES += -I/home/pi/wiringPi/devLib
wiringPi_DIR += /home/pi/wiringPi/wiringPi
wiringPiDev_DIR += /home/pi/wiringPi/devLib

raspCharLCD_DIR += $(RAON_SITELIBS)/lib/$(T_A)

PROD_IOC = charlcd
# charlcd.dbd will be created and installed
DBD += charlcd.dbd

# charlcd.dbd will be made up from these files:
charlcd_DBD += base.dbd

# Include dbd files from all support applications:
#charlcd_DBD += xxx.dbd
charlcd_DBD += lcdoutRecord.dbd
charlcd_DBD += devCharLCD.dbd

# Add all the support libraries needed by this IOC
#charlcd_LIBS += xxx
charlcd_LIBS += raspCharLCD
charlcd_LIBS += wiringPi
charlcd_LIBS += wiringPiDev

# charlcd_registerRecordDeviceDriver.cpp derives from charlcd.dbd
charlcd_SRCS += charlcd_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
charlcd_SRCS_DEFAULT += charlcdMain.cpp
charlcd_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#charlcd_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
charlcd_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

