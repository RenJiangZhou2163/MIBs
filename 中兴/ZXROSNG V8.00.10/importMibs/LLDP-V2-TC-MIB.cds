     ="This TC describes the Power over Ethernet (PoE) port class."              �"This TC describes the source of a chassis identifier.

            The enumeration 'chassisComponent(1)' represents a chassis
            identifier based on the value of entPhysicalAlias object
            (defined in IETF RFC 4133) for a chassis component (i.e.,
            an entPhysicalClass value of 'chassis(3)').

            The enumeration 'interfaceAlias(2)' represents a chassis
            identifier based on the value of ifAlias object (defined in
            IETF RFC 2863) for an interface on the containing chassis.

            The enumeration 'portComponent(3)' represents a chassis
            identifier based on the value of entPhysicalAlias object
            (defined in IETF RFC 4133) for a port or backplane
            component (i.e., entPhysicalClass value of 'port(10)' or
            'backplane(4)'), within the containing chassis.

            The enumeration 'macAddress(4)' represents a chassis
            identifier based on the value of a unicast source address
            (encoded in network byte order and IEEE 802.3 canonical bit
            order), of a port on the containing chassis as defined in
            IEEE Std 802.

            The enumeration 'networkAddress(5)' represents a chassis
            identifier based on a network address, associated with
            a particular chassis. The encoded address is actually
            composed of two fields. The first field is a single octet,
            representing the IANA AddressFamilyNumbers value for the
            specific address type, and the second field is the network
            address value.

            The enumeration 'interfaceName(6)' represents a chassis
            identifier based on the value of ifName object (defined in
            IETF RFC 2863) for an interface on the containing chassis.

            The enumeration 'local(7)' represents a chassis identifier
            based on a locally defined value."              $"This TC describes the system capabilities.

            The bit 'other(0)' indicates that the system has capabilities
            other than those listed below.

            The bit 'repeater(1)' indicates that the system has repeater
            capability.

            The bit 'bridge(2)' indicates that the system has bridge
            capability.

            The bit 'wlanAccessPoint(3)' indicates that the system has 
            WLAN access point capability.

            The bit 'router(4)' indicates that the system has router
            capability.

            The bit 'telephone(5)' indicates that the system has telephone
            capability.

            The bit 'docsisCableDevice(6)' indicates that the system has
            DOCSIS Cable Device capability (IETF RFC 4639 & 2670).

            The bit 'stationOnly(7)' indicates that the system has only
            station capability and nothing else.

            The bit 'cVLANComponent(8)' indicates that the system has
            C-VLAN component functionality.

            The bit 'sVLANComponent(8)' indicates that the system  has
            S-VLAN component functionality.

            The bit 'twoPortMACRelay(10)' indicates that the system has
            Two-port MAC Relay (TPMR) functionality."              �"An index value, used as the index to the table of destination
            MAC addresses used both as the destination addresses on
            transmitted LLDPDUs and on received LLDPDUs. This index value
            is also used as a secondary index value in tables indexed
            by fields of type  ifIndex, in order to associate 
            a destination address with each row of the table."              
�"This TC describes the format of a chassis identifier string.
            Objects of this type are always used with an associated
            LldpChassisIdSubtype object, which identifies the format of
            the particular LldpChassisId object instance.

            If the associated LldpChassisIdSubtype object has a value of
            'chassisComponent(1)', then the octet string identifies
            a particular instance of the entPhysicalAlias object
            (defined in IETF RFC 4133) for a chassis component (i.e.,
            an entPhysicalClass value of 'chassis(3)').

            If the associated LldpChassisIdSubtype object has a value
            of 'interfaceAlias(2)', then the octet string identifies
            a particular instance of the ifAlias object (defined in
            IETF RFC 2863) for an interface on the containing chassis.
            If the particular ifAlias object does not contain any values,
            another chassis identifier type should be used.

            If the associated LldpChassisIdSubtype object has a value
            of 'portComponent(3)', then the octet string identifies a
            particular instance of the entPhysicalAlias object (defined
            in IETF RFC 4133) for a port or backplane component within
            the containing chassis.

            If the associated LldpChassisIdSubtype object has a value of
            'macAddress(4)', then this string identifies a particular
            unicast source address (encoded in network byte order and
            IEEE 802.3 canonical bit order), of a port on the containing
            chassis as defined in IEEE Std 802.

            If the associated LldpChassisIdSubtype object has a value of
            'networkAddress(5)', then this string identifies a particular
            network address, encoded in network byte order, associated
            with one or more ports on the containing chassis. The first
            octet contains the IANA Address Family Numbers enumeration
            value for the specific address type, and octets 2 through
            N contain the network address value in network byte order.

            If the associated LldpChassisIdSubtype object has a value
            of 'interfaceName(6)', then the octet string identifies
            a particular instance of the ifName object (defined in
            IETF RFC 2863) for an interface on the containing chassis.
            If the particular ifName object does not contain any values,
            another chassis identifier type should be used.

            If the associated LldpChassisIdSubtype object has a value of
            'local(7)', then this string identifies a locally assigned
            Chassis ID."              	9"This TC describes the format of a port identifier string.
            Objects of this type are always used with an associated
            LldpPortIdSubtype object, which identifies the format of the
            particular LldpPortId object instance.

            If the associated LldpPortIdSubtype object has a value of
            'interfaceAlias(1)', then the octet string identifies a
            particular instance of the ifAlias object (defined in IETF
            RFC 2863). If the particular ifAlias object does not contain
            any values, another port identifier type should be used.

            If the associated LldpPortIdSubtype object has a value of
            'portComponent(2)', then the octet string identifies a
            particular instance of the entPhysicalAlias object (defined
            in IETF RFC 4133) for a port or backplane component.

            If the associated LldpPortIdSubtype object has a value of
            'macAddress(3)', then this string identifies a particular
            unicast source address (encoded in network byte order
            and IEEE 802.3 canonical bit order) associated with the port
            (IEEE Std 802).

            If the associated LldpPortIdSubtype object has a value of
            'networkAddress(4)', then this string identifies a network
            address associated with the port. The first octet contains
            the IANA AddressFamilyNumbers enumeration value for the
            specific address type, and octets 2 through N contain the
            networkAddress address value in network byte order.

            If the associated LldpPortIdSubtype object has a value of
            'interfaceName(5)', then the octet string identifies a
            particular instance of the ifName object (defined in IETF
            RFC 2863). If the particular ifName object does not contain
            any values, another port identifier type should be used.

            If the associated LldpPortIdSubtype object has a value of
            'agentCircuitId(6)', then this string identifies a agent-local
            identifier of the circuit (defined in RFC 3046).

            If the associated LldpPortIdSubtype object has a value of
            'local(7)', then this string identifies a locally
            assigned port ID."               �"This TC describes the link aggregation status.

            The bit 'aggCapable(0)' indicates the link is capable of being
            aggregated. 

            The bit 'aggEnabled(1)' indicates the link is currently in
            aggregation."              7"The value of a management address associated with the LLDP
            agent that may be used to reach higher layer entities to
            assist discovery by network management.

            It should be noted that appropriate security credentials,
            such as SNMP engineId, may be required to access the LLDP
            agent using a management address. These necessary credentials
            should be known by the network management and the objects
            associated with the credentials are not included in the
            LLDP agent."              D"This TC describes the source of a particular type of port
            identifier used in the LLDP MIB.

            The enumeration 'interfaceAlias(1)' represents a port
            identifier based on the ifAlias MIB object, defined in IETF
            RFC 2863.

            The enumeration 'portComponent(2)' represents a port
            identifier based on the value of entPhysicalAlias (defined in
            IETF RFC 4133) for a port component (i.e., entPhysicalClass
            value of 'port(10)'), within the containing chassis.

            The enumeration 'macAddress(3)' represents a port identifier
            based on a unicast source address (encoded in network
            byte order and IEEE 802.3 canonical bit order), which has
            been detected by the agent and associated with a particular
            port (IEEE Std 802).

            The enumeration 'networkAddress(4)' represents a port
            identifier based on a network address, detected by the agent
            and associated with a particular port.

            The enumeration 'interfaceName(5)' represents a port
            identifier based on the ifName MIB object, defined in IETF
            RFC 2863.

            The enumeration 'agentCircuitId(6)' represents a port
            identifier based on the agent-local identifier of the circuit
            (defined in RFC 3046), detected by the agent and associated
            with a particular port.

            The enumeration 'local(7)' represents a port identifier
            based on a value locally assigned."             	"8.5.9.5"�"This TC defines an enumeration value that identifies
            the interface numbering method used for defining the
            interface number associated with a management address.
            An object with this syntax defines the format of an
            interface number object.

            The enumeration 'unknown(1)' represents the case where the
            interface is not known. In this case, the corresponding 
            interface number is of zero length.

            The enumeration 'ifIndex(2)' represents interface identifier
            based on the ifIndex MIB object.

            The enumeration 'systemPortNumber(3)' represents interface
            identifier based on the system port numbering convention."                                            /"Textual conventions used throughout the IEEE Std 802.1AB
            version 2 and later MIB modules.

            Unless otherwise indicated, the references in this
            MIB module are to IEEE 802.1AB-2009.

            The TCs in this MIB are taken from the original LLDP-MIB,
            LLDP-EXT-DOT1-MIB, and LLDP-EXT-DOT3-MIB published in
            IEEE Std 802-1D-2005, with the addition of TCs to support
            the management address table. They have been made available
            as a separate TC MIB module to facilitate referencing from
            other MIB modules.

            Copyright (C) IEEE (2009). This version of this MIB module
            is published as subclause 11.5.1 of IEEE Std 802.1AB-2009;
            see the standard itself for full legal notices."o"WG-URL: http://grouper.ieee.org/groups/802/1/index.html
             WG-EMail: STDS-802-1-L@LISTSERV.IEEE.ORG

             Contact: Tony Jeffree
             Postal:  11a Poplar Grove
                      Sale 
                      Cheshire M33 3AX
                      UK
             Tel:     +44-161-973-4278
             E-mail:  tony@jeffree.co.uk" "200906080000Z" 6"Published as part of IEEE Std 802.1AB-2009 revision."       U-- June 08, 2009 
-- <<Editor's Note: Date will need updating before publication>>
          