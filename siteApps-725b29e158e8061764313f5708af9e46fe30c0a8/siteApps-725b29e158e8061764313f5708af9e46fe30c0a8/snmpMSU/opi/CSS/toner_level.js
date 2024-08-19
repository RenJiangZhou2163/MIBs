importPackage(Packages.org.csstudio.opibuilder.scriptUtil);


var level = PVUtil.getDouble(pvs[0]);
var drum = PVUtil.getDouble(pvs[1]);
var waste = PVUtil.getDouble(pvs[2]);


if(level <= 25 ) {
widget.setPropertyValue("text", "Change");

} else if (drum >= 80) {
widget.setPropertyValue("text", "Change");

} else if (waste <= 0) {
widget.setPropertyValue("text", "Change");


} else {
widget.setPropertyValue("text", "OK");

}