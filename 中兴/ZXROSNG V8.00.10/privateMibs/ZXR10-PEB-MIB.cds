                                                                           �"The MIB module to describe part of IEEE P802.1BR protocol data. 
         Include some private variable used when the protocol is completed." m"Geng chunjing
         Tel : +86-25-52870000        
         E-Mail: geng.chunjing@zte.com.cn
         " "201601210000Z" "201507070000Z" {"Modify the value list of pebPortStatusPortType.
         Modify the description of pebLldpPeTlv and pebPortCfgLldpPeTlv." %"Initial version of this MIB module."                  &"The role of the device in the Extended Bridge system,
            include controller(Controlling Bridge) and extender(Bridge Port Extender).
 
            The value none means the device is not an Extended Bridge system device.
 
            The default value for pebRole object is none." "802.1BR-d3-3cb clause 6.1 "                     '"The global control of sending PE-TLV."                           G"The table that controls PEB private configuration on individual port."                       6"PEB configuration information for a particular port."                       Q"The index value used to identify the port component associated with this entry."                       "The port name."                      a"The priority of the port. When transmitted from a Port capable of operating as a cascade Port (e.g. Ports of a Controlling Bridge or Extended Ports of an Extended Bridge), 
            indicates the cascade_port_priority used in determining which Port is to be used by a Bridge Port Extender as its Upstream Port. 
  
            Valid values are the range from 0 to 254. When transmitted from a Bridge Port Extender on an Upstream Port or a Port capable of becoming an Upstream Port, this parameter shall be set to 255. 
            
            The default value for pebPortCfgPriority object is 100." "802.1BR-d3-3cb clause B.2.1"                     *"The control of sending PE-TLV on a port."                           +"The table include port status infomation."                       /"PEB status information for a particular port."                       Q"The index value used to identify the port component associated with this entry."                       "The port name."                      �"MAC address of the device for the interface. 
             For ethernet interface on Controlling Bridge, the MAC address indicates the base MAC address of the device; 
             For BEP interface on Controlling Bridge, the MAC address indicates the MAC address of the associated External Bridge Port Extender.
             For the interface on External Bridge Port Extender, the MAC address indicates the base MAC address of the device.
             "                      k"The interface on the Upstream equipment which is connected to the Upstream Port of the device for the specified interface.
             For ethernet interface on Controlling Bridge and interface on Port Externed Bridge, there is no access port.
             For BEP interace on Controlling Bridge, the access port is the associated cascade port.
            "                       "The type for the port."                       "The port status."                       �"The ECID for the interface. 
             The value null is for the ethernet interface on Controlling Bridge.
             The value all is for the Upstream Port on External Bridge Port Extender.
            "                                  