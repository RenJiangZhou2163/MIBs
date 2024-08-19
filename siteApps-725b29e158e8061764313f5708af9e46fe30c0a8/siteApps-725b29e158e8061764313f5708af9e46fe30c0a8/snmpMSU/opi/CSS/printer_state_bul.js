importPackage(Packages.org.csstudio.opibuilder.scriptUtil);


var xerox = PVUtil.getString(pvs[0]);



if(xerox == "Print-User Action") {
widget.setPropertyValue("on_state",true);
widget.setPropertyValue("on_label", "Ready");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,255,0));

} else if (xerox == "Copy-User Action" && "Copying...") {
widget.setPropertyValue("on_label", "Copying");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,255,0));

} else if (xerox == "Scan-User Action" && "Scanning...") {
widget.setPropertyValue("on_label", "Scanning");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,0,255));

} else {
widget.setPropertyValue("on_label", "Printing");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,255,0));

}