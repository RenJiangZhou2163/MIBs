                      D"Copyright (C) 2008 The IETF Trust.  This version of this MIB
          module is part of RFC xxxx; See the RFC itself for full
          legal notices.
          This MIB module contains object definitions for
          MPLS Traffic Engineering facility backup method for
          Fast Reroute as defined in RFC4090."�"
                     Riza Cetin
              Email: riza.cetin@alcatel.be

                     Thomas D. Nadeau
              Email: tom.nadeau@bt.com

                     A S Kiran Koushik
              Email: kkoushik@cisco.com

                     Stefaan De Cnodder
              Email: Stefaan.de_cnodder@alcatel.be

                     Der-Hwa Gan
              Email: dhg@juniper.net
            " "200809111200Z" ""       "-- 13 November 2008 12:00:00 GMT
           h"Enables or disables hello message in global-configuration mode 
         which is defined in RFC3209."                           �"The mplsFrrFacilityInfTable provides information about the interface as specified 
            by mplsFrrFacilityProtectedIfIndex.  Each entry belongs to a protected 
             interface, including statistical attributes of this interface."                       |"An entry in the mplsFrrFacilityInfTable represents the statistical attributes
             of a FRR-configured interface."                       "Uniquely identifies the interface configured for FRR 
          protection. If this object is set to 0, this indicates
          that the remaining indexing combinations for this row 
          apply to all interfaces on this device for which 
          the FRR feature can operate."                       s"The number of backup tunnels protecting the
             interface specified by mplsFrrFacilityProtectedIfIndex."                       �"The number of LSPs currently being protected on 
             the interface specified by 
             mplsFrrFacilityProtectedIfIndex."                       n"The number of tunnels protected on the interface
             specified by mplsFrrFacilityProtectedIfIndex."                      x"Uniquely identifies the mplsTunnelEntry primary index for
          the tunnel head interface designated to protect the
          interface as specified in the mplsFrrFacilityProtectedIfIndex
          (and all of the tunnels using this interface). Note 
          that the corresponding mplsTunnelInstance MUST BE
          0 as per the indexing convention stipulated." 	"RFC3812"                     B"The name of interface configured for FRR 
          protection."                      "The mplsFrrFacilityDBTable provides summary information about the
             fast reroute database which indicates information of primary LSPs protected by the LSP 
             as specified by mplsFrrFacilityProtectingTunnelIndex on the protected interface."                       �"An entry in the mplsFrrFacilityDBTable represents a single
             protected LSP, protected by a backup tunnel on a
             specific protected interface."                       "Uniquely identifies the interface configured for FRR 
          protection. If this object is set to 0, this indicates
          that the remaining indexing combinations for this row 
          apply to all interfaces on this device for which 
          the FRR feature can operate."                       �"Uniquely identifies the mplsTunnelEntry primary index for
          the TE tunnel LSP being protected on the
          interface as specified by mplsFrrFacilityProtectedIfIndex."                       �"Uniquely identifies the mplsTunnelEntry third index 
         for the TE tunnel LSP being protected on the
         interface as specified by mplsFrrFacilityProtectedIfIndex." "RFC3209, RFC3212"                     �"Uniquely identifies the mplsTunnelEntry fourth index 
         for the TE tunnel LSP being protected on the
         interface as specified by mplsFrrFacilityProtectedIfIndex."                       �"Uniquely identifies the mplsTunnelEntry secondary index 
         for the TE tunnel LSP being protected on the
         interface as specified by mplsFrrFacilityProtectedIfIndex."                      x"Uniquely identifies the mplsTunnelEntry primary index for
          the tunnel head interface designated to protect the
          interface as specified in the mplsFrrFacilityProtectedIfIndex
          (and all of the tunnels using this interface). Note 
          that the corresponding mplsTunnelInstance MUST BE
          0 as per the indexing convention stipulated." 	"RFC3812"                     B"The name of interface configured for FRR 
          protection."                      �"Specifies the state of the protecting tunnel as
             specified by mplsFrrFacilityProtectingTunnelIndex.

             active  This tunnel's label has been placed in the
                      LFIB and is ready to be applied to incoming
                      packets.

             ready -  This tunnel's label entry has been created but is
                      not yet in the LFIB.

             partial - This tunnel's label entry as not been fully
                       created."                           a"The mplsFrrHelloStatusTable provides information about the
             hello status database."                       �"An entry in the mplsFrrHelloStatusTable represents a single
             hello enabled interface on local node for timely neighbor failure detection."                     -- neighbor id
 D"Uniquely identifies the hello enabled interface on the local node."                       �"Uniquely identifies the local address on which hello enabled interfaces are 
         configured for neighbor failure detection."                       L"Uniquely identifies the neighboring address whose status is being tracked."                       \"Specifies the state of neighbor node as specified by 
         mplsFrrHelloNeighborLSRID."                      "Indicates the way the hello enabled interface processes hello 
         messages.     
         
         active(1)  : initiate to detect the state of neighbor with hello 
         	request message. 
         passive(2) : receives and processes hello request message."                       #"Represents the sender's instance."                       �"The most recently received Src_Instance value as specified by 
         mplsFrrHelloSrcInstance received from the neighbor.
          This field MUST be set to zero (0) when no value has ever been seen 
          from the neighbor."                       >"Represents the periodicity in which hello message is issued."                       �"Represents the allowed max miss number of hello instances after which
         the node treat the neighbor communication has been lost."                       /"Represents the lost count of hello instances."                       *"Represents the number of protected LSPs."                       "Hello enabled interface name."                       r"The mplsFrrHelloConfigTable provides information about the
             hello configuration info on interfaces."                       �"An entry in the mplsFrrHelloConfigTable represents a single
             hello configuration info of hello enabled interface."                       1"The index of interface which enables FRR hello."                       /"FRR Hello refresh interval on this interface."                       -"FRR Hello refresh misses on this interface."                       0"The name of interface which enables FRR hello."                           �"The mplsFrrDetourDBTable provides summary information about the
             fast reroute database which indicates information of tunnels 
			 protected by detour LSP.
			 
			 The entries of this table are present in PLR nodes of the detour LSP."                       r"An entry in the mplsFrrDetourDBEntry represents a single
             protected LSP, protected by a detour lsp."                       �"Uniquely identifies the mplsTunnelEntry index for the TE tunnel
  		LSP being protected by detour Lsp with the same tunnel index."                       �"Uniquely identifies the mplsTunnelEntry secondary index 
         for the TE tunnel LSP being protected by detour Lsp with the
		 same tunnel instance."                       v"Uniquely identifies the mplsTunnelEntry third index 
         for the TE tunnel LSP being protected by  detour Lsp." "RFC3209, RFC3212"                     w"Uniquely identifies the mplsTunnelEntry fourth index 
         for the TE tunnel LSP being protected by  detour Lsp."                       B"Indicates the index of in interface of primary lsp on this node."                       5"Indicates the in lable of primary lsp on this node."                       C"Indicates the index of out interface of primary lsp on this node."                       6"Indicates the out lable of primary lsp on this node."                       4"Indicates the in lable of detour lsp on this node."                       A"Indicates the index of in interface of detour lsp on this node."                       5"Indicates the out lable of detour lsp on this node."                       B"Indicates the index of out interface of detour lsp on this node."                       0"Indicates the next hop address of detour Lsp ." "RFC3209, RFC3212"                    ?"Specifies the state of the detour lsp.

             active  This lsp's label has been placed in the
                      LFIB and is ready to be applied to incoming
                      packets.

             ready -  This lsp's label entry has been created but is
                      not yet in the LFIB."                       �"This object indicates the protection type provided by detour lsp.
		     
			 node  The detour lsp is NNHop protection.
			 
			 link  The detour lsp id NHop protection.
		     "                       �"The mplsFrrDetourLspTable provides summary information about the
             detour LSP.
			 
			 The entries of this table are present in all LSRs on the path
             of the detour LSP."                       �"An entry in this table represents a detour. An entry in this
             table is only created by an SNMP agent as instructed by an MPLS
             signaling protocol. "                       �"Uniquely identifies the mplsTunnelEntry index for the detour Lsp
         which is the same as th TE tunnel LSP being protected."                       �"Uniquely identifies the mplsTunnelEntry secondary index for the 
		detour Lsp which is the same as th TE tunnel LSP being protected."                       �"Uniquely identifies the mplsTunnelEntry third index for the 
		detour Lsp which is the same as th TE tunnel LSP being protected." "RFC3209, RFC3212"                     �"Uniquely identifies the mplsTunnelEntry fourth index for the 
		detour Lsp which is the same as th TE tunnel LSP being protected."                       E"Indicates the index of in interface of the detour lsp on this node."                       F"Indicates the index of out interface of the detour lsp on this node."                       �"This object indicates the lsp type.
		     
			 plrlsp  The detour lsp originated from this node.
			 
			 dtrLsp  The detour lsp through this node.
		     "                      �"This value represents whether or not this detour is merged.
			 
			 notmerged          This detour is not merged.
		     
			 mergedwithdtr_lsp  This detour is merged into another detour protecting
                    			 the same tunnel.
			 
			 mergedwithmain    This detour is merged with the protected tunnel.
			 
			 mergelsp          Another detour lsp protecting the same tunnel is merged 
			                   into this detour lsp.
		     "                       ?"The IP address of the PLR which has initiated the detour LSP."                       :"The IP address of the node that this PLR tries to avoid."                       }"The maximum bandwidth specifically reserved for the detour
          LSP, in units of thousands of bits per second (Kbps)."                                  