 &-- Start of MPLS-FRR-GENERAL-STD-MIB
                                                                    �"Copyright (c) 2011 IETF Trust and the persons
          identified as authors of the code.  All rights
          reserved.

          Redistribution and use in source and binary forms,
          with or without modification, is permitted pursuant
          to, and subject to the license terms contained in,
          the Simplified BSD License set forth in Section 4.c
          of the IETF Trust's Legal Provisions Relating to
          IETF Documents
          (http://trustee.ietf.org/license-info).

          This MIB module contains generic object definitions for
          MPLS Traffic Engineering Fast Reroute as defined in
          RFC 4090."�"
                     Riza Cetin
              Email: riza.cetin@alcatel.be

                     Thomas D. Nadeau
              Email: thomas.nadeau@ca.com

                     A S Kiran Koushik
              Email: kkoushik@cisco.com

                     Stefaan De Cnodder
              Email: Stefaan.de_cnodder@alcatel.be

                     Der-Hwa Gan
              Email: dhg@juniper.net
            " "201111030000Z" *"Initial version.  Published as RFC 6445."       -- 03 Nov 2011 00:00:00 GMT
           �"Indicates which protection method is to be used for fast
          reroute on this device.  Some devices may require a reboot
          if this variable is to take effect after being modified."                       w"The number of tunnel instances for either detour LSPs or
          bypass tunnels for which this LSR is the ingress."                       L"This table shows detour LSP or bypass tunnel setup
          constraints."                      
�"An entry in this table represents detour LSP or bypass
          tunnel setup constraints for an interface or link to be
          protected by detour LSPs or a bypass tunnel.

          Once the LSP or tunnel instance to be protected is identified
          in the mplsTunnelTable, the corresponding mplsTunnelIfIndex
          value of that tunnel can be used to get the ifIndex of
          the underlying physical interface using the ifStackTable.
          That ifIndex of the underlying physical interface will
          be used as mplsFrrGeneralConstraintsIfIndexOrZero in this
          table to protect the LSPs or tunnel instances determined
          earlier.

          It is recommended that ifIndex persistence be enabled
          across re-initializations.  If persistence is not
          implemented, then the value of
          mplsFrrGeneralConstraintsIfIndexOrZero in this
          table cannot be guaranteed across restarts and all entries
          in this table MUST NOT be persistent, or the values of
          mplsFrrGeneralConstraintsIfIndexOrZero MUST be reconstructed
          on restart.

          SNMP engines must only allow entries in this table
          to be created for tunnel instances that require fast reroute
          as indicated by the presence of the FAST_REROUTE object
          in the signaling for the LSP in question.

          An entry in this table can be created only if a
          corresponding entry in mplsTunnelTable exists with the
          same mplsTunnelIndex as mplsFrrGeneralConstraintsTunnelIndex.

          Entries in this table are deleted when the corresponding
          entries in mplsTunnelTable are deleted.

          It is recommended that entries in this table be persistent
          across reboots.

          Entries indexed with mplsFrrGeneralConstraintsIfIndexOrZero
          and set to 0 apply to all interfaces on this device for
          which the FRR feature can operate.

          If the mplsTunnelInstance object is set to a value of 0,
          it indicates that the mplsTunnelEntry contains a tunnel
          ingress.  This is typically how configuration of this
          feature is performed on devices where the actual
          protection LSP used is left up to the protecting tunnel.
          However, in cases where static configuration is
          possible, any valid tunnel instance is possible;
          however, it is strongly RECOMMENDED that the instance
          index SHOULD use the following convention to identify
          backup LSPs:

          - lower 16 bits : protected tunnel instance
          - higher 16 bits: must be all zeros" 6"Section 4.1 of RFC 4090 and Section 6.1 of RFC 3812."                    C"Uniquely identifies an interface that a fast-reroute
          protection tunnel is configured to potentially protect
          in the event of a fault.  Entries with this index set to
          0 indicate that the configured protection tunnel protects
          all interfaces on this device (i.e., node protection)."                       �"Uniquely identifies a tunnel in the mplsTunnelTable that
          is configured to possibly protect the interface(s) specified
          by mplsFrrGeneralConstraintsIfIndexOrZero in the event of a
          fault."  "mplsTunnelTable from RFC 3812."                    ,"Uniquely identifies an existing instance of this tunnel
          for which fast reroute is requested.  Note that a value of
          0 indicates that the configuration points at a tunnel
          head (as specified in RFC 3812).  This is typically how
          configuration of this feature is performed on devices
          where the actual protection LSP used is left up to the
          protecting tunnel.  However, in cases where static
          configuration is possible, any valid tunnel instance is
          permissible.  In these cases, it is recommended that the
          instance index follow the following convention so as
          to make identification of backup LSPs easier:

          - lower 16 bits : protected tunnel instance
          - higher 16 bits: must be all zeros"                      "Indicates type of the resource protection:

          linkProtection(1) indicates that this tunnel is
          set up to protect a particular link's resources.

          nodeProtection(2) indicates that this tunnel is
          set up to protect an entire node from failure." "Section 3 of RFC 4090."                     M"Indicates the setup priority of the detour LSP
          or bypass tunnel." "Section 4.7 of RFC 3209."                     P"Indicates the holding priority for the detour LSP
          or bypass tunnel." "Section 4.7 of RFC 3209."                    "Indicates the include-any link constraint for the
          detour LSP or bypass tunnel.  A link satisfies the
          include-any constraint if and only if the constraint
          is zero, or the link and the constraint have a
          resource class in common." "Section 4.7 of RFC 3209."                    "Indicates the include-all link constraint for the
          detour LSP or bypass tunnel.  A link satisfies the
          include-all constraint if and only if the link contains
          all of the administrative groups specified in the
          constraint." "Section 4.7 of RFC 3209."                    	"Indicates the exclude-any link constraint for the
          detour LSP or bypass tunnel.  A link satisfies the
          exclude-any constraint if and only if the link contains
          none of the administrative groups specified in the
          constraint." "Section 4.7 of RFC 3209."                     Z"The maximum number of hops that the detour LSP or
          bypass tunnel may traverse." "Section 4.1 of RFC 4090."                     �"The maximum bandwidth specifically reserved for a detour
          LSP or bypass tunnel, in units of thousands of bits
          per second (kbps).  Note that setting this value to 0
          indicates best-effort treatment."                       �"The storage type for this configuration entry.
          Conceptual rows having the value 'permanent'
          need not allow write access to any columnar
          objects in the row."                      #"This object is used to create, modify, and/or delete a row
          in this table.  When a row in this table is in active(1)
          state, no objects in that row can be modified
          except mplsFrrGeneralConstraintsRowStatus and
          mplsFrrGeneralConstraintsStorageType."                      9"This table sparsely extends mplsTunnelARHopTable defined
          in the MPLS-TE-STD-MIB module with fast-reroute objects.
          These objects specify the status of local protection,
          including availability and active use, on a per-hop basis,
          of hops traversed by a protected tunnel."                       a"This entry contains fast-reroute protection status of a
          single protected tunnel hop."                      �"This object indicates the desired values for the
          associated SESSION_ATTRIBUTE flags.  Note that since
          this object is a BITS type, the bits may be set to
          indicate various desired combinations of the
          SESSION_ATTRIBUTE flags.

          If SESSION_ATTRIBUTE flags are not supported, then this
          object contains the value of
          arHopSessionAttrFlagsUnsupported(0)." :"See Section 4.3 of RFC 4090 for SESSION_ATTRIBUTE flags."                    �"This object indicates the flags that are currently
          in use by the associated Record Route Object (RRO)
          sub-object.

          Note that since this object is a BITS type,
          the bits may be set to indicate various combinations of
          the flags.

          If the RRO sub-object is not supported, then this object
          contains the value of arHopRROSubObjectFlagsUnsupported(0)." "Section 4.4 of RFC 4090."                             e"Compliance statements for SNMP engines that support the
          MPLS-FRR-GENERAL-STD-MIB module."   9"Support for createAndWait and notReady is not required."             e"Compliance statements for SNMP engines that support the
          MPLS-FRR-GENERAL-STD-MIB module."   "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required."                 S"Objects that are required to display general fast-reroute
          information."                 �"Objects that are required to configure fast-reroute
          constraints at the ingress LSR of the tunnel that
          requires fast-reroute service."                 Y"Objects that are required to present per-hop fast-reroute
          protection status."                    