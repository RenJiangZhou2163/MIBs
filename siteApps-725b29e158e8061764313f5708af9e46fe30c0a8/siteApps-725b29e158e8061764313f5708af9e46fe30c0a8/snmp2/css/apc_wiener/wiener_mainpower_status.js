importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var status = PVUtil.getDouble(pvs[0]);

if(status = "1") {
widget.setPropertyValue("on_label", "OK");

} else {
widget.setPropertyValue("on_label", "OFF");
}
