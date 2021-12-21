 v-- File Name : ZXR10-GM.mib
-- Date      : 2005-3-1 9:33
-- Author    :   
-- Modifier  : LiXuwen  2009-3-1 21:30
  O"Represents an 802 MAC address represented in the
             `canonical' order defined by IEEE 802.1a, i.e., as if it
             were transmitted least significant bit first, even though
             802.5 (in contrast to other 802.x protocols) requires MAC
             addresses to be transmitted most significant bit first."                                                         '"Group member shakehand timer interval"                       c"Group member shakehand hold timer interval.
		                This item only for command switch."                       O"Group descriptive name.
		                This item only for command switch."                       "Description"                      /"The format of this item is xx/xx. Among this string,
                        the first segment represents layer 3 ipport number, the second
                        segment  represents ippool name. eg: 12/groupmanagement. Command switch and member switch can't
                        set this item."                       e"Get/set tftp server ip address for the group.
		                This item only for command switch."                       �"This item only for member switch. 
		                It indicates the command switch mac address of the group 
		                which this member switch belonged to."                           -"Enable/disable neighbor discovery function."                       "Description"                       "Description"                       "Description"                       "Row Description"                       "Column Description"                       "Column Description"                       "Description"                       "Row Description"                       "Column Description"                       "Column Description"                           "Description"                       M"The value of this item can't be changed while gmSwitchRole is commandSwitch"                       "Description"                       "Description"                       "Description"                       "Description"                       �"The value get from this item is insignificant. 
		                Setting this item will start a topology collection process."                       "Description"                       ."Each entry contains port config for topology"                       +"The port id to index topology collection."                       4"Enable/disable topology collection on certain port"                       "Description"                       -"Each row contains trunk config for topology"                       "Trunk id."                       5"Enable/disable topology collection on certain trunk"                       !"Device in the network topology."                       4"Each row contains a device info that was collected"                       "Device mac address."                       "Device id."                       "Column Description"                       "Column Description"                       %"The device type, running platform. "                      "The value indicates the switch role in the topology,
		                But only command switch can set value of this item.
		                Furthermore, only memberSwitch ( 2 ) can be set which means 
		                adding a device of the topology to the group."                       ""                       �"It indicates the command switch mac address of the group 
		                which this device belonged to. If the device role is not 
		                member switch, the item value is the device sysmac."                       �"It indicates the command switch ip address of the group 
		                which this device belonged to. If the device role is not 
		                member switch, the item value is 0."                           -"Only command switch can have a memberTable."                       o"Each row contains all of the info of a member of 
		            a group which managed by this command switch"                       "Column Description"                       "Column Description"                       "Column Description"                       "Column Description"                       "Column Description"                       g"When set memRole as candidateSwitch(2), 
		                this member will be delete from the group"                       3"Well-known port mapping to private port by memId."                       "Column Description"                       "Description"                       "Description"                       "Description"                       "Description"                           ?"This trap sended by command switch to notify topology change."                 g"The trap indicates nms that member switch transfer between connect or disconnect with command switch."                    