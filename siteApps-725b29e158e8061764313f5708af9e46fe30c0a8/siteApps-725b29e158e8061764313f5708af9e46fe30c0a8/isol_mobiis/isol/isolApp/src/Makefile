TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

DBDINC += epidRecord

#=============================
# Build the IOC application

PROD_IOC = ISOL
# ISOL.dbd will be created and installed
DBD += ISOL.dbd

# ISOL.dbd will be made up from these files:
ISOL_DBD += base.dbd
ISOL_DBD += devGenesys.dbd devUp550.dbd devFug.dbd devDGH.dbd niCtrlSupport.dbd
ISOL_DBD += drvAsynSerialPort.dbd
ISOL_DBD += s7plc.dbd
ISOL_DBD += as.dbd
ISOL_DBD += epidSupport.dbd

# Include dbd files from all support applications:
#ISOL_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#ISOL_LIBS += xxx

ISOL_SRCS += epidRecord.c
ISOL_SRCS += devEpidSoft.c
ISOL_SRCS += devEpidSoftCallback.c
ISOL_SRCS += devEpidFast.c

# ISOL_registerRecordDeviceDriver.cpp derives from ISOL.dbd
ISOL_SRCS += ISOL_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ISOL_SRCS_DEFAULT += ISOLMain.cpp
ISOL_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ISOL_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ISOL_LIBS += asyn
ISOL_LIBS += devMoxa
ISOL_LIBS += s7plc
ISOL_LIBS += niCtrl
ISOL_LIBS += autosave
ISOL_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

