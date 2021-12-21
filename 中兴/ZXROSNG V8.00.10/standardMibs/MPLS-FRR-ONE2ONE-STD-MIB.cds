 &-- Start of MPLS-FRR-ONE2ONE-STD-MIB
                                            �"Copyright (c) 2011 IETF Trust and the persons
          identified as authors of the code.  All rights
          reserved.

          Redistribution and use in source and binary forms,
          with or without modification, is permitted pursuant
          to, and subject to the license terms contained in,
          the Simplified BSD License set forth in Section 4.c
          of the IETF Trust's Legal Provisions Relating to
          IETF Documents
          (http://trustee.ietf.org/license-info).

          This MIB module contains object definitions for the
          MPLS Traffic Engineering one-to-one backup method for
          Fast Reroute as defined in RFC 4090."�"
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
           0"The number of detour LSPs entering the device."                       /"The number of detour LSPs leaving the device."                       4"The number of detour LSPs originating at this PLR."                       �"Indicates the number of LSPs currently protected by
          the FRR feature where this device acts as the PLR
          for those LSPs."                       �"This table shows a list of protected TE tunnels with
          the corresponding protecting tunnel, as well as the PLR
          where the protecting tunnel that initiated the detour
          LSPs traverses this node."                      5"An entry in this table represents a protected tunnel LSP
          together with its detour tunnel instance.  An entry in
          this table is only created by an SNMP engine as instructed
          by an MPLS signaling protocol.

          The entries of this table are present in all LSRs on the
          path of the detour LSP.

          The objects mplsFrrOne2OnePlrSenderAddrType and
          mplsFrrOne2OnePlrSenderAddr can be modified after the row
          is created.

          The objects mplsFrrOne2OnePlrTunnelIndex,
          mplsFrrOne2OnePlrTunnelDetourInstance,
          mplsFrrOne2OnePlrTunnelIngressLSRId,
          and mplsFrrOne2OnePlrTunnelEgressLSRId have the same
          values as the objects mplsTunnelIndex, mplsTunnelInstance,
          mplsTunnelIngressLSRId, and mplsTunnelEgressLSRId of the
          detour tunnel instance created in the mplsTunnelTable
          (MPLS-TE-STD-MIB).

          The entries in this table will be deleted when the
          corresponding entries in the mplsTunnelTable are deleted."                       Z"Uniquely identifies a tunnel between a pair of LSRs
          from the mplsTunnelEntry."                       �"Uniquely identifies a detour instance of a tunnel from
          the mplsTunnelEntry.

         - lower 16 bits : protected tunnel instance
         - higher 16 bits: detour instance"                      "The purpose of this object is to uniquely identify a
          tunnel within a network.  When the MPLS signaling
          protocol is rsvp(2), this object SHOULD contain the
          same value as the Extended Tunnel ID field in the

          SESSION object.  When the MPLS signaling protocol
          is crldp(3), this object SHOULD contain the same
          value as the Ingress LSR Router ID field in the
          LSPID TLV object.

          This value represents the head-end of the protected
          tunnel instance." "Section 4.7 of RFC 3209."                     ?"Specifies the egress LSR ID of the protected tunnel instance."                       �"This value represents the PLR that has initiated a detour LSP
          to protect a tunnel instance.

          This value is signaled via the DETOUR object defined in
          MPLS RSVP." "Section 4.2 of RFC 4090."                     O"Denotes the address type of this detour instance's sender
          address."                       �"The IP address of the PLR that has initiated the detour LSP.
          The type of this address is determined by the value of the
          mplsFrrOne2OnePlrSenderAddrType object."                       O"Denotes the address type of the node that this PLR tries to
          avoid."                      "The IP address of the node that this PLR tries to avoid.
          The type of this address is determined by the value of the
          mplsFrrOne2OnePlrAvoidNodeAddrType object.

          This value is signaled via the DETOUR object defined in
          MPLS RSVP." "Section 4.2 of RFC 4090."                     "This table shows detour LSPs."                       �"An entry in this table represents a detour.  An entry in this
          table is only created by an SNMP engine as instructed by an

          MPLS signaling protocol."                      Z"Indicates whether or not the main LSP has switched over to
          this detour LSP.

          If the value of this object is 'true', then it means that
          the main LSP has switched over to this detour LSP.  Otherwise,
          it contains a value of 'false'.
          This is only relevant for detours originated by this node."                      �"This value represents whether or not this detour is merged.
          This value is set to notMerged(1) if this detour is not
          merged.

          This value is set to mergedWithProtectedTunnel(2) if
          this detour is merged with the protected tunnel.  This value
          is mergedWithDetour(3) if this detour is merged
          with another detour protecting the same tunnel."                      E"This value represents the mplsTunnelInstance of the detour
          with which this detour is merged.  This object is only valid
          when mplsFrrOne2OneDetourMergedStatus is set to
          mergedWithDetour(3).

          - lower 16 bits : protected tunnel instance
          - higher 16 bits: detour instance"                               e"Compliance statements for SNMP engines that support the
          MPLS-FRR-ONE2ONE-STD-MIB module."               g"Compliance statements for SNMP engines that support the

          MPLS-FRR-ONE2ONE-STD-MIB module."   "Write access is not required." "Write access is not required."                 N"Objects that are required for general One-to-One PLR
          information."                 �"Objects that are required to present the detour LSP
          information at the detour ingress, transit, and egress
          LSRs."                 W"Objects that are required to represent the FRR
          One-to-One PLR information."                    