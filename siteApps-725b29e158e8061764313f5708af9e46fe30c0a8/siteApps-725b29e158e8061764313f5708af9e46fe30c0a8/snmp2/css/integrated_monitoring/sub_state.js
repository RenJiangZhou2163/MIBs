importPackage(Packages.org.csstudio.opibuilder.scriptUtil);
importPackage(Packages.org.apache.commons.lang.StringUtils);

var pv_sub = PVUtil.getString(pvs[0]);

var state =pv_sub.trim();
widget.setPropertyValue("on_label", sub);


if(state == "Check printer") {
widget.setPropertyValue("on_label",sub);
widget.setPropertyValue("on_color",ColorFontUtil.getColorFromRGB(255,0,0));
