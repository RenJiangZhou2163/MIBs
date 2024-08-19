importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var status = PVUtil.getString(pvs[0]);

if(status = "80 mainOn(0)") {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,255,0));
widget.setPropertyValue("on_label", "OK");

} else if (status = "80 mainInhibit(1)") {
widget.setPropertyValue("on_color","Major");
widget.setPropertyValue("on_label", "Inhibit of the system");

} else if (status = "80 localControlOnly(2)") {
widget.setPropertyValue("on_color","Minor");
widget.setPropertyValue("on_label", "Local control only");


} else if (status == "80 inputFailure(3)") {
widget.setPropertyValue("on_color","Major");
widget.setPropertyValue("on_label", "Power FAIL");


} else if (status == "80 outputFailure(4)") {
widget.setPropertyValue("on_color","Major");
widget.setPropertyValue("on_label", "Output FAIL");


} else if (status == "80 fantrayFailure(5)") {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,255,0));
widget.setPropertyValue("on_label", "Fan FAIL");


} else if (status == "80 sensorFailure(6)") {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,255,0));
widget.setPropertyValue("on_label", "Over Heat");


} else if (status == "80 vmeSysfail(7)") {
widget.setPropertyValue("on_color","Major");
widget.setPropertyValue("on_label", "SYS FAIL");


} else if (status == "plugAndPlayIncompatible(8)") {
widget.setPropertyValue("on_color","Minor");
widget.setPropertyValue("on_label", "Wrong connected");


} else if (status == "80 busReset(9)") {
widget.setPropertyValue("on_color","Invalid");
widget.setPropertyValue("on_label", "Reset");


} else if (status == "80 supplyDerating(10)") {
widget.setPropertyValue("on_color","Minor");
widget.setPropertyValue("on_label", "P/S1 DEG");


} else if (status == "80 supplyFailure(11)") {
widget.setPropertyValue("on_color","Major");
widget.setPropertyValue("on_label", "P/S1 FAL ");


} else if (status == "80 supplyDerating2(12)") {
widget.setPropertyValue("on_color","Minor");
widget.setPropertyValue("on_label", "P/S2 DEG");


} else if (status == "80 supplyFailure2(13)") {
widget.setPropertyValue("on_color","Major");
widget.setPropertyValue("on_label", "P/S2 FAL");

} else {
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(0,100,0));
widget.setPropertyValue("on_label", "OFF");

}
