importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var status = PVUtil.getString(pvs[0]);

if(status == "80 outputOn(0)") {
widget.setPropertyValue("text", "OK");

} else if (status == "80 outputInhibit(1)") {
widget.setPropertyValue("text", "inhibit");

} else if (status == "80 outputFailureMinSenseVoltage(2)") {
widget.setPropertyValue("text", "Voltage low");

} else if (status == "80 outputFailureMaxSenseVoltage(3)") {
widget.setPropertyValue("text", "Voltage high");

} else if (status == "80 outputFailureMaxTerminalVoltage(4)") {
widget.setPropertyValue("text", "TermVoltage high");

} else if (status == "80 outputFailureMaxCurrent(5)") {
widget.setPropertyValue("text", "Current high");

} else if (status == "80 outputFailureMaxTemperature(6)") {
widget.setPropertyValue("text", "Temp high");

} else if (status == "80 outputFailureMaxPower(7)") {
widget.setPropertyValue("text", "Power high");

} else if (status == "80 outputFailureTimeout(9)") {
widget.setPropertyValue("text", "Timeout");

} else if (status == "80 outputCurrentLimited(10)") {
widget.setPropertyValue("text", "constrant current");

} else if (status == "80 outputRampUp(11)") {
widget.setPropertyValue("text", "Voltage increasing");

} else if (status == "80 outputRampDown(12)") {
widget.setPropertyValue("text", "Voltage decreasing");

} else if (status == "80 outputEnableKill(13)") {
widget.setPropertyValue("text", "EnableKill");

} else if (status == "80 outputEmergencyOff(14)") {
widget.setPropertyValue("text", "EmergencyOff");

} else if (status == "80 outputAdjusting(15)") {
widget.setPropertyValue("text", "Adjusting");

} else if (status == "80 outputConstantVoltage(16)") {
widget.setPropertyValue("text", "Voltage control");

} else if (status == "80 outputVoltageBoundsExceeded(17)") {
widget.setPropertyValue("text", "Voltage Exceeded");

} else if (status == "80 outputCurrentBoundsExceeded(18)") {
widget.setPropertyValue("text", "Current Exceeded");

} else {
widget.setPropertyValue("text", "current limit exceeded");
widget.setPropertyValue("font",ColorFontUtil.getFont("Cantarell",12,0));
}