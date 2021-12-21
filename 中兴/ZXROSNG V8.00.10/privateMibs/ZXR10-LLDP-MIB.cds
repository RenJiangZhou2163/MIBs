                                           �"The MIB module to describe part of LLDP protocol data.
         Include some new variable in 802.1AB-2009 compared with
         802.1AB-2005 and some private variable used when the
         protocol is completed." l"       Geng chunjing
         Tel : +86-25-52870000
         E-Mail: geng.chunjing@zte.com.cn
         " "201511200000Z" "201311110000Z" "201306250000Z" "201304100000Z" "201304010000Z" D"Modify the value range of lldpPortMaxNeighbor and lldpMaxNeighbor." ]"Modify the DESCRIPTION of lldpPortTransparentEnable.
         Add the description of using" a"Modify the SYNTAX of lldpV2TxCreditMax.
         From Unsigned32(1..100) to Unsigned32(1..10)."  "Add object lldpGlbAdminStatus." %"Initial version of this MIB module."                  �"The interval at which LLDP frames are transmitted on
            behalf of this LLDP agent during fast transmission period
            (e.g. when a new neighbor is detected).
            The default value for lldpV2MessageFastTx object is
            1 second.
            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." "9.2.5.5 802.1AB-2009"                    %"The maximum number of consecutive LLDPDUs that can be
         transmitted at any time.
         The default value for lldpV2TxCreditMax object is 5 PDUs.
         The value of this object is restored from non-volatile
         storage after a re-initialization of the management system." "9.2.5.17 802.1AB-2009"                    x"The initial value used to initialize the txFast variable
            which determines the number of transmissions that are
            made in fast transmission mode.
            The default value for lldpV2TxFastInit object is 4.
            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." "9.2.5.19 802.1AB-2009"                     �"The Max number of the neighbor to save. 
            The default value for lldpMaxNeighbor object is configured by 
            performance parameter of different projects." "10.3.4 802.1AB-2005"                    5"The administratively desired status of the local LLDP agent.

            If the associated lldpGlbAdminStatus object has a
            value of 'txOnly(1)', then LLDP agent can transmit LLDP
            frames on all ports and it will not store any information
            about the remote systems connected.
         
            If the associated lldpGlbAdminStatus object has a
            value of 'rxOnly(2)', then the LLDP agent can receive,
            but it will not transmit LLDP frames on all ports.

            If the associated lldpGlbAdminStatus object has a
            value of 'txAndRx(3)', then the LLDP agent can transmit
            and receive LLDP frames on all ports.

            If the associated lldpGlbAdminStatus object has a
            value of 'disabled(4)', then LLDP agent will not transmit or
            receive LLDP frames on all ports. If there is remote systems
            information which is received and stored, before lldpGlbAdminStatus
            becomes disabled, then the information will naturally age out."                           S"The table that controls LLDP private config on individual
       ports.
       " "802.1Qau clause 32.2.4"                     �"Part of LLDP configuration information for a particular port.
       This configuration parameter controls the maxnum neighbor the port
       can save and whether or not the received.
       "                      "The index value used to identify the port component
            (contained in the local chassis with the LLDP agent)
            associated with this entry.

            The value of this object is used as a port index to the
            zxr10LldpPortCfgTable."                       �"The Max number of the neighbor is configured by 
            performance parameter of different projects.
            The default value for lldpPortMaxNeighbor object is 8." "10.3.4 802.1AB-2005"                    �"The lldpPortTransparentEnable controls, on a per
            port basis, whether or not the received packets are fowarded.
            The value true(1) means that the port will foward the 
            received packets; the value disable(2) means that the port 
            will not foward the received packets. It is used in the 
            area of switch, not in the area of router. It is reserved for
            compatibility."                                  