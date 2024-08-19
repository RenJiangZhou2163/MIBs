importPackage(Packages.org.csstudio.opibuilder.scriptUtil);


var level = PVUtil.getDouble(pvs[0]);


if(level < 25 ) {
widget.setPropertyValue("text", "Empty");

} else {
widget.setPropertyValue("text", "OK");

}