                                                                          ^"The EVB MIB module for managing devices that support
        Ethernet Virtual Bridging.

        Unless otherwise indicated, the references in this MIB
        module are to IEEE Std 802.1Q-2011.

        Copyright (C) IEEE.
        This version of this MIB module is part of IEEE802.1Q;
        see the draft itself for full legal notices."t"WG-URL: http://www.ieee802.org/1
          WG-EMail: stds-802-1@ieee.org

          Contact: Tony Jeffree
          Postal: C/O IEEE 802.1 Working Group
                   IEEE Standards Association
                   445 Hoes Lane
                   Piscataway
                   NJ 08854
                   USA
         E-mail: STDS-802-1-L@LISTSERV.IEEE.ORG" "201202150000Z" 1"Initial version published in IEEE Std 802.1Qbg."       -- February 15, 2012
                   X"The evbSysType determines if this is an EVB Bridge 
                  or EVB station." "5.22,5.23"                     w"The evbSysNumExternalPorts parameter indicates how 
                  many externally accessible port are available." "12.4.2, 12.5.1"                    {"This object is used to initialize the LLDP EVB 
                  objects for new SBPs and URPS.
                  When set to 'true' a new SBP or URP will place the local
                  EVB objects in the LLDP nearest Customer database;
                  when set to 'false' a new SBP or URP will not place
                  the local EVB objects in the LLDP database." "D.2.13"                    X"This object is used to initialize the LLDP EVB 
                  objects for new SBPs and URPS.
                  When set to 'false' the operating configuration
                  will be determined by the comparison between 
                  the local and remote LLDP EVB objects 
                  (automatic), regardless of the setting of 
                  ieee8021BridgeEvbSysLldpTxEnable. 
                  When ieee8021BridgeEvbSysLldpManual is 'true' the
                  configuration will be determined by the setting
                  of the local EVB objects only (manual)." "D.2.13"                     "The value of this object is used as the default 
                  value of the BGID or SGID bit of the EVB LLDP TLV string." "D.2.13"                     7"A value indicating the  Bridge Proposed ECP ackTimer." "D.2.13.6, 43.3.6.1"                     /"A value indicating the Bridge ECP maxRetries." "D.2.13.5, 43.3.7.4"                     6"A value indicating the  Bridge Resource VDP Timeout." "D.2.13, 41.5.5.7"                     @"A value indicating the Bridge Proposed VDP Keep Alive Timeout." "D.2.13, 41.4.5.5"                     M"A table that contains Station-facing Bridge Port (SBP) 
          details." 	"12.26.2"                     #"A list of objects describing SBP."                       "The SBP component ID" 
"12.4.1.5"                     "The SBP port number." "12.4.2"                     �"The evbSbpLldpManual parameter switches EVB TLVs to manual mode. 
    In manual mode the running parameters are determined solely from
    the local LLDP database values."                       �"The value used to initialize the waitWhile timer 
                (41.4.5.7) by the station VDP state machine when
                the state machine is waiting for a response." "D.2.13, 41.5.5.7"       --2013-06-13 ROSNG MODIFY
             �"The value used to initialize the waitWhile timer 
                 (41.4.5.5) by the station VDP state machine in 
                 order to determine when to transmit a keep alive
                 message." "D.2.13, 41.5.5.5"       --2013-06-13 ROSNG MODIFY
             �"The value used to initialize the waitWhile timer
                 (41.4.5.13) by the EVBCB VDP state machine in order to
                 determine when to transmit a keep alive message." "D.2.13, 41.5.5.13"       --2013-06-13 ROSNG MODIFY
                 U"A table that contains database of the active Virtual Station 
         Interfaces." 	"12.26.3"                     ["A list of objects containing database of the active Virtual Station
         Interfaces."                       �"The evbVSIComponentID is the ComponentID for the 
                C-VLAN component of the EVB Bridge or for the edge
                relay of the EVB station." 
"12.4.1.5"                     h"The evbVSIPortNumber is the Port Number for the SBP
                or URP where the VSI is accessed." "12.4.2"                     @"This object specifies the VSIID Type for the VSIID in the DCN " "41.2.6"                     T"This object specifies the VSIID that uniquely identifies the VSI 
    in the DCN " "41.2.7"                     0"This object specifies the time since creation " "41"                     )"This object identifies the type of TLV." "41.2.1"                     �"The evbOperRevert status indicator shows the most 
                recent value of the KEEP indicator from the VDP
                protocol exchange." "41.2.3"                     �"The evbVsiHard status indicator shows the most
                recent value of the HARD indicator from the VDP
                protocol exchange." "41.2.3"                     1"This object indicates the outcome of a request." "41.2.3"                     |"This object identifies the VSI Manager with a database that holds
    the detailed  VSI type and or instance definitions." "41.1.3"                     �" The VTID is an integer value used to identify
                 a pre-configured set of  controls and attributes
                 that are associated with a set of VSIs." 	" 41.2.4"                     �"The VSI Type Version is an integer identifier designating the
   expected/desired VTID version.  The VTID version allows a VSI
   Manager Database to contain multiple versions of a  given VSI
   Type, allowing smooth migration to newer VSI types." "41.2.5"                     �"This object specifies the MAC/VLAN format.
    basic   - Basic MAC/VLAN format
    partial - Partial MAC/VLAN format
    vlanOnly - Vlan-only MAC/VLAN format
   " "41.2.8"                     �"This object specifies the the number of MAC address/VLAN ID pairs
   contained in the repeated portion of the MAC/VLANs field in the
   VDP TLV." "41.2.9"                     /"This object specifies the VDP state machine. " "41.5.5.14"                     R"This object specifies the VDP number of successful commands since
    creation." "41.5"                     N"This object specifies the VDP number of failed commands since 
   creation " "41.5"                     @"This object specifies the VDP command reverts since creation  " "41.5"                     ["The time (in hundredths of a second) since the
              last counter discontinuity."                       T"A table that contains database of the active Virtual Station 
        Interfaces." 	"12.26.3"                     o"A list of objects containing database of the MAC/VLANs 
         associated with Virtual Station Interfaces."                       
"Group ID" "41.2.9"                     2"The mac-address part of the MAC/VLANs for a VSI." "41.2.9"                     ."The Vlan ID part of the MAC/VLANs for a VSI." "41.2.9"                         :"A table that contains  configuration parameters for UAP." "12.26.4.1 "                     Z"A list of objects containing information to configure the 
         attributes for UAP."                       *"The ComponentID of the port for the UAP."                       *"The port number of the port for the UAP."                       �"The value of the instance of the IfIndex object,
         defined in the IF-MIB, for the interface corresponding
         to this port, or the value 0 if the port has not been
         bound to an underlying frame source and sink."                       "Administrative staus of CDCP." "42.4.2"                    �"The administratively configured value for the local 
   port's role parameter. The value of AdminRole is not reflected in 
   the S-channel TLV. The AdminRole may take the value S or B. 
   S indicates  the sender is unwilling to accept S-channels 
   configuration  (mode, # channels supported, channel index) from 
   its neighbor and that the sender is willing to accept SVID 
   assignments from the neighbor.  Stations usually take the S role.
   B indicates the sender is willing to accept  S-channels 
   configuration (mode, # channels supported, channel index)  
   from its neighbor and that the sender is willing do the best 
   it can to fill  the SVID assignments
   from the neighbor. Bridges usually take the B role." "42.4.2"                     �"The administratively configured value for the 
                     Number of Channels supported parameter. This 
                     value is included as the ChanCap parameter in 
                     the S-channel TLV." "42.4.1"                     �"The operational value for the Number of Channels 
                   supported parameter. This value is included  
                   as the ChnCap parameter in the S-channel TLV." "42.4.8"                     W"Determines the lowest S-VIDs available for 
                     assignment by CDCP." "42.4.7"                     W"Determines the highest S-VIDs available for
                     assignment by CDCP." "42.4.7"                     %"The current runnning state of CDCP." 	"42.4.15"                     &"CDCP state for the remote S-channel." 	"42.4.14"                     2"The  value for the remote port's role parameter." 	"42.4.12"                    "The storage type for this row. Rows in this table that
         were created through an external process may have a storage
         type of readOnly or permanent.
         For a storage type of permanent, none of the columns have
         to be writable."                       +"RowStatus for creating a UAP table entry."                       ]"A table that contains  configuration information for 
   the S-Channel Access Ports (CAP)." "12.26.4.2 "                     U"A list of objects containing information for the S-Channel 
    Access Ports (CAP)"                       �"This object represents the SVID for a ieee8021BridgeEvbSysType 
    of evbBridge and a SCID(S-Channel ID) for a 
    ieee8021BridgeEvbSysType of evbStation." "42.4.3"                     )"Component ID for S-channel Access Port."                      s"The value of the instance of the IfIndex object,
         defined in the IF-MIB, for the interface corresponding
         to this port, or the value 0 if the port has not been
         bound to an underlying frame source and sink.
         The underlying IfEntry indexed by this column MUST be persistent
         across reinitializations of the management system."                       ,"Port number for the S-Channel Access Port."                       #"S-Channel ID (SCID) for this CAP." "42.4.2"                     W"Component ID of the Server Edge Port to be 
                associated with the CAP." 
"12.4.1.5"                     I"Port number of the Server Edge Port to be 
   associated with the CAP." "12.4.2"                     )"RowStatus to create/destroy this table."                       X"A table that contains  configuration information for 
   the Uplink Relay Ports(URP)." "12.26.5.1 "                     Q"A list of objects containing information for the Uplink 
    Relay Ports(URP)."                       '"Component ID that the URP belongs to."                       "port number of the urp."                      &"The value of the instance of the IfIndex object,
         defined in the IF-MIB, for the interface corresponding
         to this port, or the value 0 if the port has not been
         bound to an underlying frame source and sink.

         It is an implementation specific decision as to whether
         this object may be modified if it has been created or
         if 0 is a legal value.

         The underlying IfEntry indexed by this column MUST be 
         persistent across reinitializations of the management
         system. "                       �"The evbURPBindToISSPort is the ISS Port Number where 
                 the URP is attached. 
                 This binding is optional and only required in some 
                 systems."                       �"The evbUrpLldpManual parameter control how the EVB
                  TLV determines the operating values for parameters.
                  When set TRUE only the local EVB TLV will be used to 
                  determine the parameters."                       �"The parameter evbURPVdpOperRsrcWaitDelay is the 
                  exponent of 2 used to set the VDP resourceWaitDelay
                  timer at the EVB Bridge."                       �"The evbUrpVdpOperRespWaitDelay is how long a 
                  EVb station VDP will wait for a response from 
                  the EVB Bridge VDP."                       �"The evbURPVdpOperReinitKeepAlive is the exponent 
                  of 2 used to determine the time interval of Keep 
                  Alives transmitted by the EVB station."                       ]"A table that contains  configuration information for 
    the Edge Control Protocol (ECP)." "12.26.4.2 "                     T"A list of objects containing information for theEdge Control
     Protocol (ECP)."                       "Component ID ."                       "Port number."                       T"The initial value used to initialize ackTimer 
                       (43.3.6.1)."         --2013-06-13 ROSNG MODIFY
             �"This integer variable defines the maximum number
                   of times that the ECP transmit state machine will
                   retry a transmission if no ACK is received."                       n"The evbECPTxFrameCount is the number of ECP frame
                  transmitted since ECP was instanciated."                       �"The evbECPTxRetryCount is the number of times 
                   ECP re-tried transmission since ECP was 
                   instanciated."                       �"The evbECPTxFailures is the number of times ECP 
                  failed to successfully deliver a frame since ECP
                  was instanciated."                       i"The evbECPRxFrameCount is the number
                   of frames received since ECP was instanciated."                               R"The collection of objects used to represent a EVB 
         management objects."                 M"The collection of objects used to represent a SBP 
    management objects."                 K"The collection of objects used to represent a EVB VSI
         DB table."                 J"The collection of objects used to represent a EVB UAP 
          table."                 Z"The collection of objects used to represent a EVB 
             CAP management objects."                 Y"The collection of objects used to represent a EVBS URP 
           management objects."                 T"The collection of objects used to represent a EVB CAP 
       management objects."                     ["The compliance statement for devices supporting EVB
        as defined in IEEE 802.1Qbg."   J"This group is mandatory when S-Channels
                   are present." K"This group is mandatory when S-Channels 
                   are present."             \"The compliance statement for devices supporting EVBS
        as defined in IEEE 802.1Qbg."   L"This group is mandatory when S-Channels
                     are present." L"This group is mandatory when S-Channels
                     are present."                        