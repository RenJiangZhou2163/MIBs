importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var value1 = PVUtil.getDouble(pvs[0]);

var value2 = value1 * 0.1;

widget.setPropertyValue("text", value2.toFixed(1));

