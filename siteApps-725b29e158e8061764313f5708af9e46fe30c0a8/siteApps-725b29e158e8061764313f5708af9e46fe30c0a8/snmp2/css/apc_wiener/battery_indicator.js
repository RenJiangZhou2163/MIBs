importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var outlet = PVUtil.getDouble(pvs[0]);

if(outlet == 1) {
widget.setPropertyValue("text", "No Battery Needs Replacing");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(0,128,0));

} else {
widget.setPropertyValue("text", "Battery Needs Replacing");
widget.setPropertyValue("foreground_color",ColorFontUtil.getColorFromRGB(255,0,0));

}

