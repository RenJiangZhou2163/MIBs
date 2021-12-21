Z--  ******************************************************
--  $Id: ZTE-BFD-MIB.mib 2009-01$
--
--  ZTE-BFD-MIB.mib: 
--    Bidirectional Forwarding Detection MIB file
--  
--  Jan. 2009, Wei Hong Bo
--   
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--
--  ******************************************************
   2"An index used to uniquely identify BFD sessions."               )"The BFD interval delay in microseconds."               "A common BFD diagnostic code."               +"An octet string containing bfd addr type."                                                                                                 "ZTE BFD MIB
        " h"       Zhao yanhua
        Tel:    +86-25-52870000
        E-Mail: zhao.yanhua3@zte.com.cn
        " "201811071639Z" "201603011639Z" "201503091630Z" "201311181936Z" "201305101730Z" "201305071000Z" "201304191130Z" "201303191130Z" "200901070000Z" �"modify:    add subSingleHop(11) for zxr10BfdSessType
                    add subSingleHop(12) for zxr10BfdStatsType      
        " ?"modify:    DESCRIPTION of zxr10BfdSessApplicationId
        " �"modify:    DESCRIPTION of zxr10BfdSessApplicationId
                    add lagBfd(11) for zxr10BfdStatsType
                    add lagBfd(10) for zxr10BfdSessType 
        " �"add:    zxr10BfdSessActualTxInterval
                 zxr10BfdSessActualRxInterval
                 zxr10BfdSessActualDetectMult
         modify: DESCRIPTION of zxr10BfdSessApplicationId  
        " S"modify:    DESCRIPTION of zxr10BfdSessApplicationId                    
        " S"modify:    add rsvpLspBfd(10) for zxr10BfdStatsType                    
        " ;"modify:    zxr10BfdSessType                    
        " �"add:       zxr10BfdSessPwTTL
                    zxr10BfdSessDscp
                    zxr10BfdSessMultiPortMode
                    zxr10BfdStatsTable
        " /"Initial version of this MIB module.
        "                  t"This notification is generated when the
        zxr10BfdSessState object for one or more contiguous 
        entries in zxr10BfdSessTable are about to enter the up(4) 
        state from some other state. The included values of 
        zxr10BfdSessDiag MUST both be set equal to this 
        new state (i.e: up(4)).  The two instances of  
        zxr10BfdSessDiag in this notification indicate the range  
        of indexes that are affected.  Note that all the indexes  
        of the two ends of the range can be derived from the 
        instance identifiers of these two objects.  For the 
        cases where a contiguous range of sessions 
        have transitioned into the up(4) state at roughly 
        the same time, the device SHOULD issue a single 
        notification for each range of contiguous indexes in 
        an effort to minimize the emission of a large number 
        of notifications.  If a notification has to be 
        issued for just a single zxr10BfdSessEntry, then 
        the instance identifier (and values) of the two 
        Zxr10BfdSessIndexTC objects MUST be the identical."                �"This notification is generated when the
        zxr10BfdSessState object for one or more contiguous 
        entries in zxr10BfdSessTable are about to enter the down(2) 
        or adminDown(1) states from some other state. The included  
        values of zxr10BfdSessDiag MUST both be set equal to this 
        new state (i.e: down(2) or adminDown(1)).  The two instances  
        of zxr10BfdSessDiag in this notification indicate the range  
        of indexes that are affected.  Note that all the indexes  
        of the two ends of the range can be derived from the 
        instance identifiers of these two objects.  For 
        cases where a contiguous range of sessions 
        have transitioned into the down(2) or adminDown(1) states  
        at roughly the same time, the device SHOULD issue a single 
        notification for each range of contiguous indexes in 
        an effort to minimize the emission of a large number 
        of notifications.  If a notification has to be 
        issued for just a single zxr10BfdSessEntry, then 
        the instance identifier (and values) of the two 
        Zxr10BfdSessIndexTC objects MUST be the identical."                         �"The global administrative status of BFD in this router.
        The value 'enabled' denotes that the BFD Process is 
        active on at least one interface; 'disabled' disables  
        it on all interfaces."                       1"The current version number of the BFD protocol." ,"BFD Version 0 (draft-katz-ward-bfd-02.txt)"                     �"If this object is set to true(1), then it enables
        the emission of zxr10BfdSessUp and zxr10BfdSessDown 
        notifications; otherwise these notifications are not 
        emitted." �"See also RFC3413 for explanation that  
           notifications are under the ultimate control of the  
           MIB modules in this document."                     e"This object specifies the remote IP address which is
        being associated with L2 BFD session." ""                     3"The BFD Session Table describes the BFD sessions." 1"BFD Version 0 (draft-katz-ward-ciscoBfd-02.txt)"                     ."The BFD Session Entry describes BFD session."                       _"This object contains an index used to represent a
        unique BFD session on this device."                      n"This object contains an index used to indicate
        a local application which owns or maintains this 
        BFD session. This object value may be one of
        the following values or sum of some values which
        indicates that the session is owned by several
        applications:
        BGP_BFD(0x0001),
        OSPF_BFD(0x0002),
        ISIS_BFD(0x0004),
        RSVP_BFD(0x0008),
        LDP_BFD(0x0010),
        STATIC_BFD(0x0020),
        RSVP_LSP_BFD(0x0040),
        LDP_LSP_BFD(0x0080),
        VRRP_BFD(0x0100),
        PBR_BFD(0x0200),
        INSTANCE_BFD(0x0400),
        PIM_BFD(0x0800),
        MSDP_BFD(0x1000),
        RIP_BFD(0x2000),
        GRE_BFD(0x4000),
        RSVP_TUNNEL_BFD(0x8000),
        SIBMGR_BFD(0x10000),
        BIDIR_RSVPLSP_BFD(0x20000),
        LACP_BFD(0x40000),
        L2VPN_BFD(0x80000).
        "                       #"The Init Mode of the BFD session."                       l"This object specifies the local discriminator for this BFD
        session, used to uniquely identify it."                       l"This object specifies the session discriminator chosen
        by the remote system for this BFD session."                       "The source UDP Port for BFD." ""                     )"The perceived state of the BFD session."                      �"This object specifies status of BFD packet reception from
        the remote system. Specifically, it is set to true(1) if 
        the local system is actively receiving BFD packets from the  
        remote system, and is set to false(0) if the local system  
        has not received BFD packets recently (within the detection  
        time) or if the local system is attempting to tear down 
        the BFD session. It is only applicable if this BFD session 
        is running version 0"                       �"A diagnostic code specifying the local system's reason
        for the last transition of the session from up(1)  
        to some other state."                       Y"This object specifies current operating mode that BFD
        session is operating in."                       �"This object indicates that the local system's
        desire to use Demand mode. Specifically, it is set  
        to true(1) if the local system wishes to use  
        Demand mode or false(0) if not"                       �"This object indicates that the local system's
        desire to use Echo mode. Specifically, it is set  
        to true(1) if the local system wishes to use  
        Echo mode or false(0) if not"                      E"This object indicates that the local system's
        ability to continue to function through a disruption of  
        the control plane. Specifically, it is set  
        to true(1) if the local system BFD implementation is 
        independent of the control plane. Otherwise, the  
        value is set to false(0)"                      8"This object specifies IP address type of the neighboring IP
        address which is being monitored with this BFD session.

        Only values unknown(0), ipv4(1) or ipv6(2) 
        have to be supported.  

        A value of unknown(0) is allowed only when  
        the outgoing interface is of type point-to-point, or 
        when the BFD session is not associated with a specific  
        interface. 

        If any other unsupported values are attempted in a set 
        operation, the agent MUST return an inconsistentValue  
        error."                       f"This object specifies the local IP address which is
        being associated with this BFD session."                       k"This object specifies the neighboring IP address which is
        being monitored with this BFD session."                       w"This object specifies the FEC's destination address which is
        being associated with this LDP LSP BFD session."                       l"This object specifies the prefix length which is being associated 
        with this LDP LSP BFD session."                       h"This object specifies the tunnle Id which is being monitored with 
        this RSVP LSP BFD session."                       v"This object specifies the Pseudowire's remote IP address which is
        being monitored with this PW BFD session."                       k"This object specifies the Pseudowire's Vc-Id which is being monitored 
        with this PW BFD session."                       �"This object specifies the minimum interval, in
        microseconds, that the local system would like to use when 
             transmitting BFD Control packets."                       �"This object specifies the minimum interval, in
        microseconds, between received  BFD Control packets the  
        local system is capable of supporting."                       �"This object specifies the minimum interval, in
        microseconds, between received BFD Echo packets that this 
        system is capable of supporting."                       3"This object specifies the Detect time multiplier."                       :"This object specifies the Hold time of this BFD session."                       �"This object indicates that the local system's
        desire to use Authentication. Specifically, it is set  
        to true(1) if the local system wishes the session  
        to be authenticated or false(0) if not"                       �"The Authentication Type used for this BFD session. This
        field is valid only when the Authentication Present bit is set"                       R"The version number of the BFD protocol that this session is
        running in." d"BFD Version 0 (draft-katz-ward-bfd-02.txt) and BFD Version
        1 (draft-ietf-bfd-base-07.txt)"                     "The type of this BFD session."                       w"This object contains an interface index used to indicate
        the interface which this BFD session is running on."                       ("The instance name of this BFD session."                       #"The vrf name of this BFD session."                       ""The pw name of this BFD session."                       ;"This object specifies the min pktLen of this BFD session."                       ;"This object specifies the max pktLen of this BFD session."                       v"This object contains an interface name used to indicate
        the interface which this BFD session is running on."                       "PW TTL of this BFD session."                       5"This object specifies the DSCP value of BFD packet."                       �"This object specifies the UDP port of multi-hop BFD,
        'false' denotes to use UDP port 3784, 'true' denotes
        to use 4784."                       ?"This object specifies the actual Tx interval, inmicroseconds."                       ?"This object specifies the actual Rx interval, inmicroseconds."                       :"This object specifies the actual Detect time multiplier."                       8"This table specifies BFD Session performance counters."                       :"The BFD Session Entry describes BFD session Performance."                       _"This object contains an index used to represent a
        unique BFD session on this device."                       J"The total number of BFD messages received for this BFD
        session."                       ="The total number of BFD messages sent for this BFD session."                       �"The value of sysUpTime on the most recent occasion at which
        the session came up. If no such up event exists this object 
        contains a zero value."                       �"The BFD diag code for the last time communication was lost
        with the neighbor. If no such down event exists this object  
        contains a zero value."                       �"This object specifies the minimum interval, in microseconds, 
        that the local system have transmitting BFD Control packets."                       �"This object specifies the maximum interval, in microseconds, 
        that the local system have transmitting BFD Control packets."                       �"This object specifies the average interval, in microseconds, 
        that the local system have transmitting BFD Control packets."                       �"This object specifies the minimum interval, in microseconds, 
        that the local system have recieving BFD Control packets."                       �"This object specifies the maximum interval, in microseconds, 
        that the local system have recieving BFD Control packets."                       �"This object specifies the average interval, in microseconds, 
        that the local system have recieving BFD Control packets."                       \"This table specifies the relationship between BFD Session Name and
        Session Index."                       g"The BFD Session Entry describes the relationship between BFD Session
        Name and Session Index."                       "The name of this BFD session."                       _"This object contains an index used to represent a
        unique BFD session on this device."                       <"This table specifies the BFD time parameters of interface."                       C"The BFD Session Entry describes BFD time parameters of interface."                       "The name of interface."                       �"This object specifies the minimum interval, in
        microseconds, that the local system would like to use when 
             transmitting BFD Control packets."                       �"This object specifies the minimum interval, in
        microseconds, between received  BFD Control packets the  
        local system is capable of supporting."                       3"This object specifies the Detect time multiplier."                       5"This table contains the statistics of BFD sessions."                       4"The Entry describes the statistics of BFD session."                       "The type of this BFD session."                       L"This object contains the number of BFD session
        which state is up."                       N"This object contains the number of BFD session
        which state is down."                       \"This object contains the number of BFD session
        which state is init or admin down."                          