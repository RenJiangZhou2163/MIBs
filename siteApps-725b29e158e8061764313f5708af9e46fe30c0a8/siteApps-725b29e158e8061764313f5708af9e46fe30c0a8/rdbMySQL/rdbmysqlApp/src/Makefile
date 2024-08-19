TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
LIBRARY_IOC     += rdbMySQL
USR_CXXFLAGS += -Wno-unused-function -fpermissive

DBD         += rdbmySQLRecord.dbd
DBD         += rdbmySQLDevSoft.dbd
DBDINC      += rdbmySQLRecord

MYSQLLIB = /usr/lib/x86_64-linux-gnu/

MYSQLINC = /usr/include/mysql/
USR_INCLUDES  += -I$(RAON_SITELIBS)/include
USR_INCLUDES  += -I$(MYSQLINC)

rdbMySQL_DIR  += $(MYSQLLIB)
#rdbMySQL_SRCS += rdbmySQLRecord.cpp
rdbMySQL_SRCS += rdbmySQLRecord.cpp rdbmySQLConnManager.cpp 

mysqlclient_DIR += $(MYSQLLIB)

rdbMySQL_LIBS += mysqlclient
rdbMySQL_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = rdbmysql
# rdbmysql.dbd will be created and installed
DBD += rdbmysql.dbd

# rdbmysql.dbd will be made up from these files:
rdbmysql_DBD += base.dbd
rdbmysql_DBD += rdbmySQLRecord.dbd 

# Include dbd files from all support applications:
#rdbmysql_DBD += xxx.dbd
rdbmysql_DBD += rdbmySQLDevSoft.dbd 

# Add all the support libraries needed by this IOC
rdbmysql_LIBS += rdbMySQL

# rdbmysql_registerRecordDeviceDriver.cpp derives from rdbmysql.dbd
rdbmysql_SRCS += rdbmysql_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
rdbmysql_SRCS_DEFAULT += rdbmysqlMain.cpp
rdbmysql_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#rdbmysql_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
rdbmysql_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

