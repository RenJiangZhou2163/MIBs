importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var outlet = PVUtil.getDouble(pvs[0]);

if(outlet == 2) {
widget.setPropertyValue("text", "onLine");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,128,0));

} else if (outlet == 3) {
widget.setPropertyValue("text", "onBattery");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,255,0));
	
} else if (outlet == 4) {
widget.setPropertyValue("text", "onSmartBoost");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 5) {
widget.setPropertyValue("text", "timedSleeping");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,0,255));

} else if (outlet == 6) {
widget.setPropertyValue("text", "softwareBypass");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 7) {
widget.setPropertyValue("text", "off");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,0,0));

} else if (outlet == 8) {
widget.setPropertyValue("text", "rebooting");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,165,0));

} else if (outlet == 9) {
widget.setPropertyValue("text", "switchedBypass");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 10) {
widget.setPropertyValue("text", "hardwareFailureBypass");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 11) {
widget.setPropertyValue("text", "sleepingUntilPowerReturn");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 12) {
widget.setPropertyValue("text", "onSmartTrim");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 13) {
widget.setPropertyValue("text", "ecoMode");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 14) {
widget.setPropertyValue("text", "hotStandby");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 15) {
widget.setPropertyValue("text", "onBatteryTest");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 16) {
widget.setPropertyValue("text", "emergencyStaticBypass");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 17) {
widget.setPropertyValue("text", "staticBypassStandby");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 18) {
widget.setPropertyValue("text", "powerSavingMode");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 19) {
widget.setPropertyValue("text", "spotMode");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else if (outlet == 20) {
widget.setPropertyValue("text", "eConversion");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,0,0));

} else {
widget.setPropertyValue("text", "Unknown");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,0,0));

}
