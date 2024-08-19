importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var status = PVUtil.getString(pvs[0]);

if (status == "80 vmeSysfail(7)") {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,0,0));
} else {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(176,5,0));
}