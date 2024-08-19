importPackage(Packages.org.csstudio.opibuilder.scriptUtil);
importPackage(Packages.org.apache.commons.lang.StringUtils);

var pv = PVUtil.getString(pvs[0]);
var state =pv.trim();
widget.setPropertyValue("on_label", state);

if(state== "Ready") {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,255,0));

} else if (state == "Sleeping") {
widget.setPropertyValue("on_color","Invalid");

} else if (state == "Processing") {
widget.setPropertyValue("on_label","Printing...");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(30,144,255));

} else if (state== "Please wait") {
widget.setPropertyValue("on_label","Wait...");
widget.setPropertyValue("on_color","Minor");

} else if (state== "Load Cassette 1") {
widget.setPropertyValue("on_label","Check Tray");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,0,0));

} else if (state== "Load Cassette 2") {
widget.setPropertyValue("on_label","Check Tray");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,0,0));

} else if (state== "Paper jam") {
widget.setPropertyValue("on_label","Paper jam");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,0,0));

} else if (state== "Close") {
widget.setPropertyValue("on_label","Close");
widget.setPropertyValue("on_color","Minor");

} else if (state== "Print Cancel") {
widget.setPropertyValue("on_label","Print Cancel");
widget.setPropertyValue("on_color","Minor");

} else {
widget.setPropertyValue("on_label","Check printer");
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,0,0));
}


