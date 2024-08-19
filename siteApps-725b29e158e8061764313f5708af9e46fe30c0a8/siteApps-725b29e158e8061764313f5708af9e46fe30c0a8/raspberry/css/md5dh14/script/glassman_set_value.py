from org.csstudio.opibuilder.scriptUtil import PVUtil
from org.csstudio.opibuilder.scriptUtil import ConsoleUtil

sys = widget.getMacroValue("SYS")
subsys = widget.getMacroValue("SUBSYS")
dev= widget.getMacroValue("DEV")
par= widget.getMacroValue("PAR")

pv_name=sys + "-" + subsys + ":" + dev + ":" + "v0set"
text_box="text_set_voltage_" + par

value=display.getWidget(text_box).getPropertyValue("text")

PVUtil.writePV(pv_name, value)

#ConsoleUtil.writeInfo(value)
