importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var outlet = PVUtil.getDouble(pvs[0]);

if(outlet == 1) {
widget.setPropertyValue("text", "ON");

} else if (outlet == 2) {
widget.setPropertyValue("text", "OFF");

} else if (outlet == 3) {
widget.setPropertyValue("text", "Reboot");

} else if (outlet == 5) {
widget.setPropertyValue("text", "ON With Delay");

} else if (outlet == 6) {
widget.setPropertyValue("text", "OFF With Delay");

} else if (outlet == 7) {
widget.setPropertyValue("text", "Reboot With Delay");

} else {
widget.setPropertyValue("text", "Unknown");
}
