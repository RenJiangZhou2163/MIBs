from org.csstudio.opibuilder.scriptUtil import PVUtil

widget_label_current_pulse="label_cur_pulse"

par= widget.getMacroValue("PAR")
widget_text_box = "text_user_" + par

widget_label_current_pulse_value = display.getWidget(widget_label_current_pulse).getPropertyValue("text")

display.getWidget(widget_text_box).setPropertyValue("text", widget_label_current_pulse_value)
