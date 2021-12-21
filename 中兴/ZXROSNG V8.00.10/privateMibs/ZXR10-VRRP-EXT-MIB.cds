     �"A number which, along with an interface index (ifIndex),
         serves to uniquely identify a virtual router on a given VRRP
         router. A set of one or more associated addresses is assigned
         to a VRID."                                                                                                                                 �"This MIB describes objects used for managing Virtual Router
          Redundancy Protocol (VRRP) routers.
          This MIB Module is a supplement to the VRRP-MIB [RFC2787]." h"       Zhao yanhua
        Tel:    +86-25-52870000
        E-Mail: zhao.yanhua3@zte.com.cn
        " "201502061424Z" "201311160223Z" "201305021110Z" "201304251110Z" "201304151110Z" "201303191130Z" "201004170000Z" c"add:       zxr10VrrpOperPrimaryVIPType
                    zxr10VrrpOperPrimaryVIPAddr
        " �"add:       zxr10VrrpVFCfgObjects
                    zxr10VrrpVFOperObjects
                    zxr10VrrpVFTrackManages
                    zxr10VrrpOperState
                    zxr10VrrpOperRunPriority
        "�"modify:   add UNITS for
                   zxr10VrrpOperPreemptDelay
                   zxr10VrrpOperReloadDelay
                   zxr10VrrpOperStateLastChangeTime
                   zxr10VrrpOperMasterAdverInterval
                   zxr10VrrpOperMasterDownInterval                       
                   delete DisplayString ::= OCTET STRING,imports it                   
                   delete hyphen for enumerated label of vrrpTrackState               
        "�"modify:    below nodes modified from read-write to read-only
                    zxr10VrrpOperTimerLearnMode
                    zxr10VrrpOperPreemptMode
                    zxr10VrrpOperPreemptDelay
                    zxr10VrrpOperPrivateAdvInterval
                    zxr10VrrpOperVersion
                    zxr10VrrpOperCfgPriority
                    zxr10VrrpOperAcceptMode
                    zxr10VrrpOperBackupRouteMode
                    zxr10VrrpOperCheckTtlMode
                    zxr10VrrpOperOutInterface1
                    zxr10VrrpOperOutInterface2
                    zxr10VrrpOperOutInterface3
                    zxr10VrrpOperReloadDelay
                    zxr10VrrpOperPktSendMode         
        " �"modify:    fix tool check problems
                    DESCRIPTION of vrrpExtMIB 
                    rename the 4th object of vrrpExtMIBCompliance
                    DESCRIPTION of zxr10VrrpExtOperEntry
        " ["add:       zxr10VrrpTrackInterPolicy
                    zxr10VrrpExtOperTable
        " +"Initial version as published in RFC 2787."                   �"Tracking interface table for a VRRP router which consists of a
          sequence (i.e., one or more conceptual rows) of
          'VrrpTrackInterEntry' items."                      "An entry in the vrrpTrackInterTable containing the tracking
          characteristics of a virtual router. On a VRRP router,
          a given virtual router is identified by a combination
          of the IF index and VRID. Rows in the table cannot be modified."                      "The current state of the tracked interface. This object has
         two defined values:
           - `up', which indicates the protocol status of the tracked interface.
           - `down', which indicates the protocol status of the tracked interface."                       �"This object specifies the priority to be reduced when 
          the tracked interface is down.
         A priority of '0', indicates not set the reduced priority."                      "The row status variable, used in accordance to installation
         and removal conventions for conceptual rows. The rowstatus of
         a currently active row in the VrrpTrackInterTable is constrained
         by the tracking state of the corresponding virtual router.
         When `VrrpTrackInterOperRowStatus' is set to active(1), no other
         objects in the conceptual row. 

         To create a row in this table, a manager sets this object
         to either createAndGo(4) or createAndWait(5). Until instances
         of all corresponding columns are appropriately configured,
        the value of the corresponding instance of the
        `VrrpTrackInterOperRowStatus' column will be read as notReady(3).

         In particular, a newly created row cannot be made active(1)
        until (minimally) the corresponding instance of `VrrpTrackInterVrid'
        has been set and there is at least one active row in the
        `VrrpTrackInterTable' tracking a interface for the virtual router."                       %"The interface index of VRRP groups."                       ^"This object contains the Virtual Router Identifier (VRID) of the
        tracked interface."                       %"The index of the tracked interface."                       #"The policy of tracking interface."                       >"The table of VRRP track associated with this virtual router."                      "An entry in the table contains an VRRP track that is
         associated with a virtual router. The number of rows for
         a given ifIndex and VrId will equal the number of VRRP track
         associated by the virtual router.

         Rows in the table cannot be modified."                       ,"The type of tracking for a virtual router."                       5"The type of VRRP track detect for a virtual router."                       5"The type of VRRP track policy for a virtual router."                       T"The assigned reduced priority when VRRP track down for a virtual
         router."                       ,"The VRRP track state for a virtual router."                      �"The row status variable, used in accordance to installation
         and removal conventions for conceptual rows. The rowstatus of
         a currently active row in the vrrpTrackTable is constrained
         by the tracking state of the corresponding virtual router.
         When `vrrpTrackOperRowStatus' is set to active(1), no other
         objects in the conceptual row.

         To create a row in this table, a manager sets this object
         to either createAndGo(4) or createAndWait(5). Until instances
         of all corresponding columns are appropriately configured,
         the value of the corresponding instance of the `vrrpTrackOperRowStatus'
         column will be read as notReady(3).

         In particular, a newly created row cannot be made active(1)
         until (minimally) the corresponding instance of
         `VrrpTrackName' has been set and there is at least one active
         row in the `VrrpTrackTable'."                       ."The name of VRRP track for a virtual router."                       X"This object contains the Virtual Router Identifier (VRID) of the
         VRRP track."                       %"The interface index of VRRP groups."                           !"Table of virtual router manage."                       ^"An entry in the table, containing manage information
         about a given virtual router."                      �"The row status variable, used according to installation
         and removal conventions for conceptual rows. Setting this
         object to active(1) or createAndGo(4) results in the
         addition of an associated address for a virtual router.
         Destroying the entry or setting it to notInService(2)
         removes the manage info from the virtual router.
         The use of other values is implementation-dependent."                       ,"The interface index of manage VRRP groups."                       %"The vrid of the manage VRRP groups."                       ,"The member table of the VRRP manage group."                       k"An entry in the table, containing member information
         about a given virtual router manage group."                      �"The row status variable, used according to installation
         and removal conventions for conceptual rows. Setting this
         object to active(1) or createAndGo(4) results in the
         addition of a member group for a virtual router manage group.
         Destroying the entry or setting it to notInService(2)
         removes the member group from the virtual router manage group.
         The use of other values is implementation-dependent."                       <"The member interface index of virtual router manage group."                       0"The member vrid of virtual router manage group"                       9"The interface index of the virtual router manage group."                       ."The vrid of the virtual router manage group."                               ="The core compliance statement for all VRRP implementations."                   8"Conformance group for VRRP track interface operations."                 1"Conformance group for VRRP tracking operations."                 /"Conformance group for VRRP manage operations."                 /"Conformance group for VRRP member operations."                     �"Extend operations table for a VRRP router which consists
        of a sequence (i.e., one or more conceptual rows) of
        'zxr10VrrpExtOperEntry' items."                       �"An entry in the zxr10VrrpExtOperTable containing the private
        operational characteristics of a virtual router. On a VRRP
        router, a given virtual router is identified by a combination
        of the IF index and VRID."                       9"This object contains the interface index of VRRP group."                       <"This object contains the Virtual Router Identifier (VRID)."                      "The current learn mode state of the virtual router. This object has
        two defined values:

        - `true', which indicates that the virtual router is
         set the learn mode.

        - `false', which indicates the virtual router is
         not set the learn mode."                      "The current preempt state of the virtual router. This object has
        two defined values:

        - `true', which indicates that the virtual router is
         set the preempt mode.

        - `false', which indicates the virtual router is
         not set the preempt mode."                       ;"The current set preempt delay time of the virtual router."                       �"The time interval, in milliseconds, between sending
        advertisement messages. Only the master router sends
        VRRP advertisements."                       "The version of VRRP protocol."                       �"The actual configured priority which was used for the
        virtual router master election process. Higher values imply
        higher priority."                       �"Controls whether a virtual router in Master state will accept
        packets addressed to the address owner's IPvX address as its
        own if it is not the IPvX address owner."                       s"Controls whether a virtual router in Backup state will forward
        packets addressed to virtual mac address."                       c"Controls whether a virtual router verify that the IPv4 TTL or the
        IPv6 hop limit to 255."                       B"The first interface of the virtual router sent the vrrp packets."                       C"The second interface of the virtual router sent the vrrp packets."                       B"The third interface of the virtual router sent the vrrp packets."                       �"The time that an instance of the state machine for virtual router
        delays to run when the interface starts up, in seconds."                      |"The send mode that a virtual router in Master state sends VRRP
        advertisement packets from out-interface.

        - `all', which indicates that the virtual will send advertisement
        packets from all out-interfaces each time.

        - `rotation', which indicates that the virtual will send advertisement
        packets from all out-interfaces in rotation."                       3"The numbers of the virtual router changing state."                       @"The time that the state of a virtual router changed last time."                       �"The IP address type of zxr10VrrpOperMasterIpAddr.
       ipv4(1) and ipv6(2) are the only two values supported
       in this MIB module."                       �"The master router's real (primary) IP address. This is
        the IP address listed as the source in VRRP advertisement
        last received by this virtual router."                       D"The actual running priority of the virtual router in Master state."                       5"The time interval of Master sending advertisements."                       2"Time interval for Backup to declare Master down."                      �"The current state of the virtual router. This object has
         three defined values:

           - `initialize', which indicates that all the
             virtual router is waiting for a startup event.

           - `backup', which indicates the virtual router is
             monitoring the availability of the master router.

           - `master', which indicates that the virtual router
             is forwarding packets for IP addresses that are
             associated with this router."                       4"The actual running priority of the virtual router."                       �"The IP address type of zxr10VrrpOperPrimaryVIPAddr.
       ipv4(1) and ipv6(2) are the only two values supported
       in this MIB module."                       &"The VRRP primary virtual IP address."                           �"Operation table for a VRRP virtual forwarder which consists
        of a sequence (i.e., one or more conceptual rows) of
        'zxr10VrrpVFCfgEntry' items."                       �"An entry in the zxr10VrrpVFCfgTable containing the private
        informative characteristics of a virtual forwarder. On a VRRP
        router, a given virtual router is identified by a combination
        of the IF name, VRID."                       9"This object contains the interface name of VRRP groups."                       <"This object contains the Virtual Router Identifier (VRID)."                       ?"This object contains the Virtual Forwarder Identifier (VFID)."                       �"The actual configured forward weight which was used for 
         the virtual forwarder election process. 
         Higher values imply higher weight."                       �"This object specifies the invalid weight to be used for the
        virtual forwarder becomes unavailable. Higher values imply
        higher invalid weight."                      ("The current preempt state of the virtual forwarder. This object has
        two defined values:

        - 'true', which indicates that the virtual forwarder is
         set the preempt mode.

        - 'false', which indicates the virtual forwarder is
         not set the preempt mode."                       >"The current set preempt delay time of the virtual forwarder."                       D"The redirect time of virtual forwarder which is in TakeOver state."                       A"The aging time of virtual forwarder which is in TakeOver state."                      /"The current running mode of the virtual router. This object has
        two defined values:

        - 'standard', which indicates that the virtual router is
         working on the standard mode.

        - 'balance', which indicates the virtual router is
         working on the balance mode."                      �"The current balance policy of the virtual router. This object has
        three defined values:

        - 'roundRobin', which indicates that the virtual router is
         set round robin policy.

        - 'weighted', which indicates the virtual router is
         set weighted policy.
        
        - 'hostDependent', which indicates the virtual router is
         set host dependent policy."                       1"The forwarding delay time of virtual forwarder."                       :"This object contains the interface index of VRRP groups."                           �"Operation table for a VRRP virtual forwarder which consists
        of a sequence (i.e., one or more conceptual rows) of
        'zxr10VrrpVFOperEntry' items."                       �"An entry in the zxr10VrrpVFOperTable containing the private
        informative characteristics of a virtual forwarder. On a VRRP
        router, a given virtual forwarder is identified by a combination
        of the IF name, VRID and VFID."                       9"This object contains the interface name of VRRP groups."                       <"This object contains the Virtual Router Identifier (VRID)."                       ?"This object contains the Virtual Forwarder Identifier (VFID)."                       �"This object specifies the weight to be used for identifying the
        ability of forwarding for virtual forwarder. Higher values imply
         higher weight."                      i"The current state of the virtual forwarder.  This object
        has four defined values:

        - 'initialize', which indicates that the
           virtual forwarder is waiting for a startup event.

        - 'active', which indicates that the virtual router is
           forwarder owner and is responsible for forwarding flow.

        - 'takeover', which indicates that the virtual forwarder
          is forwarding flow for taking the place of active forwarder. 

        - 'listening', which indicates that the virtual forwarder
          is monitoring the availability of the active forwarder."                       3"The virtual MAC address of the virtual forwarder."                       �"This object specifies the priority to be used for the
         virtual forwarder election process. Higher values imply
         higher priority."                       �"The IP address type of zxr10VrrpVFOperIpAddr.
       ipv4(1) and ipv6(2) are the only two values supported
       in this MIB module."                       7"The virtual forwarder's real IP address of interface."                      g"The current location of the virtual forwarder.  This object
        has three defined values:

        - 'local', which indicates that the virtual forwarder is configured locally.

        - 'remote', which indicates that the virtual router is remote.

        - 'none', which indicates that the virtual forwarder is not configured or does not exist."                       O"This object contains the total number of virtual forwarder in one VRRP group."                       :"This object contains the interface index of VRRP groups."                           �"Tracking interface table for a VRRP virtual forwarder which consists of a
          sequence (i.e., one or more conceptual rows) of
          'zxr10VrrpVFTrackIfEntry' items."                      "An entry in the zxr10VrrpVFTrackIfTable containing the tracking
          characteristics of a VRRP virtual forwarder. On a VRRP router,
          a given virtual router is identified by a combination
          of the IF name and VRID. Rows in the table cannot be modified."                       $"The interface name of VRRP groups."                       ^"This object contains the Virtual Router Identifier (VRID) of the
        tracked interface."                       $"The name of the tracked interface."                      "The current state of the tracked interface. This object has
         two defined values:
           - `up', which indicates the protocol status of the tracked interface.
           - `down', which indicates the protocol status of the tracked interface."                       b"This object specifies the priority to be reduced when 
          the tracked interface is down."                       #"The policy of tracking interface."                       %"The interface index of VRRP groups."                       %"The index of the tracked interface."                       J"The table of tracking detect associated with the VRRP virtual forwarder."                      *"An entry in the table contains a tracking detect that is
         associated with a virtual forwarder. The number of rows for
         a given ifName and VrId will equal the number of tracking detect
         associated by the virtual forwarder.
         Rows in the table cannot be modified."                       $"The interface name of VRRP groups."                       o"This object contains the Virtual Router Identifier (VRID) of the
         virtual forwarder tracking detect."                       6"The name of tracking detect for a virtual forwarder."                       6"The type of tracking detect for a virtual forwarder."                       6"The type of tracking detect for a virtual forwarder."                       6"The type of tracking policy for a virtual forwarder."                       \"The assigned reduced priority when tracking detect down for a virtual
         forwarder."                       4"The tracking detect state for a virtual forwarder."                       %"The interface index of VRRP groups."                              