importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var flag = PVUtil.getString(pvs[0]);

var online = flag.substring(3,4)
var avrtrim = flag.substring(7,8)
var avrboost = flag.substring(6,7)
var onbattery = flag.substring(3,4)
var overload = flag.substring(1,2)
var rplbattery = flag.substring(4,5)
var disbattery = flag.substring(32,33)


widget.setPropertyValue("text", avrtrim);
