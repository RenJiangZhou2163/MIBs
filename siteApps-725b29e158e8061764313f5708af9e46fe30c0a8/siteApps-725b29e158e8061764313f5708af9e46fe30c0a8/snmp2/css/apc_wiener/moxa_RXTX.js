importPackage(Packages.org.csstudio.opibuilder.scriptUtil);


var port = PVUtil.getDouble(pvs[0]);

if(port >= 1) {
widget.setPropertyValue("on_state",true);
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,255,0));

} else {
widget.setPropertyValue("off_color",ColorFontUtil.getColorFromRGB(127,127,127));
}