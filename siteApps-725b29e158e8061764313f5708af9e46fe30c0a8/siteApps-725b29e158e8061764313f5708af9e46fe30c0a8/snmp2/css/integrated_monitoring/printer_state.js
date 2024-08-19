importPackage(Packages.org.csstudio.opibuilder.scriptUtil);


var xerox = PVUtil.getString(pvs[0]);



if(xerox = "Print-User Action") {
widget.setPropertyValue("text", "Ready");

} else if (xerox = "Copy-User Action" && "Copying...") {
widget.setPropertyValue("text", "Copying");


} else if (xerox = "Scan-User Action" && "Scanning...") {
widget.setPropertyValue("text", "Scanning");


} else {
widget.setPropertyValue("text", "Printing");

}