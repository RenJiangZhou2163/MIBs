from org.csstudio.opibuilder.scriptUtil import PVUtil
import time

sys = widget.getMacroValue("SYS")
subsys = widget.getMacroValue("SUBSYS")
dev= widget.getMacroValue("DEV")
par= widget.getMacroValue("PAR")

pv_name_absolute_angle = sys + "-" + subsys + ":" + dev + ":SEQ:Aabs"
pv_name_absolute_move = sys + "-" + subsys + ":" + dev + ":SEQ:Mabs"
widget_text_box="text_user_" + par

widget_text_box_value = display.getWidget(widget_text_box).getPropertyValue("text")

PVUtil.writePV(pv_name_absolute_angle, widget_text_box_value)
time.sleep(0.5)

PVUtil.writePV(pv_name_absolute_move, "1")
