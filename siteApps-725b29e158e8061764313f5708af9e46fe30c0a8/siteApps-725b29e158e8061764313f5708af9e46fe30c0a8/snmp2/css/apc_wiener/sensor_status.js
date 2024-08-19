importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var sensor = PVUtil.getDouble(pvs[0]);

if(sensor = -128) {
widget.setPropertyValue("text", "OK");

} else {
widget.setPropertyValue("text", "Failure");
}