                   P"The MIB module to describe traps for  the  OSPF
          Version 2 Protocol.""                      Fred Baker
           Postal:                Cisco Systems
                                  519 Lado Drive
                                  Santa Barbara, California 93111
           Tel:                   +1 805 681 0115
           E-Mail:                fred@cisco.com

                                  Rob Coltun
           Postal:                RainbowBridge Communications
           Tel:                   (301) 340-9416
           E-Mail:                rcoltun@rainbow-bridge.com"       !-- Fri Jan 20 12:25:50 PST 1995
          L"A four-octet string serving as a bit  map  for
           the trap events defined by the OSPF traps. This
           object is used to enable and  disable  specific
           OSPF   traps   where  a  1  in  the  bit  field
           represents enabled.  The right-most bit  (least
           significant) represents trap 0."                       �"Potential types  of  configuration  conflicts.
           Used  by the ospfConfigError and ospfConfigVir-
           tError traps."                       "OSPF packet types."                       f"The IP address of an inbound packet that  can-
           not be identified by a neighbor instance."                          f"An ospfIfStateChange trap signifies that there
           has  been a change in the state of an OSPF vir-
           tual interface.
           This trap should be generated when  the  inter-
           face  state  regresses  (e.g., goes from Point-
           to-Point to Down) or progresses to  a  terminal
           state (i.e., Point-to-Point)."                �"An  ospfNbrStateChange  trap  signifies   that
           there  has been a change in the state of a non-
           virtual OSPF neighbor.   This  trap  should  be
           generated  when  the  neighbor  state regresses
           (e.g., goes from Attempt or Full  to  1-Way  or
           Down)  or progresses to a terminal state (e.g.,
           2-Way or Full).  When an  neighbor  transitions
           from  or  to Full on non-broadcast multi-access
           and broadcast networks, the trap should be gen-
           erated  by the designated router.  A designated
           router transitioning to Down will be  noted  by
           ospfIfStateChange."                Y"An ospfIfStateChange trap signifies that there
           has  been a change in the state of an OSPF vir-
           tual neighbor.  This trap should  be  generated
           when  the  neighbor state regresses (e.g., goes
           from Attempt or  Full  to  1-Way  or  Down)  or
           progresses to a terminal state (e.g., Full)."                �"An ospfIfConfigError  trap  signifies  that  a
           packet  has  been received on a non-virtual in-
           terface  from  a  router  whose   configuration
           parameters  conflict  with this router's confi-
           guration parameters.  Note that the  event  op-
           tionMismatch  should  cause  a  trap only if it
           prevents an adjacency from forming."                ~"An ospfConfigError trap signifies that a pack-
           et  has  been  received  on a virtual interface
           from a router  whose  configuration  parameters
           conflict   with   this  router's  configuration
           parameters.  Note that the event optionMismatch
           should  cause a trap only if it prevents an ad-
           jacency from forming."                2"An ospfIfAuthFailure  trap  signifies  that  a
           packet  has  been received on a non-virtual in-
           terface from a router whose authentication  key
           or  authentication  type  conflicts  with  this
           router's authentication key  or  authentication
           type."                "An ospfVirtIfAuthFailure trap signifies that a
           packet has been received on a virtual interface
           from a router whose authentication key  or  au-
           thentication  type conflicts with this router's
           authentication key or authentication type."                 �"An ospfIfRxBadPacket trap  signifies  that  an
           OSPF  packet has been received on a non-virtual
           interface that cannot be parsed."                 �"An ospfRxBadPacket trap signifies that an OSPF
           packet has been received on a virtual interface
           that cannot be parsed."                E"An ospfTxRetransmit  trap  signifies  than  an
           OSPF  packet  has  been retransmitted on a non-
           virtual interface.  All packets that may be re-
           transmitted  are associated with an LSDB entry.
           The LS type, LS ID, and Router ID are  used  to
           identify the LSDB entry."                <"An ospfTxRetransmit  trap  signifies  than  an
           OSPF packet has been retransmitted on a virtual
           interface.  All packets that may be retransmit-
           ted  are  associated with an LSDB entry. The LS
           type, LS ID, and Router ID are used to identify
           the LSDB entry."                �"An ospfOriginateLsa trap signifies that a  new
           LSA  has  been originated by this router.  This
           trap should not be invoked for simple refreshes
           of  LSAs  (which happesn every 30 minutes), but
           instead will only be invoked  when  an  LSA  is
           (re)originated due to a topology change.  Addi-
           tionally, this trap does not include LSAs  that
           are  being  flushed  because  they have reached
           MaxAge."                 �"An ospfMaxAgeLsa trap signifies  that  one  of
           the LSA in the router's link-state database has
           aged to MaxAge."                 �"An ospfLsdbOverflow trap  signifies  that  the
           number of LSAs in the router's link-state data-
           base has exceeded ospfExtLsdbLimit."                 �"An ospfLsdbApproachingOverflow trap  signifies
           that  the  number of LSAs in the router's link-
           state database has exceeded ninety  percent  of
           ospfExtLsdbLimit."                q"An ospfIfStateChange trap signifies that there
           has been a change in the state of a non-virtual
           OSPF interface. This trap should  be  generated
           when  the interface state regresses (e.g., goes
           from Dr to Down) or progresses  to  a  terminal
           state  (i.e.,  Point-to-Point, DR Other, Dr, or
           Backup)."                         O"These objects are required  to  control  traps
           from OSPF systems."                     "The compliance statement "   I"This group is optional but recommended for all
           OSPF systems"            