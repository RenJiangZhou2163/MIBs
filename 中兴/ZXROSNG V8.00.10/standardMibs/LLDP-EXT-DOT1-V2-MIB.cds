     P"Indicates a traffic class.  Values 0-7 correspond to
        traffic classes."               �"Indicates the Traffic Selection Algorithm
        0: Strict Priority
        1: Credit-based shaper
        2: Enhanced transmission selection
        3-254: Reserved for furture standardization
        255: Vendor specific"             "12.13.3.3"  "An 802.1Q user priority value."               �"Contains the application protocol indicator the
         type of which is specified by an object with 
         the syntax of
         LldpXdot1dcbxAppSelector"               �"Indicates the supported capacity of a given feature,
        for example, the number of traffic classes supported.
        This TC is used for features that have a maximum
        capacity of eight and a minimum of one."               K"Indicates the bandwidth in percent assigned to a 
        traffic class."               �"Indicates the contents of a protocol object
        1: Ethertype
        2: Well Known Port number over TCP, or SCTP
        3: Well Known Port number over UDP, or DCCP
        4: Well Known Port number over TCP, SCTP, UDP, and DCCP"               �"This TC describes the link aggregation status.

            The bit 'aggCapable(0)' indicates the link is capable of being
            aggregated. 

            The bit 'aggEnabled(1)' indicates the link is currently in
            aggregation."              @"This TC describes a bit vector used in the Congestion
            Notification objects. Each bit represents a Boolean status
            associated with a priority code point. A bit value of 0
            represents FALSE, 1 represents TRUE.

            The bit 'pri0status(0)' indicates the status for priority 0
            The bit 'pri1status(1)' indicates the status for priority 1
            The bit 'pri2status(2)' indicates the status for priority 2
            The bit 'pri3status(3)' indicates the status for priority 3
            The bit 'pri4status(4)' indicates the status for priority 4
            The bit 'pri5status(5)' indicates the status for priority 5
            The bit 'pri6status(6)' indicates the status for priority 6
            The bit 'pri7status(7)' indicates the status for priority 7"                                h"The LLDP Management Information Base extension module for
            IEEE 802.1 organizationally defined discovery information.

            In order to assure the uniqueness of the LLDP-V2-MIB,
            lldpV2Xdot1MIB is branched from lldpV2Extensions using an 
            Organizationally Unique Identifier (OUI) value as the node.
            An OUI is a 24 bit globally unique number assigned by the 
            IEEE Registration Authority - see:
            
            http://standards.ieee.org/develop/regauth/oui/index.html

            Unless otherwise indicated, the references in this
            MIB module are to IEEE Std 802.1Q-2011.

            Copyright (C) IEEE (2011).  This version of this MIB module
            is published as Annex D.4.5 of IEEE Std 802.1Qaz-2011;
            see the standard itself for full legal notices."�"WG-URL: http://grouper.ieee.org/groups/802/1/index.html
            WG-EMail: STDS-802-1-L@LISTSERV.IEEE.ORG

          Contact: Tony Jeffree
           Postal: C/O IEEE 802.1 Working Group
                   IEEE Standards Association
                   445 Hoes Lane
                   P.O. Box 1331
                   Piscataway
                   NJ 08855-1331
                   USA
           E-mail: STDS-802-1-L@LISTSERV.IEEE.ORG" "201103250000Z" "201103230000Z" "200906080000Z" c"Published as part of IEEE Std 802.1Qaz-2011. Adds the DCBX
            objects to the MIB module""Published as part of IEEE Std 802.1Q-2011 revision.
            This revision contains changes associated with
            relocating the extension MIB from IEEE Std 802.1AB to
            IEEE Std 802.1Q, minor tweaks to the text of the
            DESCRIPTION statement above to fix references to
            IEEE Std 802.1Q, updating of references to refer to
            Annex D, and addition of object definitions for
            Congestion Notification TLVs and corresponding
            compliance statements." "Published as part of IEEE Std 802.1AB-2009 revision.
            This revision incorporated changes to the MIB to
            support the use of LLDP with multiple destination MAC
            addresses, and to import the Link Aggregation TLV
            from the 802.3 extension MIB"       -- March 25, 2011 
     ,-- OUI for IEEE 802.1 is 32962 (00-80-C2) 
         o"A table that controls selection of LLDP Port VLAN-ID TLVs
            to be transmitted on individual ports."                      �"LLDP configuration information that controls the
            transmission of IEEE 802.1 organizationally defined Port
            VLAN-ID TLV on LLDP transmission capable ports.

            This configuration object augments the 
            lldpV2PortConfigEntry of the LLDP-MIB, therefore it is only
            present along with the port configuration defined by the 
            associated lldpV2PortConfigEntry entry.

            Each active lldpConfigEntry is restored from non-volatile
            storage (along with the corresponding 
            lldpV2PortConfigEntry) after a re-initialization of the
            management system."                      �"The lldpV2Xdot1ConfigPortVlanTxEnable, which is defined 
            as a truth value and configured by the network management,
            determines whether the IEEE 802.1 organizationally defined
            port VLAN TLV transmission is allowed on a given LLDP
            transmission capable port.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." "9.1.2.1 of IEEE Std 802.1AB"                     w"The table that controls selection of LLDP VLAN name TLV
            instances to be transmitted on individual ports."                      �"LLDP configuration information that specifies the set of
            ports (represented as a PortList) on which the Local System
            VLAN name instance is transmitted.

            This configuration object augments the lldpV2LocVlanEntry,
            therefore it is only present along with the VLAN Name 
            instance contained in the associated lldpV2LocVlanNameEntry
            entry.

            Each active lldpV2Xdot1ConfigVlanNameEntry is restored
            from non-volatile storage (along with the corresponding
            lldpV2Xdot1LocVlanNameEntry) after a re-initialization of 
            the management system."                      `"The boolean value that indicates whether the corresponding
            Local System VLAN name instance is transmitted on the
            port defined by the given lldpV2Xdot1LocVlanNameEntry.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management 
            system." "9.1.2.1 of IEEE Std 802.1AB"                     �"The table that controls selection of LLDP Port and 
            Protocol VLAN ID TLV instances to be transmitted on 
            individual ports."                      �"LLDP configuration information that specifies the set of
            ports (represented as a PortList) on which the Local System
            Protocol VLAN instance is transmitted.

            This configuration object augments the 
            lldpV2Xdot1LocVlanEntry, therefore it is only present along 
            with the Port and Protocol VLAN ID instance contained in 
            the associated lldpV2Xdot1LocVlanEntry entry.

            Each active lldpV2Xdot1ConfigProtoVlanEntry is restored
            from non-volatile storage (along with the corresponding
            lldpV2Xdot1LocProtoVlanEntry) after a re-initialization of
            the management system."                      m"The boolean value that indicates whether the corresponding
            Local System Port and Protocol VLAN instance is
            transmitted on the port defined by the given
            lldpV2Xdot1LocProtoVlanEntry.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." "9.1.2.1 of IEEE Std 802.1AB"                     w"The table that controls selection of LLDP Protocol 
            TLV instances to be transmitted on individual ports."                      �"LLDP configuration information that specifies the set of
            ports (represented as a PortList) on which the Local System
            Protocol instance is transmitted.

            This configuration object augments the 
            lldpV2Xdot1LocProtoEntry, therefore it is only present 
            along with the Protocol instance contained in the 
            associated lldpV2Xdot1LocProtoEntry entry.

            Each active lldpV2Xdot1ConfigProtocolEntry is restored
            from non-volatile storage (along with the corresponding
            lldpV2Xdot1LocProtocolEntry) after a re-initialization of 
            the management system."                      v"The boolean value that indicates whether the corresponding
            Local System Protocol Identity instance is transmitted
            on the port defined by the given 
            lldpV2Xdot1LocProtocolEntry.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management 
            system." "9.1.2.1 of IEEE Std 802.1AB"                     q"A table that controls selection of LLDP VID Usage Digest
          TLVs to be transmitted on individual ports."                      �"LLDP configuration information that specifies the set of 
          ports (represented as a PortList) on which the local 
          system VID Usage Digest instance will be transmitted.
          This configuration object augments the 
          lldpLocVidUsageDigestEntry, therefore it is only present
          along with the VID Usage Digest instance 
          contained in the associated lldpV2Xdot1LocVidUsageDigestEntry
          entry. Each active lldpConfigVidUsageDigestEntry must be 
          restored from non-volatile storage and re-created (along with
          the corresponding lldpV2Xdot1LocVidUsageDigestEntry) after
          a re-initialization of the management system."                      n"The boolean value that indicates whether the corresponding 
          Local System VID Usage Digest instance will be transmitted 
          on the port defined by the given 
          lldpV2Xdot1LocVidUsageDigestEntry. The value of this object 
          must be restored from non-volatile storage after a 
          reinitialization of the management system." "9.1.2.1 of IEEE Std 802.1AB"                     p"A table that controls selection of LLDP Management VID 
          TLVs to be transmitted on individual ports."                      �"LLDP configuration information that specifies the set of
          port/destination address pairs on which the Local
          System Management VID will be transmitted.
          This configuration object augments the 
          lldpV2Xdot1LocManVidEntry, therefore it is
          only present along with the Management VID contained
          in the associated lldpV2Xdot1LocManVidEntry entry. 
          Each active lldpV2Xdot1ConfigManVidEntry must be
          restored from non-volatile storage (along with the
          corresponding lldpV2Xdot1LocManVidEntry) after a 
          re-initialization of the management system."                      �"The lldpV2Xdot1ConfigManVidTxEnable, which is defined as a 
          truth value and configured by the network management, 
          determines whether the IEEE 802.1 organizationally 
          defined Management VID TLV transmission is allowed on a given
          LLDP transmission capable port. 
          The value of this object must be restored from
          non-volatile storage after a re-initialization of the 
          management system." "9.1.2.1 of IEEE Std 802.1AB"                         �"This table contains one row per port for IEEE 802.1
            organizationally defined LLDP extension on the local system
            known to this agent."                       T"Information about IEEE 802.1 organizationally defined
            LLDP extension."                      "The integer value used to identify the port's VLAN 
            identifier associated with the local system.   A value 
            of zero shall be used if the system either does not know
            the PVID or does
            not support port-based VLAN operation." 	"D.2.1.1"                     r"This table contains one or more rows per Port and Protocol
            VLAN information about the local system."                       �"Port and protocol VLAN ID Information about a particular
            port component.  There may be multiple port and protocol
            VLANs, identified by a particular 
            lldpV2Xdot1LocProtoVlanId, configured on the given port."                      J"The integer value used to identify the port and protocol
            VLANs associated with the given port associated with the
            local system.  A value of zero shall be used if the system
            either does not know the protocol VLAN ID (PPVID) or does
            not support port and protocol VLAN operation." 	"D.2.2.2"                     �"The truth value used to indicate whether the given port
            (associated with the local system) supports port and 
            protocol VLANs." 	"D.2.2.1"                     �"The truth value used to indicate whether the port and
            protocol VLANs are enabled on the given port associated
            with the local system." 	"D.2.2.1"                     �"This table contains one or more rows per IEEE 802.1Q VLAN
            name information on the local system known to this agent."                       �"VLAN name Information about a particular port component.
            There may be multiple VLANs, identified by a particular
            lldpV2Xdot1LocVlanId, configured on the given port."                       t"The integer value used to identify the IEEE 802.1Q 
            VLAN IDs with which the given port is compatible." 	"D.2.3.2"                    S"The string value used to identify VLAN name identified
            by the Vlan Id associated with the given port on the 
            local system.

            This object should contain the value of the 
            dot1QVLANStaticName object (defined in IETF RFC 4363) 
            identified with the given lldpV2Xdot1LocVlanId." 	"D.2.3.4"                     ~"This table contains one or more rows per protocol identity
            information on the local system known to this agent." "D.2.4"                     �"Information about particular protocols that are accessible
            through the given port component.

            There may be multiple protocols, identified by particular
            lldpV2Xdot1ProtocolIndex, lldpV2LocPortIfIndex" "D.2.4"                     �"This object represents an arbitrary local integer value 
            used by this agent to identify a particular protocol 
            identity."                       x"The octet string value used to identify the protocols
            associated with the given port of the local system." 	"D.2.4.3"                     �"This table contains one row per ifIndex/
            destination MAC address pair for usage digest
            information on the local system known to this agent." "D.2.5"                     Q"Usage digest information to be transmitted
            through the given port." "D.2.5"                    �"The integer value obtained by applying the CRC32 function 
        to the 128-octet VID Usage Table. A bit of the VID Usage 
        Table contains the value PBB-TE-USAGE (binary 1) if the 
        corresponding element of the MST Configuration Table 
        (IEEE Std 802.1Q 8.9.1) contains the value PBB-TE MSTID 
        (hex FFE) and otherwise contains the value NON-PBB-TE-USAGE 
        (binary 0)." 	"D.2.5.1"                     �"This table contains one row per ifIndex/
            destination MAC address pair for usage digest
            information on the local system known to this agent." "D.2.6"                     Q"Usage digest information to be transmitted
            through the given port." "D.2.6"                     �"The integer value configured on the Local system for 
        the Management VID, or
        the value 0 if a Management VID has not been provisioned." 	"D.2.6.1"                     �"This table contains one row per port of link aggregation 
            information (as a part of the LLDP 802.1 organizational
            extension) on the local system known to this agent."                       N"Link Aggregation information about a particular port
            component."                       �"The bitmap value contains the link aggregation 
            capabilities and the current aggregation status of the
            link." 	"D.2.7.1"                    �"This object contains the IEEE 802.1 aggregated port
            identifier, aAggPortID (IEEE Std 802.1AX, 6.3.2.1.1),
            derived from the ifNumber of the  ifIndex for the port
            component in link aggregation.

            If the port is not in link aggregation state and/or it
            does not support link aggregation, this value should be set
            to zero." 	"D.2.7.1"                        D"This table contains one or more rows per physical network
            connection known to this agent.  The agent may wish to
            ensure that only one lldpV2Xdot1RemEntry is present for
            each local port, or it may choose to maintain multiple
            lldpV2Xdot1RemEntries for the same local port."                       0"Information about a particular port component."                      3"The integer value used to identify the port's VLAN 
            identifier associated with the remote system.  if the 
            remote system either does not know the PVID or does not 
            support port-based VLAN operation, the value of 
            lldpV2Xdot1RemPortVlanId should be zero." 	"D.2.1.1"                     �"This table contains one or more rows per Port and Protocol
            VLAN information about the remote system, received on the
            given port."                       �"Port and protocol VLAN name Information about a particular
            port component.  There may be multiple protocol VLANs,
            identified by a particular lldpV2Xdot1RemProtoVlanId, 
            configured on the remote system."                      �"The integer value used to identify the port and protocol
            VLANs associated with the given port associated with the
            remote system.

            If port and protocol VLANs are not supported on the given
            port associated with the remote system, or if the port is
            not enabled with any port and protocol VLAN, the value of
            lldpV2Xdot1RemProtoVlanId should be zero." 	"D.2.2.2"                     �"The truth value used to indicate whether the given port
            (associated with the remote system) is capable of 
            supporting port and protocol VLANs." 	"D.2.2.1"                     �"The truth value used to indicate whether the port and
            protocol VLANs are enabled on the given port associated 
            with
            the remote system." 	"D.2.2.1"                     �"This table contains one or more rows per IEEE 802.1Q VLAN
            name information about the remote system, received on the
            given port." "D.2.3"                     �"VLAN name Information about a particular port component.
            There may be multiple VLANs, identified by a particular
            lldpV2Xdot1RemVlanId, received on the given port."                       �"The integer value used to identify the IEEE 802.1Q 
            VLAN IDs with which the given port of the remote system
            is compatible." 	"D.2.3.2"                     w"The string value used to identify VLAN name identified
            by the VLAN Id associated with the remote system." 	"D.2.3.4"                     �"This table contains one or more rows per protocol 
            information about the remote system, received on 
            the given port."                       �"Protocol information about a particular port component.
            There may be multiple protocols, identified by a particular
            lldpV2Xdot1ProtocolIndex, received on the given port."                       �"This object represents an arbitrary local integer value
            used by this agent to identify a particular protocol 
            identity."                       u"The octet string value used to identify the protocols
            associated with the given port of remote system." 	"D.2.4.3"                     �"This table contains one row per ifIndex/
            destination MAC address pair for usage digest
            information received by the local system." "D.2.5"                     \"Usage digest information received on
            the given port/destination address pair." "D.2.5"                    �"The integer value obtained by applying the CRC32 function 
        to the 128-octet VID Usage Table. A bit of the VID Usage 
        Table contains the value PBB-TE-USAGE (binary 1) if the 
        corresponding element of the MST Configuration Table 
        (IEEE Std 802.1Q 8.9.1) contains the value PBB-TE MSTID
        (hex FFE)and otherwise contains the value NON-PBB-TE-USAGE
        (binary 0)." 	"D.2.5.1"                     �"This table contains one row per ifIndex/
            destination MAC address pair for management VID
            information received from remote systems." "D.2.6"                     c"Management VID information received
            through the given port/destination address pair." "D.2.6"                     �"The integer value configured on a system for 
        the Management VID, or
        the value 0 if a Management VID has not been provisioned." 	"D.2.6.1"                     �"This table contains port link aggregation information
            (as a part of the LLDP IEEE 802.1 organizational extension)
            of the remote system."                       Q"Link Aggregation information about remote system's port
            component."                       z"The bitmap value contains the link aggregation capabilities
            and the current aggregation status of the link." 	"D.2.7.1"                    �"This object contains the IEEE 802.1 aggregated port
            identifier, aAggPortID (IEEE Std 802.1AX, 6.3.2.1.1),
            derived from the ifNumber of the  ifIndex for the port
            component associated with the remote system.

            If the remote port is not in link aggregation state and/or
            it does not support link aggregation, this value should be
            zero." 	"D.2.7.1"                            �"A compliance statement for SNMP entities that implement
            the IEEE 802.1 organizationally defined LLDP extension MIB.

            This group is mandatory for all agents that implement the 
            LLDP 802.1 organizational extension in TX and/or RX mode
            for the basicSet TLV set.

            This version defines compliance requirements for
            V2 of the LLDP MIB."              �"A compliance statement for SNMP entities that implement
            the IEEE 802.1 organizationally defined LLDP extension MIB.

            This group is mandatory for agents that implement the 
            LLDP 802.1 organizational extension in the RX mode
            for the basicSet TLV set.

            This version defines compliance requirements for
            V2 of the LLDP MIB."              �"A compliance statement for SNMP entities that implement
            the IEEE 802.1 organizationally defined LLDP extension MIB.

            This group is mandatory for agents that implement the 
            LLDP 802.1 organizational extension in the RX mode
            for the basicSet TLV set.

            This version defines compliance requirements for
            V2 of the LLDP MIB."                   �"The collection of objects which are used to configure the
            IEEE 802.1 organizationally defined LLDP extension
            implementation behavior for the basicSet TLV set."                 �"The collection of objects which are used to represent 
            IEEE 802.1 organizationally defined LLDP extension 
            associated with the Local Device Information for the 
            basicSet TLV set."                 �"The collection of objects which are used to represent LLDP
            802.1 organizational extension Remote Device Information
            for the basicSet TLV set."                             r"A table that controls selection of Congestion Notification
         TLVs to be transmitted on individual ports."                      k"LLDP configuration information that controls the
        transmission of IEEE 802.1 organizationally defined 
        Congestion Notification TLV on LLDP transmission capable ports.

        This configuration object augments the lldpV2PortConfigEntry of
        the LLDP-MIB, therefore it is only present along with the port
        configuration defined by the associated lldpV2PortConfigEntry
        entry.

        Each active lldpConfigEntry is restored from non-volatile
        storage (along with the corresponding lldpV2PortConfigEntry)
        after a re-initialization of the management system."                      �"The lldpXdot1CnConfigCnTxEnable, which is
        defined as a truth value and configured by the network 
        management, determines whether the IEEE 802.1 organizationally
        defined Congestion Notification TLV transmission is allowed 
        on a given LLDP transmission capable port.

        The value of this object is restored from non-volatile
        storage after a re-initialization of the management system." "D.2.8"                         �"This table contains one row per port of Congestion
            Notification information (as a part of the LLDP 
            802.1 organizational extension) on the local system
            known to this agent."                       V"Congestion Notification information about a 
            particular port component."                       E"This object contains the CNPV indicators
            for the Port." 	"D.2.8.3"                     F"This object contains the Ready indicators
            for the Port." 	"D.2.8.4"                         �"This table contains Congestion Notification information
            (as a part of the LLDP IEEE 802.1 organizational extension)
            of the remote system."                       N"Port Extension information about remote systems port
            component."                       E"This object contains the CNPV indicators
            for the Port." 	"D.2.8.3"                     F"This object contains the Ready indicators
            for the Port." 	"D.2.8.4"                            "A compliance statement for SNMP entities that implement
         the IEEE 802.1 organizationally defined Congestion
         Notification LLDP extension MIB.

         This group is mandatory for agents that implement the 
         Congestion Notification cnSet TLV set."                   \"The collection of objects that support the
        Congestion Notification cnSet TLV set."                             l"A table that controls selection of ETS Configuration
         TLVs to be transmitted on individual ports."                      e"LLDP configuration information that controls the
        transmission of IEEE 802.1 organizationally defined 
        ETS Configuration TLV on LLDP transmission capable ports.

        This configuration object augments the lldpV2PortConfigEntry of
        the LLDP-MIB, therefore it is only present along with the port
        configuration defined by the associated lldpV2PortConfigEntry
        entry.

        Each active lldpConfigEntry is restored from non-volatile
        storage (along with the corresponding lldpV2PortConfigEntry)
        after a re-initialization of the management system."                      �"The lldpXdot1dcbxConfigETSConfigurationTxEnable, which is
        defined as a truth value and configured by the network 
        management, determines whether the IEEE 802.1 organizationally
        defined ETS Configuration TLV transmission is allowed on a 
        given LLDP transmission capable port.

        The value of this object is restored from non-volatile
        storage after a re-initialization of the management system." "D.2.9"                     l"A table that controls selection of ETS Recommendation
        TLVs to be transmitted on individual ports."                      f"LLDP configuration information that controls the
        transmission of IEEE 802.1 organizationally defined 
        ETS Recommendation TLV on LLDP transmission capable ports.

        This configuration object augments the lldpV2PortConfigEntry of
        the LLDP-MIB, therefore it is only present along with the port
        configuration defined by the associated lldpV2PortConfigEntry
        entry.

        Each active lldpConfigEntry is restored from non-volatile
        storage (along with the corresponding lldpV2PortConfigEntry)
        after a re-initialization of the management system."                      �"The lldpXdot1dcbxConfigETSRecommendationTxEnable, which is
        defined as a truth value and configured by the network 
        management, determines whether the IEEE 802.1 organizationally 
        defined ETS Recommendation TLV transmission is allowed on a 
        given LLDP transmission capable port.

        The value of this object is restored from non-volatile
        storage after a re-initialization of the management system." "D.2.10"                     u"A table that controls selection of Priority-based
        Flow Control TLVs to be transmitted on individual ports."                      x"LLDP configuration information that controls the
        transmission of IEEE 802.1 organizationally defined 
        Priority-based Flow Control TLV on LLDP transmission
        capable ports.

        This configuration object augments the lldpV2PortConfigEntry of
        the LLDP-MIB, therefore it is only present along with the port
        configuration defined by the associated lldpV2PortConfigEntry
        entry.

        Each active lldpConfigEntry is restored from non-volatile
        storage (along with the corresponding lldpV2PortConfigEntry)
        after a re-initialization of the management system."                      �"The lldpXdot1dcbxConfigPFCTxEnable, which is defined
        as a truth value and configured by the network management,
        determines whether the IEEE 802.1 organizationally defined
        Priority-based Flow Control TLV transmission is allowed on
        a given LLDP transmission capable port.

        The value of this object is restored from non-volatile
        storage after a re-initialization of the management system." "D.2.11"                     u"A table that controls selection of Priority-based
        Flow Control TLVs to be transmitted on individual ports."                      h"LLDP configuration information that controls the
        transmission of IEEE 802.1 organizationally defined 
        Application Priority TLV on LLDP transmission capable ports.

        This configuration object augments the lldpV2PortConfigEntry of
        the LLDP-MIB, therefore it is only present along with the port
        configuration defined by the associated lldpV2PortConfigEntry
        entry.

        Each active lldpConfigEntry is restored from non-volatile
        storage (along with the corresponding lldpV2PortConfigEntry)
        after a re-initialization of the management system."                      �"The lldpXdot1dcbxConfigApplicationPriorityTxEnable, which
        is defined as a truth value and configured by the network 
        management, determines whether the IEEE 802.1 organizationally
        defined Application Priority TLV transmission is allowed on
        a given LLDP transmission capable port.

        The value of this object is restored from non-volatile
        storage after a re-initialization of the management system." "D.2.12"                             �"This table contains one row per port for the IEEE 802.1
        organizationally defined LLDP ETS Configuration TLV on
        the local system known to this agent"                       h"Information about the IEEE 802.1 organizational defined
        ETS Configuration TLV LLDP extension."                       m"Indicates if the credit-based shaper Traffic Selection
        Algorithm is supported on the local system." 	"D.2.9.4"                     4"Indicates the number of traffic classes supported." 	"D.2.9.5"                     u"Indicates if the local system is willing to accept the
        ETS configuration recommended by the remote system." 	"D.2.9.3"                     �"This table contains one row per priority.  The entry in each
        row indicates the traffic class to which the priority is 
        assigned."                       3"Indicates a priority to traffic class assignment."                       F"Indicates the priority that is assigned to a traffic
        class." 	"D.2.9.6"                     P"Indicates the traffic class to which this priority is
        to be assigned." 	"D.2.9.6"                     �"This table contains one row per traffic class.  The 
        entry in each row indicates the traffic class to  
        which the bandwidth is assigned."                       4"Indicates a traffic class to Bandwidth assignment."                       F"Indicates the traffic class to
        which this bandwidth applies" 	"D.2.9.7"                     9"Indicates the bandwidth assigned to this traffic class." 	"D.2.9.7"                     �"This table contains one row per traffic class.  The entry
        in each row indicates the traffic selction algorithm to be
        used by the traffic class."                       P"Indicates a traffic class to traffic selection algorithm
         assignment."                       Z"Indicates the traffic class that is assigned to a traffic 
        selection algorithm." 	"D.2.9.8"                     c"Indicates the Traffic Selection Algorithm to which this
        traffic class is to be assigned." 	"D.2.9.8"                         �"This table contains one row per traffic class.  The 
        entry in each row indicates the traffic class to  
        which the bandwidth is assigned."                       4"Indicates a traffic class to Bandwidth assignment."                       F"Indicates the traffic class to
        which this bandwidth applies" 
"D.2.10.3"                     9"Indicates the bandwidth assigned to this traffic class." 
"D.2.10.4"                     �"This table contains one row per priority.  The entry in each
        row indicates the traffic selction algorithm to be used
        by the traffic class."                       K"Indicates a priority to traffic selection algorithm
         assignment."                       Z"Indicates the traffic class that is assigned to a traffic 
        selection algorithm." 
"D.2.10.5"                     c"Indicates the Traffic Selection Algorithm to which this
        traffic class is to be assigned." 
"D.2.10.5"                         �"This table contains one row per port for the IEEE 802.1
        organizationally defined LLDP PFC TLV on the local
        system known to this agent"                       Z"Information about the IEEE 802.1 organizational defined
        PFC TLV LLDP extension."                       j"Indicates if the local system is willing to accept the 
        PFC configuration of the remote system." 
"D.2.11.3"                     k"Indicates if the local system is capable of bypassing
        MACsec processing when MACsec is disabled." 
"D.2.11.4"                     p"Indicates the number of traffic classes on the local device
        that may simultaneously have PFC enabled." 
"D.2.11.5"                     �"This table contains eight entries, one entry per priority,
        indicating if PFC is enabled on the corresponding priority."                       O"Each entry indicates if PFC is enabled on the 
        correponding priority"                       -"Prioity for which PFC is enabled / disabled"                       ;"Indicates if PFC is enabled on the corresponding priority" 
"D.2.11.6"                     ]"Table containing entries indicating the priorty to be used
        for a given application"                       P"Entry that indicates the priority to be used for a
        given application."                      )"Indicates the contents of the protocol object
        (lldpXdot1dcbxLocApplicationPriorityAEProtocol)
        1: Ethertype
        2: Well Known Port number over TCP, or SCTP
        3: Well Known Port number over UDP, or DCCP
        4: Well Known Port number over TCP, SCTP, UDP, and DCCP" 
"D.2.12.3"                     i"The protocol indicator of the type indicated by
        lldpXdot1dcbxLocApplicationPriorityAESelector." 
"D.2.12.3"                     �"The priority code point that should be used in
        frames transporting the protocol indicated by
        lldpXdot1dcbxLocApplicationPriorityAESelector and
        lldpXdot1dcbxLocApplicationPriorityAEProtocol" 
"D.2.12.3"                             �"This table contains one row per port for the IEEE 802.1
        organizationally defined LLDP ETS Configuration TLV on
        the local system known to this agent"                       h"Information about the IEEE 802.1 organizational defined
        ETS Configuration TLV LLDP extension."                       n"Indicates if the credit-based shaper Traffic Selection
        algorithm is supported on the remote system." 	"D.2.9.4"                     4"Indicates the number of traffic classes supported." 	"D.2.9.5"                     v"Indicates if the remote system is willing to accept the
        ETS configuration recommended by the remote system." 	"D.2.9.3"                     �"This table contains one row per priority.  The entry in 
        each row indicates the traffic class to which the 
        priority is assigned."                       3"Indicates a priority to traffic class assignment."                       F"Indicates the priority that is assigned to a traffic
        class." 	"D.2.9.6"                     Q"Indicates the traffic class to which this priority is 
        to be assigned." 	"D.2.9.6"                     �"This table contains one row per traffic class.  The 
        entry in each row indicates the traffic class to  
        which the bandwidth is assigned."                       4"Indicates a traffic class to Bandwidth assignment."                       F"Indicates the traffic class to
        which this bandwidth applies" 	"D.2.9.7"                     9"Indicates the bandwidth assigned to this traffic class." 	"D.2.9.7"                     �"This table contains one row per traffic class.  The 
        entry in each row indicates the traffic selction
        algorithm to be used by the traffic class."                       O"Indicates a traffic class to traffic selection
        algorithm assignment."                       Z"Indicates the traffic class that is assigned to a traffic 
        selection algorithm." 	"D.2.9.8"                     c"Indicates the Traffic Selection Algorithm to which this
        traffic class is to be assigned." 	"D.2.9.8"                         �"This table contains one row per traffic class.  The 
        entry in each row indicates the traffic class to  
        which the bandwidth is assigned."                       4"Indicates a traffic class to Bandwidth assignment."                       F"Indicates the traffic class to
        which this bandwidth applies" 
"D.2.10.4"                     9"Indicates the bandwidth assigned to this traffic class." 
"D.2.10.4"                     �"This table contains one row per traffic class.  The
        entry in each row indicates the traffic selction 
        algorithm to be used by the priority."                       K"Indicates a priority to traffic selection algorithm
         assignment."                       Z"Indicates the traffic class that is assigned to a traffic 
        selection algorithm." 
"D.2.10.5"                     c"Indicates the Traffic Selection Algorithm to which this
        traffic class is to be assigned." 
"D.2.10.5"                         �"This table contains one row per port for the IEEE 802.1
        organizationally defined LLDP PFC TLV on the local
        system known to this agent"                       Z"Information about the IEEE 802.1 organizational defined
        PFC TLV LLDP extension."                       j"Indicates if the remote system is willing to accept the 
        PFC configuration of the local system." 
"D.2.11.3"                     l"Indicates if the remote system is capable of bypassing
        MACsec processing when MACsec is disabled." 
"D.2.11.4"                     q"Indicates the number of traffic classes on the remote device
        that may simultaneously have PFC enabled." 
"D.2.11.5"                     �"This table contains eight entries, one entry per priority,
        indicating if PFC is enabled on the corresponding priority."                       O"Each entry indicates if PFC is enabled on the 
        correponding priority"                       -"Prioity for which PFC is enabled / disabled"                       ;"Indicates if PFC is enabled on the corresponding priority" 
"D.2.11.6"                     ]"Table containing entries indicating the priorty to be used
        for a given application"                       P"Entry that indicates the priority to be used for a
        given application."                      )"Indicates the contents of the protocol object
        (lldpXdot1dcbxRemApplicationPriorityAEProtocol)
        1: Ethertype
        2: Well Known Port number over TCP, or SCTP
        3: Well Known Port number over UDP, or DCCP
        4: Well Known Port number over TCP, SCTP, UDP, and DCCP" 
"D.2.12.3"                     i"The protocol indicator of the type indicated by
        lldpXdot1dcbxRemApplicationPriorityAESelector." 
"D.2.12.3"                     �"The priority code point that should be used in
        frames transporting the protocol indicated by
        lldpXdot1dcbxRemApplicationPriorityAESelector and
        lldpXdot1dcbxRemApplicationPriorityAEProtocol" 
"D.2.12.3"                             �"This table contains one row per port for the IEEE 802.1
        organizationally defined LLDP ETS Configuration TLV
        on the local system known to this agent"                       h"Information about the IEEE 802.1 organizational defined
        ETS Configuration TLV LLDP extension."                       U"Indicates support for the credit-based shaper Traffic
        Selection Algorithm." 	"D.2.9.4"                     4"Indicates the number of traffic classes supported." 	"D.2.9.5"                     u"Indicates if the local system is willing to accept the
        ETS configuration recommended by the remote system." 	"D.2.9.3"                     �"This table contains one row per priority.  The entry in each
        row indicates the traffic class to which the priority is
        assigned."                       3"Indicates a priority to traffic class assignment."                       G"Indicates the priority that is assigned to a traffic 
        class." 	"D.2.9.6"                     P"Indicates the traffic class to which this priority is
        to be assigned." 	"D.2.9.6"                     �"This table contains one row per traffic class.  The 
        entry in each row indicates the traffic class to  
        which the bandwidth is assigned."                       4"Indicates a traffic class to Bandwidth assignment."                       F"Indicates the traffic class to
        which this bandwidth applies" 	"D.2.9.7"                    "Indicates the bandwidth assigned to this traffic class.
        The sum of the bandwidths assigned to a given port is
        required at all times to eqaul 100.  An operation that
        attempts to change this table such that the bandwidth
        entires do not total 100 shall be rejected. An implication
        of this is that modification of this table requires that
        multiple set operations be included in a single SNMP PDU,
        commonly referred to as an MSET operation, to perform
        simultaneous set operations to keep the sum at 100.  Any
        attempt to change a single entry in this table will result
        in the operation being rejected since entries in the 
        table referring to the given port will no longer 
        sum to 100." 	"D.2.9.7"                     �"This table contains one row per traffic class.  The entry
        in each row indicates the traffic selction algorithm to
        be used by the priority."                       O"Indicates a traffic class to traffic selection
        algorithm assignment."                       Y"Indicates the traffic class that is assigned
        to a traffic selection algorithm." 	"D.2.9.8"                     c"Indicates the Traffic Selection Algorithm to which this
        traffic class is to be assigned." 	"D.2.9.8"                         �"This table contains one row per traffic class.  The 
        entry in each row indicates the traffic class to  
        which the bandwidth is assigned."                       4"Indicates a traffic class to Bandwidth assignment."                       F"Indicates the traffic class to
        which this bandwidth applies" 
"D.2.10.4"                    "Indicates the bandwidth assigned to this traffic class.
        The sum of the bandwidths assigned to a given port is
        required at all times to eqaul 100.  An operation that
        attempts to change this table such that the bandwidth
        entires do not total 100 shall be rejected. An implication
        of this is that modification of this table requires that
        multiple set operations be included in a single SNMP PDU,
        commonly referred to as an MSET operation, to perform
        simultaneous set operations to keep the sum at 100.  Any
        attempt to change a single entry in this table will result
        in the operation being rejected since entries in the 
        table referring to the given port will no longer 
        sum to 100." 
"D.2.10.4"                     �"This table contains one row per traffic class.  The entry
        in each row indicates the traffic selction algorithm to 
        be used by the traffic class."                       O"Indicates a traffic class to traffic selection
        algorithm assignment."                       Z"Indicates the traffic class that is assigned to a traffic 
        selection algorithm." 
"D.2.10.5"                     c"Indicates the Traffic Selection Algorithm to which this
        traffic class is to be assigned." 
"D.2.10.5"                         �"This table contains one row per port for the IEEE 802.1
        organizationally defined LLDP PFC TLV on the local
        system known to this agent"                       Z"Information about the IEEE 802.1 organizational defined
        PFC TLV LLDP extension."                       j"Indicates if the local system is willing to accept the 
        PFC configuration of the remote system." 
"D.2.11.3"                     k"Indicates if the local system is capable of bypassing
        MACsec processing when MACsec is disabled." 
"D.2.11.4"                    �"Indicates the number of traffic classes on the local device
        that may simultaneously have PFC enabled.  

        Note that this typically indicates a physical limitation of the
        device.  However, some devices may allow this parameter to be
        administratively configured, in which case the MAX-ACCESS
        should be changed to read-write with and an appropriate
        DEFVAL added." 
"D.2.11.5"                     �"This table contains eight entries, one entry per priority,
        indicating if PFC is enabled on the corresponding priority."                       O"Each entry indicates if PFC is enabled on the 
        correponding priority"                       -"Prioity for which PFC is enabled / disabled"                       ;"Indicates if PFC is enabled on the corresponding priority" 
"D.2.11.6"                     ]"Table containing entries indicating the priorty to be used
        for a given application"                       P"Entry that indicates the priority to be used for a
        given application."                      +"Indicates the contents of the protocol object
        (lldpXdot1dcbxAdminApplicationPriorityAEProtocol)
        1: Ethertype
        2: Well Known Port number over TCP, or SCTP
        3: Well Known Port number over UDP, or DCCP
        4: Well Known Port number over TCP, SCTP, UDP, and DCCP" 
"D.2.11.6"                     k"The protocol indicator of the type indicated by
        lldpXdot1dcbxAdminApplicationPriorityAESelector." 
"D.2.11.6"                     �"The priority code point that should be used in
        frames transporting the protocol indicated by
        lldpXdot1dcbxAdminApplicationPriorityAESelector and
        lldpXdot1dcbxAdminApplicationPriorityAEProtocol" 
"D.2.11.6"                             �"A compliance statement for SNMP entities that implement
         the IEEE 802.1 organizationally defined DCBX LLDP 
         extension MIB.

         This group is mandatory for agents which implement Enhanced
         Transmission Selection."                   N"The collection of objects used for Enhanced
        Transmission Selection."                 J"The collection of objects used for Priority-
        base Flow Control."                 C"The collection of objects used for Application
        priority."                                                    