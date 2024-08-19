importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var status = PVUtil.getString(pvs[0]);

if (status == "80 sensorFailure(6)") {
widget.setPropertyValue("off_color",ColorFontUtil.getColorFromRGB(255,255,0));
} else {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(192,182,6));
}