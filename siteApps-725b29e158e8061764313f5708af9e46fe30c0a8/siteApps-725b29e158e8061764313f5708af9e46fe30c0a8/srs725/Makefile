#Makefile at top of application tree
TOP = .
include $(TOP)/configure/CONFIG
DIRS := $(DIRS) $(filter-out $(DIRS), configure)
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *App))
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard iocBoot))

define DIR_template
 $(1)_DEPEND_DIRS = configure
endef
$(foreach dir, $(filter-out configure,$(DIRS)),$(eval $(call DIR_template,$(dir))))

iocBoot_DEPEND_DIRS += $(filter %App,$(DIRS))

scandiApp_DEPEND_DIRS += nsls2App
HPI6016App_DEPEND_DIRS += nsls2App
limiterAutoTestApp_DEPEND_DIRS += nsls2App
egunPermitApp_DEPEND_DIRS += nsls2App

include $(TOP)/configure/RULES_TOP


