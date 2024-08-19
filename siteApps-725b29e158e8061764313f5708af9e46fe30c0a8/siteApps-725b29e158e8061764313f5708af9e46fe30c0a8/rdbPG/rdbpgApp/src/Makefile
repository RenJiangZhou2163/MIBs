TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
LIBRARY_IOC     += rdbPostgreSQL
#USR_CXXFLAGS += -Wno-unused-function -fpermissive

DBD         += rdbpostgreSQLRecord.dbd
DBD         += rdbpostgreSQLDevSoft.dbd
DBDINC      += rdbpostgreSQLRecord

SYSLIB = /usr/lib/

SYSINC = /usr/include
USR_INCLUDES  += -I$(RAON_SITELIBS)/include
USR_INCLUDES  += -I$(SYSINC)

pq_DIR += $(SYSLIB)
pqxx_DIR += $(SYSLIB)

# need to find the better way in the different OS distribution version
# jhlee
JESSIE_SYSLIB = /usr/lib/x86_64-linux-gnu
pq_DIR += $(JESSIE_SYSLIB)
pqxx_DIR += $(JESSIE_SYSLIB)



#rdbPostgreSQL_SRCS += devRdbpostgreSQL.c rdbpostgreSQLRecord.c rdbConnManager.cpp
rdbPostgreSQL_SRCS += rdbpostgreSQLRecord.c rdbConnManager.cpp
rdbPostgreSQL_LIBS += pq
rdbPostgreSQL_LIBS += pqxx
rdbPostgreSQL_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = rdbpg
# rdbpg.dbd will be created and installed
DBD += rdbpg.dbd

# rdbpg.dbd will be made up from these files:
rdbpg_DBD += base.dbd
rdbpg_DBD += rdbpostgreSQLRecord.dbd

# Include dbd files from all support applications:
#rdbpg_DBD += xxx.dbd
rdbpg_DBD += rdbpostgreSQLDevSoft.dbd

# Add all the support libraries needed by this IOC
rdbpg_LIBS += rdbPostgreSQL

# rdbpg_registerRecordDeviceDriver.cpp derives from rdbpg.dbd
rdbpg_SRCS += rdbpg_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
rdbpg_SRCS_DEFAULT += rdbpgMain.cpp
rdbpg_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#rdbpg_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
rdbpg_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

