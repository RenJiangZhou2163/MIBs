importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var opt = PVUtil.getLong(pvs[0]);

if(opt == 0) {
widget.setPropertyValue("text", "Immediate ");

} else {
widget.setPropertyValue("text", opt+" second");
}
