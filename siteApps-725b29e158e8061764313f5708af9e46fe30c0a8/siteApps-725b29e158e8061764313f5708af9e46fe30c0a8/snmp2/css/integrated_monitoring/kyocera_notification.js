importPackage(Packages.org.csstudio.opibuilder.scriptUtil);


var tr1 = PVUtil.getDouble(pvs[0]);
var tr2 = PVUtil.getDouble(pvs[1]);
var tr3 = PVUtil.getDouble(pvs[2]);
var tr4 = PVUtil.getDouble(pvs[3]);
var tr5 = PVUtil.getDouble(pvs[4]);
var toner = PVUtil.getDouble(pvs[5]);


if(toner < 25 ) {
widget.setPropertyValue("text", "Black Cartridge needs to be replaced soon.");
} else if(tr2 < 25 ) {
widget.setPropertyValue("text", "Cassette1 needs to be filled.");
} else if(tr3 < 25 ) {
widget.setPropertyValue("text", "Cassette2 needs to be filled.");
} else if(tr4 < 25 ) {
widget.setPropertyValue("text", "PF-700 needs to be filled.");
} else if(tr5 < 25 ) {
widget.setPropertyValue("text", "PF-700 needs to be filled.");
} else if(tr1 < 25 ) {
widget.setPropertyValue("text", "MP Tray needs to be filled.");
} else {
widget.setPropertyValue("text", "OK");
}