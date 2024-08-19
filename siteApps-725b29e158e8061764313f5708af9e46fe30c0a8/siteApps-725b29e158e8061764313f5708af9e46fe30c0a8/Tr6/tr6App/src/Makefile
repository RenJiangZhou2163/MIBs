TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += tr6Support

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
tr6Support_SRCS += xxxRecord.c
tr6Support_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
tr6Support_SRCS += dbSubExample.c
tr6Support_SRCS += tr6Hello.c
tr6Support_SRCS += initTrace.c

tr6Support_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = tr6
# tr6.dbd will be created and installed
DBD += tr6.dbd

# tr6.dbd will be made up from these files:
tr6_DBD += base.dbd
tr6_DBD += xxxSupport.dbd
tr6_DBD += dbSubExample.dbd
tr6_DBD += tr6Hello.dbd
tr6_DBD += initTrace.dbd

# tr6_registerRecordDeviceDriver.cpp derives from tr6.dbd
tr6_SRCS += tr6_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
tr6_SRCS_DEFAULT += tr6Main.cpp
tr6_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#tr6_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
tr6_LIBS += tr6Support

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into tr6Support
    sncExample_SNCFLAGS += +r
    tr6_DBD += sncExample.dbd
    tr6Support_SRCS += sncExample.stt
    tr6Support_LIBS += seq pv
    tr6_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
tr6_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

