                                                                      �"The Bridge MIB module for managing devices that support
        IEEE 802.1D.  This MIB module is derived from the IETF
        BRIDGE-MIB, RFC 4188.

        Unless otherwise indicated, the references in this MIB
        module are to IEEE Std 802.1Q-2011.

        Copyright (C) IEEE.
        This version of this MIB module is part of IEEE802.1Q;
        see the draft itself for full legal notices."�"  WG-URL: http://grouper.ieee.org/groups/802/1/index.html
         WG-EMail: stds-802-1@ieee.org

          Contact: David Levi
           Postal: C/O IEEE 802.1 Working Group
                   IEEE Standards Association
                   445 Hoes Lane
                   P.O. Box 1331
                   Piscataway
                   NJ 08855-1331
                   USA
           E-mail: STDS-802-1-L@LISTSERV.IEEE.ORG" "201208100000Z" "201202150000Z" "201104060000Z" "201102270000Z" "200810150000Z" �"Added an enumeration for tComponent in
                  ieee8021BridgeBaseComponentType
                  as part of IEEE Std 802.1Q Cor-2."�"Extended ieee8021BridgeBaseComponentType to 
                  include erComponent and 
                  ieee8021BridgeBasePortTypeCapabilities to include
                  stationFacingBridgePort, uplinkAccessPort and 
                  uplinkRelayPort.
                  Added tables ieee8021BridgeBaseIfToPortTable and
                  ieee8021BridgePortTable
                  as part of IEEE Std 802.1Qbg." I"Modifications to support Remote Customer Service
          Interfaces." b"Minor edits to contact information etc. as part of 
          2011 revision of IEEE Std 802.1Q." *"Initial revision, derived from RFC 4188."       -- August 10, 2012
                   �"A table that contains generic information about every
        bridge component.  All writable objects in this table
        MUST be persistent over power up restart/reboot." "12.4.1"                     N"A list of objects containing information for each bridge
        component."                       �"The component identifier is used to distinguish between the
        multiple virtual bridge instances within a PBB.  In simple
        situations where there is only a single component the default
        value is 1."                      �"The MAC address used by this bridge when it is
        referred to in a unique fashion.  It is recommended
        that this be the numerically smallest MAC address of
        all ports that belong to this bridge.  However, it is
        only required to be unique.  When concatenated with
        ieee8021SpanningTreePriority, a unique BridgeIdentifier
        is formed, which is used in the Spanning Tree Protocol.

        This object may not be modified while the corresponding
        instance of ieee8021BridgeBaseRowStatus is active(1).

        The value of this object MUST be retained across
        reinitializations of the management system." "12.4.1.1.3 a)"                     B"The number of ports controlled by this bridging
        entity." "12.4.1.1.3 c)"                    �"Indicates the component type(s) of this bridge.  The
        following component types are possible:

            iComponent(1) - An S-VLAN component of a Backbone
                Edge Bridge which performs encapsulation of customer
                frames.

            bComponent(2) - An S-VLAN component of a Backbone
                Edge Bridge which bundles backbone service instances
                into B-VLANs.

            cVlanComponent(3) - A C-VLAN component of an
                enterprise VLAN bridge or of a Provider Bridge used
                to process C-tagged frames.

            sVlanComponent(4) - An S-VLAN component of a
                Provider Bridge.

            dBridgeComponent(5) - A VLAN unaware component of an
                802.1D bridge.
            
            erComponent (6) - An Edge Relay component of an EVB Station.

            tComponent (7) - A TPMR component in a Backbone Edge Bridge.

        This object may not be modified while the corresponding
        instance of ieee8021BridgeBaseRowStatus is active(1).

        The value of this object MUST be retained across
        reinitializations of the management system." 	"12.3 m)"                    �"Indicates the optional parts of IEEE 802.1D and 802.1Q
        that are implemented by this device and are manageable
        through this MIB.  Capabilities that are allowed on a
        per-port basis are indicated in
        ieee8021BridgeBasePortCapabilities.

        dot1dExtendedFilteringServices(0),
                              -- can perform filtering of
                              -- individual multicast addresses
                              -- controlled by MMRP.
        dot1dTrafficClasses(1),
                              -- can map user priority to
                              -- multiple traffic classes.
        dot1qStaticEntryIndividualPort(2),
                              -- dot1qStaticUnicastReceivePort &
                              -- dot1qStaticMulticastReceivePort
                              -- can represent non-zero entries.
        dot1qIVLCapable(3),   -- Independent VLAN Learning (IVL).
        dot1qSVLCapable(4),   -- Shared VLAN Learning (SVL).
        dot1qHybridCapable(5),
                              -- both IVL & SVL simultaneously.
        dot1qConfigurablePvidTagging(6),
                              -- whether the implementation
                              -- supports the ability to
                              -- override the default PVID
                              -- setting and its egress status
                              -- (VLAN-Tagged or Untagged) on
                              -- each port.
        dot1dLocalVlanCapable(7)
                              -- can support multiple local
                              -- bridges, outside of the scope
                              -- of 802.1Q defined VLANs.

        This object may not be modified while the corresponding
        instance of ieee8021BridgeBaseRowStatus is active(1).

        The value of this object MUST be retained across
        reinitializations of the management system." "12.10.1.1.3 b)"                    �"The value true(1) indicates that Traffic Classes are
        enabled on this bridge.  When false(2), the bridge
        operates with a single priority level for all traffic.

        This object may be modified while the corresponding
        instance of ieee8021BridgeBaseRowStatus is active(1).

        The value of this object MUST be retained across
        reinitializations of the management system."                      ."The administrative status requested by management for
        MMRP.  The value true(1) indicates that MMRP should
        be enabled on this device, in all VLANs, on all ports
        for which it has not been specifically disabled.  When
        false(2), MMRP is disabled, in all VLANs and on all
        ports, and all MMRP packets will be forwarded
        transparently.  This object affects both Applicant and
        Registrar state machines.  A transition from false(2)
        to true(1) will cause a reset of all MMRP state
        machines on all ports.

        This object may be modified while the corresponding
        instance of ieee8021BridgeBaseRowStatus is active(1).

        The value of this object MUST be retained across
        reinitializations of the management system."                      "The object indicates the status of an entry, and is used
        to create/delete entries.

        The following objects MUST be set prior to making a new
        entry active:
            ieee8021BridgeBaseBridgeAddress
            ieee8021BridgeBaseComponentType
            ieee8021BridgeBaseDeviceCapabilities
        It is recommended that these three objects not be allowed
        to be modified while the corresponding instance of
        ieee8021BridgeBaseRowStatus object is active(1).

        The following objects are not required to be set before
        making a new entry active (they will take their defaults),
        and they also may be modified while the corresponding
        instance of this object is active(1):
            ieee8021BridgeBaseTrafficClassesEnabled
            ieee8021BridgeBaseMmrpEnabledStatus

        The value of this object and all corresponding instances
        of other objects in this table MUST be retained across
        reinitializations of the management system."                       �"A table that contains generic information about every
        port that is associated with this bridge.  Transparent,
        and source-route ports are included." "12.4.2"                     Q"A list of objects containing information for each port
         of the bridge."                       �"The component identifier is used to distinguish between the
        multiple virtual bridge instances within a PBB.  In simple
        situations where there is only a single component the default
        value is 1."                       c"The port number of the port for which this entry
        contains bridge management information." "12.4.2.1.2 a)"                    "The value of the instance of the IfIndex object,
         defined in the IF-MIB, for the interface corresponding
         to this port, or the value 0 if the port has not been
         bound to an underlying frame source and sink.

         It is an implementation specific decision as to whether this object
         may be modified if it has been created or if 0 is a legal value.

         The underlying IfEntry indexed by this column MUST be persistent
         across reinitializations of the management system."                      �"The number of frames discarded by this port due
        to excessive transit delay through the bridge.  It
        is incremented by both transparent and source
        route bridges.

        Discontinuities in the value of the counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any)." "12.6.1.1.3 f)"                    �"The number of frames discarded by this port due
        to an excessive size.  It is incremented by both
        transparent and source route bridges.

        Discontinuities in the value of the counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any)." "12.6.1.1.3 g)"                    *"Indicates the parts of IEEE 802.1D and 802.1Q that are
        optional on a per-port basis, that are implemented by
        this device, and that are manageable through this MIB.

        dot1qDot1qTagging(0), -- supports 802.1Q VLAN tagging of
                              -- frames and MVRP.
        dot1qConfigurableAcceptableFrameTypes(1),
                              -- allows modified values of
                              -- dot1qPortAcceptableFrameTypes.
        dot1qIngressFiltering(2)
                              -- supports the discarding of any
                              -- frame received on a Port whose
                              -- VLAN classification does not
                              -- include that Port in its Member
                              -- set." "12.10.1.1.3 c)"                    �"Indicates the capabilities of this port.  The corresponding
         instance of ieee8021BridgeBasePortType can potentially take
         any of the values for which the corresponding bit in this
         object is 1.  The possible port types are as follows:

             customerVlanPort(0) - Indicates the port can be a C-tag
                 aware port of an enterprise VLAN aware bridge.

             providerNetworkPort(1) - Indicates the port can be an
                 S-tag aware port of a Provider Bridge or Backbone
                 Edge Bridge used for connections within a PBN or
                 PBBN.

             customerNetworkPort(2) - Indicates the port can be an
                 S-tag aware port of a Provider Bridge or Backbone
                 Edge Bridge used for connections to the exterior of
                 a PBN or PBBN.

             customerEdgePort(3) - Indicates the port can be a C-tag
                 aware port of a Provider Bridge used for connections
                 to the exterior of a PBN or PBBN.

             customerBackbonePort(4) - Indicates the port can be a
                 I-tag aware port of a Backbone Edge Bridge's
                 B-component.

             virtualInstancePort(5) - Indicates the port can be a
                 virtual S-tag aware port within a Backbone Edge
                 Bridge's I-component which is responsible for
                 handling S-tagged traffic for a specific backbone
                 service instance.

             dBridgePort(6) - Indicates the port can be a VLAN-unaware
                 member of an 802.1D bridge.

             remoteCustomerAccessPort(7) - Indicates the port can be an
                 S-tag aware port of a Provider Bridge capable of providing
                 Remote Customer Service Interfaces.
                 
             stationFacingBridgePort(8) - Indicates the station-facing
                 Bridge Port in a EVB Bridge.
                          
             uplinkAccessPort(9)  -  Indicates the uplink access port
                 in an EVB Bridge or EVB station.
             
             uplinkRelayPort (10)  - Indicates the uplink relay port
                 in an EVB station." �"12.16.1.1.3 h4), 12.16.2.1/2,
                 12.13.1.1, 12.13.1.2, 12.15.2.1, 12.15.2.2,
                 12.26.2, 12.26.4.1, 12.26.5.1"                     W"The port type.  This value MUST be persistent over power up
         restart/reboot." �"12.16.1.1.3 h4), 12.16.2.1/2,
                 12.13.1.1, 12.13.1.2, 12.15.2.1, 12.15.2.2, 
                 12.26.2, 12.26.4.1, 12.26.5.1"                     �"A boolean indicating whether the port is external.  A value of
        true(1) means the port is external.  A value of false(2) means
        the port is internal." "12.16.1.1.3 h4)"                    �"For a port running spanning tree, this object represents the 
         administrative point-to-point status of the LAN segment
         attached to this port, using the enumeration values of
         6.4.3.  A value of forceTrue(1) indicates
         that this port should always be treated as if it is
         connected to a point-to-point link.  A value of
         forceFalse(2) indicates that this port should be treated as
         having a shared media connection.  A value of auto(3)
         indicates that this port is considered to have a
         point-to-point link if it is an Aggregator and all of its
         members are aggregatable, or if the MAC entity
         is configured for full duplex operation, either through
         auto-negotiation or by management means.  Manipulating this
         object changes the underlying adminPointToPointMAC.

         For a VIP, the adminPointToPointMAC parameter controls
         the mechanism by which the Default Backbone Destination
         parameter for the VIP is determined.  For a backbone
         service instance that includes only 2 VIPs, the value
         may be set to forceTrue(1) which permits dynamic learning
         of the Default Backbone Destination parameter.  For a
         backbone service instance that includes more than 2 VIPs,
         the value MUST be set to ForceFalse(2) or auto(3).

         When this object is set to forceTrue(1) for a VIP, the
         Default Backbone Destination parameter is modified by
         the subsequent M_UNITDATA.indications as specified in
         6.10.1 (and described in 26.4.1).  Whenever the parameter
         is set to forceFalse(2) or auto(3), the value for the
         Default Backbone Destination parameter is set to the
         Backbone Service Instance Group Address for the VIP-ISID. 

         The value of this object MUST be retained across
         reinitializations of the management system." 3"6.6.3, 6.10, 12.8.2.1.3 o), 12.8.2.3.2 f), 26.4.1"                    9"For a port running spanning tree, this object represents
         the operational point-to-point status of the LAN segment
         attached to this port.  It indicates whether a port is
         considered to have a point-to-point connection.
         If adminPointToPointMAC is set to auto(2), then the value
         of operPointToPointMAC is determined in accordance with the
         specific procedures defined for the MAC entity concerned,
         as defined in 6.7.  The value is
         determined dynamically; that is, it is re-evaluated whenever
         the value of adminPointToPointMAC changes, and whenever
         the specific procedures defined for the MAC entity evaluate
         a change in its point-to-point status.

         For a VIP, this object simply reflects the value of the
         corresponding instance of ieee8021BridgeBasePortAdminPointToPoint.
         The value will be true(1) if that object is forceTrue(1), and
         the value will be false(2) if the value of that object is either
         forceFalse(2) or auto(3)." 8"6.6.3, 6.7, 6.10, 12.8.2.1.3 p), 12.8.2.3.2 f), 26.4.1"                     K"A text string of up to 32 characters, of locally determined significance." "12.4.2.1.3 a)"                     m"A table that contains generic information about every
        ifIndex that is associated with this bridge." "17.2.2"                     T"A list of objects containing information for each ifIndex
         of the bridge."                       $"The component ID for this ifIndex."                       "The port for this ifIndex."                       \"A table that contains ISS port number to bridge 
    componentID and port number mapping." "12.5.1"                     h"A list of objects containing mapping for ISS port
    numbers to bridge componentID and port numbers "                       "The ISS port." "12.26"                    {"The value of the instance of the IfIndex object,
        defined in the IF-MIB, for the interface corresponding
        to this port, or the value 0 if the port has not been
        bound to an underlying frame source and sink.

        The underlying IfEntry indexed by this column MUST 
        be persistent across reinitializations of the 
        management system."                       "The MAC address"                       1"The component ID that this ISS port belongs to."                       1"The port number to which this ISS port maps to."                           n"A table that contains information about every port that
        is associated with this transparent bridge." "12.4.2"                     ["A list of objects containing information for each port of
         a transparent bridge."                       �"The component identifier is used to distinguish between the
        multiple virtual bridge instances within a PBB.  In simple
        situations where there is only a single component the default
        value is 1."                       q"The port number of the port for which this entry
        contains Transparent bridging management information."                       `"The maximum size of the INFO (non-MAC) field that
        this port will receive or transmit."                      e"The number of frames that have been received by this
        port from its segment.  Note that a frame received on the
        interface corresponding to this port is only counted by
        this object if and only if it is for a protocol being
        processed by the local bridging function, including
        bridge management frames.

        Discontinuities in the value of the counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any)." "12.6.1.1.3 a)"                    i"The number of frames that have been transmitted by this
        port to its segment.  Note that a frame transmitted on
        the interface corresponding to this port is only counted
        by this object if and only if it is for a protocol being
        processed by the local bridging function, including
        bridge management frames.

        Discontinuities in the value of the counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any)." "12.6.1.1.3 d)"                    u"Count of received valid frames that were discarded
        (i.e., filtered) by the Forwarding Process.

        Discontinuities in the value of the counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any)." "12.6.1.1.3 c)"                         n"A table that contains information about every port that
        is associated with this transparent bridge."                       �"A list of Default User Priorities for each port of a
        transparent bridge.  This is indexed by
        ieee8021BridgeBasePortComponentId and
        ieee8021BridgeBasePort."                      "The default ingress User Priority for this port.  This
        only has effect on media, such as Ethernet, that do not
        support native User Priority.

        The value of this object MUST be retained across
        reinitializations of the management system."                       �"The number of egress traffic classes supported on this
        port.  This object may optionally be read-only.

        The value of this object MUST be retained across
        reinitializations of the management system."                       �" This object identifies the rows in the PCP encoding and
          decoding tables that are used to remark frames on this 
          port if this remarking is enabled." "12.6.2.6, 12.6.2.7"                    #"If the Use_DEI is set to true(1) for the Port then the 
        drop_eligible parameter is encoded in the DEI of transmitted
        frames, and the drop_eligible parameter shall be true(1) for a
        received frame if the DEI is set in the VLAN tag or the Priority
        Code Point Decoding Table indicates drop_eligible True for
        the received PCP value. If the Use_DEI parameter is false(2),
        the DEI shall be transmitted as zero and ignored on receipt.
        The default value of the Use_DEI parameter is false(2)." "12.6.2.12, 12.6.2.13"                    "If a Bridge supports encoding or decoding of drop_eligible
        from the PCP field of a VLAN tag (6.7.3) on any of its Ports,
        then it shall implement a Boolean parameter Require Drop
        Encoding on each of its Ports with default value false(2). If
        Require Drop Encoding is True and the Bridge Port cannot
        encode particular priorities with drop_eligible, then frames
        queued with those priorities and drop_eligible true(1) shall
        be discarded and not transmitted." "12.6.2.14, 12.6.2.15"                     �"Indication of whether the Service Access Priority Selection
        function is supported on the Customer Bridge Port to request
        priority handling of the frame from a Port-based service
        interface." "12.6.2.16, 12.6.2.17"                    �"A list of Regenerated User Priorities for each received
        User Priority on each port of a bridge.  The Regenerated
        User Priority value may be used to index the Traffic
        Class Table for each input port.  This only has effect
        on media that support native User Priority.  The default
        values for Regenerated User Priorities are the same as
        the User Priorities." "6.5"                     N"A mapping of incoming User Priority to a Regenerated
        User Priority."                       6"The User Priority for a frame received on this port."                       �"The Regenerated User Priority that the incoming User
        Priority is mapped to for this port.

        The value of this object MUST be retained across
        reinitializations of the management system."                       �"A table mapping evaluated User Priority to Traffic
        Class, for forwarding by the bridge.  Traffic class is a
        number in the range (0..(ieee8021BridgePortNumTrafficClasses-1))." "Table 8-4"                     )"User Priority to Traffic Class mapping."                      d"The Priority value determined for the received frame.
        This value is equivalent to the priority indicated in
        the tagged frame received, or one of the evaluated
        priorities, determined according to the media-type.
        For untagged frames received from Ethernet media, this
        value is equal to the ieee8021BridgePortDefaultUserPriority value
        for the ingress port.

        For untagged frames received from non-Ethernet media,
        this value is equal to the ieee8021BridgeRegenUserPriority value
        for the ingress port and media-specific user priority."                       �"The Traffic Class the received frame is mapped to.

        The value of this object MUST be retained across
        reinitializations of the management system."                       �"A table mapping Regenerated User Priority to Outbound
        Access Priority.  This is a fixed mapping for all port
        types, with three options for 802.17 RPR." "6.6.1 and 6.7.3"                     I"Regenerated User Priority to Outbound Access Priority
        mapping."                       H"The Outbound Access Priority the received frame is
        mapped to."                      �"A table that contains information about Priority Code
        Point Decoding Table for a Port of a provider bridge.
        Alternative values for each table are specified as rows
        in Table 6-4 (6.7.3), with each alternative labeled by
        the number of distinct priorities that can be communicated,
        and the number of these for which drop precedence can
        be communicated.  All writable objects in this table MUST
        be persistent over power up restart/reboot."                       q"A list of objects containing Priority Code Point Decoding
        information for a port of a provider bridge."                       �"The component identifier is used to distinguish between the
        multiple virtual bridge instances within a PBB.  In simple
        situations where there is only a single component the default
        value is 1."                       Q"A unique identifier of a port controlled by this VLAN
        bridging entity."                       ;"The specific row in Table 6-3 (6.7.3) indicating the PCP."                       ."The specific PCP value in Table 6-3 (6.7.3)."                       3"The specific priority value in Table 6-3 (6.7.3)." "12.6.2.8, 12.6.2.9"                     2"The drop eligibility value in Table 6-3 (6.7.3)." "12.6.2.8, 12.6.2.9"                    �"A table that contains information about Priority Code
        Point Decoding Table for a Port of a provider bridge.
        Alternative values for each table are specified as rows
        in Table 6-3 (6.7.3), with each alternative labeled by
        the number of distinct priorities that can be communicated,
        and the number of these for which drop precedence can be
        communicated.  All writable objects in this table MUST be
        persistent over power up restart/reboot."                       q"A list of objects containing Priority Code Point Encoding
        information for a port of a provider bridge."                       �"The component identifier is used to distinguish between the
        multiple virtual bridge instances within a PBB.  In simple
        situations where there is only a single component the default
        value is 1."                       Q"A unique identifier of a port controlled by this VLAN bridging
        entity."                       f"The specific row in Table 6-3 (6.7.3)indicating the PCP row.
         (i.e. 8P0D, 7P1D, 6P2D, 5P3D)"                       ^"The specific row in Table 6-3 (6.7.3) indicating the PCP.
         (i.e., 0,1,2,3,4,5,6,7)."                       "The specific row in Table 6-3 (6.7.3) indicating the drop
         eligibility.  A value of true(1) means eligible for drop."                       -"The encoding priority in Table 6-3 (6.7.3)." "12.6.2.10, 12.6.2.11"                    �"A table that contains information about the  Service Access
        Priority Selection function for a provider bridge.  The use
        of this table enables a mechanism for a Customer Bridge
        attached to a Provider Bridged Network to request priority
        handling of frames.  All writable objects in this table MUST
        be persistent over power up restart/reboot."                       �"A list of objects containing information about the Service
         Access Priority Selection function for a provider bridge."                       �"The component identifier is used to distinguish between the
        multiple virtual bridge instances within a PBB.  In simple
        situations where there is only a single component the default
        value is 1."                       Q"A unique identifier of a port controlled by this VLAN bridging
        entity."                       ]"The default received priority value in Table 6-3 (6.7.3).
         (i.e., 0,1,2,3,4,5,6,7)"                       X"The regenerated priority value in Table 6-3 (6.7.3).
         (i.e., 0,1,2,3,4,5,6,7)" "12.6.2.18, 12.6.2.19"                         �"A table of MRP control information about every bridge
        port.  This is indexed by ieee8021BridgeBasePortComponentId
        and ieee8021BridgeBasePort."                       ,"MRP control information for a bridge port."                       �"The MRP Join time, in centiseconds.

        The value of this object MUST be retained across
        reinitializations of the management system."                       �"The MRP Leave time, in centiseconds.

        The value of this object MUST be retained across
        reinitializations of the management system."                       �"The MRP LeaveAll time, in centiseconds.

        The value of this object MUST be retained across
        reinitializations of the management system."                           }"A table of MMRP control and status information about
        every bridge port.  Augments the ieee8021BridgeBasePortTable."                       8"MMRP control and status information for a bridge port."                      �"The administrative state of MMRP operation on this port.  The
        value true(1) indicates that MMRP is enabled on this port
        in all VLANs as long as ieee8021BridgeMmrpEnabledStatus is
        also true(1).  A value of false(2) indicates that MMRP is
        disabled on this port in all VLANs: any MMRP packets received
        will be silently discarded, and no MMRP registrations will be
        propagated from other ports.  Setting this to a value of
        true(1) will be stored by the agent but will only take
        effect on the MMRP protocol operation if
        ieee8021BridgeMmrpEnabledStatus
        also indicates the value true(1).  This object affects
        all MMRP Applicant and Registrar state machines on this
        port.  A transition from false(2) to true(1) will
        cause a reset of all MMRP state machines on this port.

        The value of this object MUST be retained across
        reinitializations of the management system."                       e"The total number of failed MMRP registrations, for any
        reason, in all VLANs, on this port."                       Q"The Source MAC Address of the last MMRP message
        received on this port."                      �"The state of Restricted Group Registration on this port.
         If the value of this control is true(1), then creation
         of a new dynamic entry is permitted only if there is a
         Static Filtering Entry for the VLAN concerned, in which
         the Registrar Administrative Control value is Normal
         Registration.

        The value of this object MUST be retained across
        reinitializations of the management system." "11.2.3.2.3, 12.11.1.3"                        2"This table is a sparse augmentation of ifTable and controls
          the creation of the I-LAN Interface.  An I-LAN Interface is
          used to create internal connections between bridge ports in a
          802.1 device.  An I-LAN Interfaces can be directly associated
          with a set of bridge ports.  An I-LAN Interfaces can also be
          used as a stacking interface to relate other interfaces before
          association to bridge ports.

          For example, an I-LAN interface can be created to link traffic
          between a PIP and a CBP.  In this case a CBP is created on the
          B-Component and the CBP's related IfEntry is stacked upon the
          IfEntry of the I-LAN.  The PIP is stacked upon the I-LAN using
          the IfStackTable.  Finally, a VIP is created on the I-Component
          and is associated with the PIP, thus completing the path from
          the I-Component's MAC relay to the CBP on the B-Component.

          Entries in this table MUST be persistent over power up
          restart/reboot." 
"17.3.2.2"                     :"Each entry consists of a Row Status to control creation."                       c"This object is used to create and delete entries in this
         table and the Interface table."                          -"This table provides the capability to dynamically create and
          delete 802.1D bridge ports.  Each entry in this table MUST
          have a corresponding entry in the ieee8021BridgeBasePortTable.

          Entries in this table MUST be persistent over power up
          restart/reboot." "17.5.3"                     :"Each entry consists of a Row Status to control creation."                       o"This object is used to create and delete entries in this
         table and the ieee8021BridgeBasePortTable."                              "The compliance statement for devices supporting bridging
        services as defined in 802.1D-2004.  Such devices support
        path cost values of 32-bits, and bridge and port priority
        values are more restricted than in 802.1D-1995.

        Full support for the 802.1D management objects requires
        implementation of the objects listed in the systemGroup
        from the SNMPv2-MIB [RFC3418], as well as the objects
        listed in the ifGeneralInformationGroup from the
        IF-MIB [RFC2863]."   �"Implementation of this group is mandatory for
         bridges that allow management systems to add and delete
         bridge components.  Provider Backbone Edge Bridges would
         typically fall in this category." �"Implementation of this group is mandatory for
        bridges that support the transparent bridging
        mode.  A transparent bridge will implement
        this group." �"Implementation of this group is optional.  It can be supported
        to provide control over the relationship between interfaces and
        bridge ports where such relationships are more complex than a
        simple 1-to-1 mapping." �"Implementation of this group is optional.  It can be supported
        to provide the ability to dynamically create and deleted 802.1D
        bridge ports." m"A collection of objects providing a map between interface
        index and component ID and bridge ports." n"A colelction of objects providing a map between port numbers
         to the component id, interface index."            "The compliance statement for devices supporting bridging
        services as defined in 802.1D-2004.  Such devices support
        path cost values of 32-bits, and bridge and port priority
        values are more restricted than in 802.1D-1995.

        Full support for the 802.1D management objects requires
        implementation of the objects listed in the systemGroup
        from the SNMPv2-MIB [RFC3418], as well as the objects
        listed in the ifGeneralInformationGroup from the
        IF-MIB [RFC2863]."   �"Implementation of this group is mandatory for
         bridges that allow management systems to add and delete
         bridge components.  Provider Backbone Edge Bridges would
         typically fall in this category." �"Implementation of this group is mandatory for
        bridges that support the transparent bridging
        mode.  A transparent bridge will implement
        this group." �"Implementation of this group is optional.  It can be supported
        to provide control over the relationship between interfaces and
        bridge ports where such relationships are more complex than a
        simple 1-to-1 mapping." �"Implementation of this group is optional.  It can be supported
        to provide the ability to dynamically create and deleted 802.1D
        bridge ports."             v"The compliance statement for device support of Priority
        and Multicast Filtering extended bridging services."   �"This group is mandatory for devices supporting the MMRP
            application, defined by IEEE 802.1D Extended Filtering
            Services." �"This group is mandatory only for devices supporting
            the priority forwarding operations defined by IEEE
            802.1D." �"This group is mandatory only for devices supporting
            the priority forwarding operations defined by the
            extended bridge services with media types, such as
            Ethernet, that do not support native User Priority." �"This group is mandatory only for devices supporting
            the priority forwarding operations defined by IEEE 802.1D
            and that have interface media types that support
            native User Priority, e.g., IEEE 802.17." }"This group is mandatory only for devices supporting
            the priority forwarding operations defined by IEEE 802.1D.""This group is optional and is relevant only for devices
            supporting the priority forwarding operations defined by
            IEEE 802.1D and that have interface media types that
            support native Access Priority, e.g., IEEE 802.17.""This group is mandatory for devices supporting any
            of the MRP applications: e.g., MMRP, defined by the
            extended filtering services of 802.1D; or MVRP,
            defined by 802.1Q (refer to the Q-BRIDGE-MIB for
            conformance statements for MVRP)." �"This group is mandatory for devices supporting the
            MMRP application, as defined by IEEE 802.1D Extended
            Filtering Services." v"This group is optional and supports Priority Code Point
            Decoding Table for a Port of a provider bridge." v"This group is optional and supports Priority Code Point
            Encoding Table for a Port of a provider bridge." v"This group is optional and supports Priority Code Point
            Encoding Table for a Port of a provider bridge." "Write access is not required." "Write access is not required." "Write access is not required."                 +"Bridge level information for this device."                 +"Information for each port on this device."                 V"A collection of objects indicating the optional
        capabilities of the device."                 w"A collection of objects providing device-level control
        for the Multicast Filtering extended bridge services."                 N"Dynamic Filtering Database information for each port of
        the Bridge."                 \"A collection of objects providing device-level control
        for the Priority services."                 �"A collection of objects defining the User Priority
        applicable to each port for media that do not support
        native User Priority."                 �"A collection of objects defining the User Priorities
        applicable to each port for media that support native
        User Priority."                 q"A collection of objects defining the traffic classes
        within a bridge for each evaluated User Priority."                 h"A collection of objects defining the media-dependent
        outbound access level for each priority."                 i"A collection of objects providing port level control
        and status information for MRP operation."                 j"A collection of objects providing port level control
        and status information for MMRP operation."                 }"A collection of objects providing statistics counters for
        decoding priority and drop eligibility for bridge ports."                 }"A collection of objects providing statistics counters for
        encoding priority and drop eligibility for bridge ports."                 ]"A collection of objects providing statistics
        counters for service access priority."                 S"A collection of objects providing control of internal
        LAN configuration."                 Q"Controls the managment system directed creation of
         Bridge Components."                 b"A collection of objects providing dynamic creation and
        deletion of 802.1D bridge ports."                 m"A collection of objects providing a map between interface
        index and component ID and bridge ports."                 L"The collection of objects used to represent a ISS port management objects."                                