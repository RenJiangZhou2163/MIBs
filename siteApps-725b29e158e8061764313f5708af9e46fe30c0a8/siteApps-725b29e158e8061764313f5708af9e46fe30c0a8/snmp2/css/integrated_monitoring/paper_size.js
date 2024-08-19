importPackage(Packages.org.csstudio.opibuilder.scriptUtil);


var width = PVUtil.getDouble(pvs[0]);
var length = PVUtil.getDouble(pvs[1]);


if(width == 210 && length == 297) {
widget.setPropertyValue("text", "A4");

} else if (width == 297 && length == 210) {
widget.setPropertyValue("text", "A4");

} else if ((width == 297||298) && length == 420) {
widget.setPropertyValue("text", "A3");

} else if (width == 420 && (length == 297||298)) {
widget.setPropertyValue("text", "A3");

} else {
widget.setPropertyValue("text", "-");

}