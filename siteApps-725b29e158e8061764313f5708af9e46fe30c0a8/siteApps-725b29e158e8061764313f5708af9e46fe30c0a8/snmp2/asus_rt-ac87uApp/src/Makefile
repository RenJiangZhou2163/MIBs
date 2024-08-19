TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

USR_INCLUDES += -I${RAON_SITELIBS}/include/
USR_DBDFLAGS += -I${RAON_SITELIBS}/dbd/
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

snmpMon_DIR += ${RAON_SITELIBS}/lib/$(T_A)


#=============================
# Build the IOC application

PROD_IOC = asus_rt-ac87u
# asus_rt-ac87u.dbd will be created and installed
DBD += asus_rt-ac87u.dbd

# asus_rt-ac87u.dbd will be made up from these files:
asus_rt-ac87u_DBD += base.dbd
asus_rt-ac87u_DBD += snmpRecord.dbd
asus_rt-ac87u_DBD += snmpDevSoft.dbd

# Include dbd files from all support applications:
#asus_rt-ac87u_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
asus_rt-ac87u_LIBS += snmpMon 

# asus_rt-ac87u_registerRecordDeviceDriver.cpp derives from asus_rt-ac87u.dbd
asus_rt-ac87u_SRCS += asus_rt-ac87u_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
asus_rt-ac87u_SRCS_DEFAULT += asus_rt-ac87uMain.cpp
asus_rt-ac87u_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#asus_rt-ac87u_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
asus_rt-ac87u_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

