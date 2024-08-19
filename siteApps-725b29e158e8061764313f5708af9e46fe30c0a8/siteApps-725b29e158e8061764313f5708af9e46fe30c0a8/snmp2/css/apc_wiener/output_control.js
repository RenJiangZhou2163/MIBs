importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var status = PVUtil.getDouble(pvs[0]);

if(status = "1") {
widget.setPropertyValue("on_state",1);
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,255,0));

} else if(status = "2") {
widget.setPropertyValue("on_color","Major");

} else if(status = "3") {
widget.setPropertyValue("on_color","Major");

} else if(status = "10") {
widget.setPropertyValue("on_color","Minor");

} else if(status = "20") {
widget.setPropertyValue("on_color","Major");

} else if(status = "21") {
widget.setPropertyValue("on_color","Minor");

} else if(status = "22") {
widget.setPropertyValue("on_color","Minor");

} else if(status = "23") {
widget.setPropertyValue("on_color","Minor");

} else {
widget.setPropertyValue("on_label", "OFF");
widget.setPropertyValue("on_state",0);
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,100,0));
}

