TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += tr2Support

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
tr2Support_SRCS += xxxRecord.c
tr2Support_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
tr2Support_SRCS += dbSubExample.c
tr2Support_SRCS += tr2Hello.c
tr2Support_SRCS += initTrace.c
tr2Support_SRCS += subASUB1_ex.c
tr2Support_SRCS += subASUB2_ex.c
tr2Support_SRCS += subASUB3_ex.c
#tr2Support_SRCS += ex_subASUB3_ex.c

tr2Support_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = tr2
# tr2.dbd will be created and installed
DBD += tr2.dbd

# tr2.dbd will be made up from these files:
tr2_DBD += base.dbd
tr2_DBD += xxxSupport.dbd
tr2_DBD += dbSubExample.dbd
tr2_DBD += tr2Hello.dbd
tr2_DBD += initTrace.dbd
tr2_DBD += subASUB1_ex.dbd
tr2_DBD += subASUB2_ex.dbd
tr2_DBD += subASUB3_ex.dbd
#tr2_DBD += ex_subASUB3_ex.dbd

# tr2_registerRecordDeviceDriver.cpp derives from tr2.dbd
tr2_SRCS += tr2_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
tr2_SRCS_DEFAULT += tr2Main.cpp
tr2_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#tr2_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
tr2_LIBS += tr2Support

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into tr2Support
    sncExample_SNCFLAGS += +r
    tr2_DBD += sncExample.dbd
    tr2Support_SRCS += sncExample.stt
    tr2Support_LIBS += seq pv
    tr2_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
tr2_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

