importPackage(Packages.org.csstudio.opibuilder.scriptUtil);


var port = PVUtil.getDouble(pvs[0]);

if(port == 1) {
widget.setPropertyValue("on_state",true);
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,255,0));

} else if (port == 2 ) {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(127,127,127));

} else if (port == 3 ) {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,128,0));

} else if (port == 4 ) {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,128,0));

} else if (port == 5 ) {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,255,0));

} else if (port == 6 ) {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,128,0));

} else if (port == 7 ) {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(127,127,127));

} else {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,100,0));

}