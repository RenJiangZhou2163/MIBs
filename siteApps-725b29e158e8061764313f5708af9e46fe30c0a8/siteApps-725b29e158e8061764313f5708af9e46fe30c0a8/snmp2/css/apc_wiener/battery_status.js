importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var outlet = PVUtil.getDouble(pvs[0]);

if(outlet == 2) {
widget.setPropertyValue("text", "battery Normal");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,128,0));

} else if (outlet == 3) {
widget.setPropertyValue("text", "battery Low");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,165,0));

} else if (outlet == 4) {
widget.setPropertyValue("text", "battery In Fault Condition");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,0,255));

} else {
widget.setPropertyValue("text", "Unknown");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,0,0));

}