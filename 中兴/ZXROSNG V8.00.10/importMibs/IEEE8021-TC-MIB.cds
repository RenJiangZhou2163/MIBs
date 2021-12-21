   "12.16.3, 12.16.5, 12.16.6" �"A 2 bit selector which determines if frames on this VIP may
        ingress to the PBBN but not egress the PBBN, egress to the
        PBBN but not ingress the PBBN, or both ingress and egress
        the PBBN."             "12.24.2.1.3 h)" �"This textual convention is used to represent administrative
        commands that can be issued to an IPG.  The value
        clear(1) is used to indicate that no administrative action
        is to be performed."             
"12.6.2.6"�"Bridge ports may encode or decode the PCP value of the 
        frames that traverse the port. This textual convention 
        names the possible encoding and decoding schemes that
        the port may use.  The priority and drop_eligible
        parameters are encoded in the Priority Code Point (PCP)
        field of the VLAN tag using the Priority Code Point
        Encoding Table for the Port, and they are decoded from
        the PCP using the Priority Code Point Decoding Table."             "802.1Qay 3.11"	"This textual convention is used to represent an identifier
        that refers to a TE Service Instance.  Note that, internally
        a TE-SID is implementation dependent.  This textual convention
        defines the external representation of TE-SID values."             	"12.19.2" �"The PbbTeProtectionGroupId identifier is used to distinguish 
         protection group instances present in the B Component of
         an IB-BEB."             
"17.3.2.2""An integer that uniquely identifies a bridge port, as
        specified in 17.3.2.2 of IEEE 802.1ap.  The value 0
        means no port number, and this must be clarified in the
        DESCRIPTION clause of any object defined using this
        TEXTUAL-CONVENTION."             	"26.11.1"�"This textual convention is used to represent the logical
        components that comprise the 3-tuple that identifies a
        Segment Monitoring Path (SMP).  The 3-tuple consists of a
        destination MAC address, a source MAC address and a VID.
        Bytes (1..6) of this textual convention contain the
        SMP-MAC-DA, bytes (7..12) contain the SMP-MAC-SA, and bytes
        (13..14) contain the SMP-VID."             "802.1Qay 3.2"�"This textual convention is used to represent the logical
        components that comprise the 3-tuple that identifies an
        Ethernet Switched Path.  The 3-tuple consists of a
        destination MAC address, a source MAC address and a VID.
        Bytes (1..6) of this textual convention contain the
        ESP-MAC-DA, bytes (7..12) contain the ESP-MAC-SA, and bytes
        (13..14) contain the ESP-VID."             \"12.16.1.1.3 h4), 12.16.2.1/2,
                 12.13.1.1, 12.13.1.2, 12.15.2.1, 12.15.2.2"�"A port type.  The possible port types are:

             customerVlanPort(2) - Indicates a port is a C-tag
                 aware port of an enterprise VLAN aware bridge.

             providerNetworkPort(3) - Indicates a port is an S-tag
                 aware port of a Provider Bridge or Backbone Edge
                 Bridge used for connections within a PBN or PBBN.

             customerNetworkPort(4) - Indicates a port is an S-tag
                 aware port of a Provider Bridge or Backbone Edge
                 Bridge used for connections to the exterior of a
                 PBN or PBBN.

             customerEdgePort(5) - Indicates a port is a C-tag
                 aware port of a Provider Bridge used for connections
                 to the exterior of a PBN or PBBN.

             customerBackbonePort(6) - Indicates a port is a I-tag
                 aware port of a Backbone Edge Bridge's B-component.

             virtualInstancePort(7) - Indicates a port is a virtual
                 S-tag aware port within a Backbone Edge Bridge's
                 I-component which is responsible for handling
                 S-tagged traffic for a specific backbone service
                 instance.

             dBridgePort(8) - Indicates a port is a VLAN-unaware
                 member of an 802.1D bridge.

             remoteCustomerAccessPort (9) - Indicates a port is an
                 S-tag aware port of a Provider Bridge used for
                 connections to remote customer interface LANs
                 through another PBN.
                 
             stationFacingBridgePort (10) - Indicates a port of a
                 Bridge that supports the EVB status parameters
                 (6.6.5) with an EVBMode parameter value of
                 EVB Bridge.
                 
             uplinkAccessPort (11) - Indicates a port on a
                 Port-mapping S-VLAN component that connects an EVB
                 Bridge with an EVB station.             
                 
             uplinkRelayPort (12) - Indicates a port of an edge relay
                 that supports the EVB status parameters (6.6.5)
                 with an EVBMode parameter value of EVB station."              �"A value that represents a type (and thereby the format)
        of a IEEE8021ServiceSelectorValue.  The value can be one of
        the following:

        ieeeReserved(0)   Reserved for definition by IEEE 802.1
                          recommend to not use zero unless
                          absolutely needed.
        vlanId(1)         12-Bit identifier as described in IEEE802.1Q.
        isid(2)           24-Bit identifier as described in IEEE802.1ah.
        tesid(3)          32 Bit identifier as described below.
        segid(4)          32 Bit identifier as described below.
        ieeeReserved(xx)  Reserved for definition by IEEE 802.1
                          xx values can be [5..7].

        To support future extensions, the IEEE8021ServiceSelectorType
        textual convention SHOULD NOT be sub-typed in object type
        definitions.  It MAY be sub-typed in compliance statements in
        order to require only a subset of these address types for a
        compliant implementation.

        The tesid is used as a service selector for MAs that are present
        in bridges that implement PBB-TE functionality.  A selector of
        this type is interpreted as a 32 bit unsigned value of type
        IEEE8021PbbTeTSidId.  This type is used to index the
        Ieee8021PbbTeTeSidTable to find the ESPs which comprise the TE
        Service Instance named by this TE-SID value.
        
        The segid is used as a service selector for MAs that are present
        in bridges that implement IPS functionality.  A selector of
        this type is interpreted as a 32 bit unsigned value of type
        IEEE8021TeipsSegid.  This type is used to index the
        Ieee8021TeipsSegTable to find the SMPs which comprise the
        Infrastructure Segment named by this segid value.

        Implementations MUST ensure that IEEE8021ServiceSelectorType
        objects and any dependent objects (e.g.,
        IEEE8021ServiceSelectorValue objects) are consistent.  An
        inconsistentValue error MUST be generated if an attempt to
        change an IEEE8021ServiceSelectorType object would, for
        example, lead to an undefined IEEE8021ServiceSelectorValue value."             	"12.3 l)"�"The component identifier is used to distinguish between the
        multiple virtual bridge instances within a PB or PBB.  In simple
        situations where there is only a single component the default
        value is 1.  The component is identified by a component
        identifier unique within the BEB and by a MAC address unique
        within the PBBN.  Each component is associated with a Backbone
        Edge Bridge (BEB) Configuration managed object.

        The special value '0' means 'no component identifier'.  When
        this TC is used as the SYNTAX of an object, that object must
        specify the exact meaning for this value."             
"17.3.2.2" �"An integer that uniquely identifies a bridge port, as
        specified in 17.3.2.2 of IEEE 802.1ap.
        This value is used within the spanning tree
        protocol to identify this port to neighbor bridges."             "12.16.3, 12.16.5"�"The service instance identifier is used at the Customer
        Backbone Port of a PBB to distinguish a service instance
        (Local-SID). If the Local-SID field is supported, it is
        used to perform a bidirectional 1:1 mapping between the
        Backbone I-SID and the Local-SID. If the Local-SID field
        is not supported, the Local-SID value is the same as the
        Backbone I-SID value.

        The special value of 1 indicates an unassigned I-SID."             "12.24.1.1.3 a)" \"The TEIPS IPG identifier is used to distinguish 
         IPG instances present in a PBB."             "9.6"+"A value used to index per-VLAN tables.  The value 0 is not
        permitted, while the value 4095 represents a 'wildcard'
        value.  An object whose SYNTAX is IEEE8021VlanIndexOrWildcard
        must specify in its DESCRIPTION the specific meaning of the
        wildcard value.  If the value is between 1 and
        4094 inclusive, it represents an IEEE 802.1Q VLAN-ID with
        global scope within a given bridged domain (see VlanId
        textual convention).  If the value is greater than 4095,
        then it represents a VLAN with scope local to the
        particular agent, i.e., one without a global VLAN-ID
        assigned to it.  Such VLANs are outside the scope of
        IEEE 802.1Q, but it is convenient to be able to manage them
        in the same way using this MIB."              "An integer that uniquely identifies a generic MAC service.
         Examples of service selectors are a VLAN-ID (IEEE 802.1Q)
         and an I-SID (IEEE 802.1ah).

         An IEEE8021ServiceSelectorValue value is always interpreted
         within the context of an IEEE8021ServiceSelectorType value.
         Every usage of the IEEE8021ServiceSelectorValue textual
         convention is required to specify the
         IEEE8021ServiceSelectorType object that provides the context.
         It is suggested that the IEEE8021ServiceSelectorType object
         be logically registered before the object(s) that use the
         IEEE8021ServiceSelectorValue textual convention, if they
         appear in the same logical row.

         The value of an IEEE8021ServiceSelectorValue object must
         always be consistent with the value of the associated
         IEEE8021ServiceSelectorType object.  Attempts to set an
         IEEE8021ServiceSelectorValue object to a value inconsistent
         with the associated IEEE8021ServiceSelectorType must fail
         with an inconsistentValue error.

         Note that a MIB object that is defined using this
         TEXTUAL-CONVENTION SHOULD clarify the
         maximum value (i.e., 4094, for a VLAN ID)."             a"26.10.3.3.5
               26.10.3.3.6
               26.10.3.3.7
               12.19.2.3.2" �"This textual convention is used to represent administrative
        commands that can be issued to a protection group.  The value
        noAdmin(1) is used to indicate that no administrative action
        is to be performed."             "9.6"b"A value used to index per-VLAN tables: values of 0 and
        4095 are not permitted.  If the value is between 1 and
        4094 inclusive, it represents an IEEE 802.1Q VLAN-ID with
        global scope within a given bridged domain (see VlanId
        textual convention).  If the value is greater than 4095,
        then it represents a VLAN with scope local to the
        particular agent, i.e., one without a global VLAN-ID
        assigned to it.  Such VLANs are outside the scope of
        IEEE 802.1Q, but it is convenient to be able to manage them
        in the same way using this MIB."               �"In an MSTP Bridge, an MSTID, i.e., a value used to identify
        a spanning tree (or MST) instance.  In the PBB-TE environment
        the value 4094 is used to identify VIDs managed by the PBB-TE
        procedures."             "12.16.3, 12.16.5"�"The service instance identifier is used at the Customer
        Backbone Port of a PBB to distinguish a service instance
        (Local-SID). If the Local-SID field is supported, it is
        used to perform a bidirectional 1:1 mapping between the
        Backbone I-SID and the Local-SID. If the Local-SID field
        is not supported, the Local-SID value is the same as the
        Backbone I-SID value."             "12.24.2.1.3 d)" d"This textual convention is used to represent the status of
        active requests within an IPG."             "12.13.3.3"  "An 802.1Q user priority value."             "12.19.2.1.3 d)" p"This textual convention is used to represent the status of
        active requests within a protection group."             	"26.11.1""This textual convention is used to represent an
        identifier that refers to an Infrastructure Segment.
        Note that, internally a SEG-ID implementation
        dependent.  This textual convention defines the
        external representation of SEG-ID values."             !"12.10.1.3, 12.13.3.3, 12.13.3.4" #"Acceptable frame types on a port."             	"12.3 l)""The component identifier is used to distinguish between the
        multiple virtual bridge instances within a PB or PBB.  Each
        virtual bridge instance is called a component.  In simple
        situations where there is only a single component the default
        value is 1.  The component is identified by a component
        identifier unique within the BEB and by a MAC address unique
        within the PBBN.  Each component is associated with a Backbone
        Edge Bridge (BEB) Configuration managed object."              �"An integer that uniquely identifies a generic MAC service,
         or none.  Examples of service selectors are a VLAN-ID
         (IEEE 802.1Q) and an I-SID (IEEE 802.1ah).

         An IEEE8021ServiceSelectorValueOrNone value is always
         interpreted within the context of an
         IEEE8021ServiceSelectorType value.  Every usage of the
         IEEE8021ServiceSelectorValueOrNone textual convention is
         required to specify the IEEE8021ServiceSelectorType object
         that provides the context.  It is suggested that the
         IEEE8021ServiceSelectorType object be logically registered
         before the object(s) that use the
         IEEE8021ServiceSelectorValueOrNone textual convention, if
         they appear in the same logical row.

         The value of an IEEE8021ServiceSelectorValueOrNone object
         must always be consistent with the value of the associated
         IEEE8021ServiceSelectorType object.  Attempts to set an
         IEEE8021ServiceSelectorValueOrNone object to a value
         inconsistent with the associated
         IEEE8021ServiceSelectorType must fail with an
         inconsistentValue error.

         The special value of zero is used to indicate that no
         service selector is present or used.  This can be used in
         any situation where an object or a table entry MUST either
         refer to a specific service, or not make a selection.

         Note that a MIB object that is defined using this
         TEXTUAL-CONVENTION SHOULD clarify the meaning of
         'no service' (i.e., the special value 0), as well as the
         maximum value (i.e., 4094, for a VLAN ID)."                                            X"Textual conventions used throughout the various IEEE 802.1 MIB
         modules.

         Unless otherwise indicated, the references in this MIB
         module are to IEEE 802.1Q-2011.

         Copyright (C) IEEE.
         This version of this MIB module is part of IEEE802.1Q;
         see the draft itself for full legal notices.""  WG-URL: http://grouper.ieee.org/groups/802/1/index.html
         WG-EMail: stds-802-1@ieee.org

          Contact: David Levi
           Postal: C/O IEEE 802.1 Working Group
                   IEEE Standards Association
                   445 Hoes Lane
                   P.O. Box 1331
                   Piscataway
                   NJ 08855-1331
                   USA
           E-mail: STDS-802-1-L@LISTSERV.IEEE.ORG

          Contact: Kevin Nolish
           Postal: C/O IEEE 802.1 Working Group
                   IEEE Standards Association
                   445 Hoes Lane
                   P.O. Box 1331
                   Piscataway
                   NJ 08855-1331
                   USA
           E-mail: STDS-802-1-L@LISTSERV.IEEE.ORG" "201202150000Z" "201108230000Z" "201104060000Z" "201102270000Z" "200811180000Z" "200810150000Z" �"Modified IEEE8021BridgePortType textual convention to
          include stationFacingBridgePort, 
          uplinkAccessPort, and uplinkRelayPort types." y"Modified textual conventions  to support the IEEE 802.1
          MIBs for PBB-TE Infrastructure Protection Switching." Y"Modified textual conventions  to support Remote Customer
          Service Interfaces." b"Minor edits to contact information etc. as part of 
          2011 revision of IEEE Std 802.1Q." �"Added textual conventions needed to support the IEEE 802.1
          MIBs for PBB-TE.  Additionally, some textual conventions were
          modified for the same reason." "Initial version."       -- February 15, 2012
          