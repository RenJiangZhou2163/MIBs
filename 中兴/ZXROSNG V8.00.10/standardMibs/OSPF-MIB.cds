     "The range of ifIndex."               ]"The values defined for the priority of a system for
       becoming the designated router."               "The OSPF External Metric."               "An OSPF Area Identifier."               i"The values that one might find or configure for
       variables bounded by the maximum age of an LSA."               q"A positive integer. Values in excess are precluded as
       unnecessary and prone to interoperability issues."              "Type of Service is defined as a mapping to the IP Type of
       Service Flags as defined in the IP Forwarding Table MIB

       +-----+-----+-----+-----+-----+-----+-----+-----+
       |                 |                       |     |
       |   PRECEDENCE    |    TYPE OF SERVICE    |  0  |
       |                 |                       |     |
       +-----+-----+-----+-----+-----+-----+-----+-----+

                IP TOS                IP TOS
           Field     Policy      Field     Policy

           Contents    Code      Contents    Code
           0 0 0 0  ==>   0      0 0 0 1  ==>   2
           0 0 1 0  ==>   4      0 0 1 1  ==>   6
           0 1 0 0  ==>   8      0 1 0 1  ==>  10
           0 1 1 0  ==>  12      0 1 1 1  ==>  14
           1 0 0 0  ==>  16      1 0 0 1  ==>  18
           1 0 1 0  ==>  20      1 0 1 1  ==>  22
           1 1 0 0  ==>  24      1 1 0 1  ==>  26
           1 1 1 0  ==>  28      1 1 1 1  ==>  30

       The remaining values are left for future definition."               "A OSPF Router Identifier."               "The OSPF Internal Metric."               �"The status of an interface: 'enabled' indicates that
       it is willing to communicate with other OSPF Routers,
       while 'disabled' indicates that it is not."               G"The range of intervals on which hello messages are
       exchanged."                                                                         @"The MIB module to describe the OSPF Version 2
       Protocol"S"       Fred Baker
       Postal: Cisco Systems
               519 Lado Drive
               Santa Barbara, California 93111
       Tel:    +1 805 681 0115
       E-Mail: fred@cisco.com

               Rob Coltun
       Postal: RainbowBridge Communications
       Tel:    (301) 340-9416
       E-Mail: rcoltun@rainbow-bridge.com"       !-- Fri Jan 20 12:25:50 PST 1995
          "A  32-bit  integer  uniquely  identifying  the
           router in the Autonomous System.

           By  convention,  to  ensure  uniqueness,   this
           should  default  to  the  value  of  one of the
           router's IP interface addresses." '"OSPF Version 2, C.1 Global parameters"                     �"The  administrative  status  of  OSPF  in  the
           router.   The  value 'enabled' denotes that the
           OSPF Process is active on at least  one  inter-
           face;  'disabled'  disables  it  on  all inter-
           faces."                       F"The current version number of the OSPF  proto-
           col is 2." "OSPF Version 2, Title"                     K"A flag to note whether this router is an  area
           border router." B"OSPF Version 2, Section 3 Splitting the AS into
          Areas"                     h"A flag to note whether this router is  config-
           ured as an Autonomous System border router." D"OSPF Version 2, Section 3.3  Classification  of
          routers"                     g"The number of external (LS type 5)  link-state
           advertisements in the link-state database." K"OSPF Version 2, Appendix A.4.5 AS external link
          advertisements"                    q"The 32-bit unsigned sum of the LS checksums of
           the  external  link-state  advertisements  con-
           tained in the link-state  database.   This  sum
           can  be  used  to determine if there has been a
           change in a router's link state  database,  and
           to  compare  the  link-state  database  of  two
           routers."                       A"The router's support for type-of-service rout-
           ing." D"OSPF Version 2,  Appendix  F.1.2  Optional  TOS
          support"                     �"The number of  new  link-state  advertisements
           that  have been originated.  This number is in-
           cremented each time the router originates a new
           LSA."                       �"The number of  link-state  advertisements  re-
           ceived  determined  to  be  new instantiations.
           This number does not include  newer  instantia-
           tions  of self-originated link-state advertise-
           ments."                      �"The  maximum   number   of   non-default   AS-
           external-LSAs entries that can be stored in the
           link-state database.  If the value is -1,  then
           there is no limit.

           When the number of non-default AS-external-LSAs
           in   a  router's  link-state  database  reaches
           ospfExtLsdbLimit, the router  enters  Overflow-
           State.   The   router  never  holds  more  than
           ospfExtLsdbLimit  non-default  AS-external-LSAs
           in  its  database. OspfExtLsdbLimit MUST be set
           identically in all routers attached to the OSPF
           backbone  and/or  any regular OSPF area. (i.e.,
           OSPF stub areas and NSSAs are excluded)."                      �"A Bit Mask indicating whether  the  router  is
           forwarding  IP  multicast  (Class  D) datagrams
           based on the algorithms defined in  the  Multi-
           cast Extensions to OSPF.

           Bit 0, if set, indicates that  the  router  can
           forward  IP multicast datagrams in the router's
           directly attached areas (called intra-area mul-
           ticast routing).

           Bit 1, if set, indicates that  the  router  can
           forward  IP  multicast  datagrams  between OSPF
           areas (called inter-area multicast routing).

           Bit 2, if set, indicates that  the  router  can
           forward  IP  multicast  datagrams between Auto-
           nomous Systems (called inter-AS multicast rout-
           ing).

           Only certain combinations of bit  settings  are
           allowed,  namely: 0 (no multicast forwarding is
           enabled), 1 (intra-area multicasting  only),  3
           (intra-area  and  inter-area  multicasting),  5
           (intra-area and inter-AS  multicasting)  and  7
           (multicasting  everywhere). By default, no mul-
           ticast forwarding is enabled."                      C"The number of  seconds  that,  after  entering
           OverflowState,  a  router will attempt to leave
           OverflowState. This allows the router to  again
           originate  non-default  AS-external-LSAs.  When
           set to 0, the router will not  leave  Overflow-
           State until restarted."                       *"The router's support for demand routing." ,"OSPF Version 2, Appendix on Demand Routing"                     !"The router's MPLS TE router-id."                       "The router's Process ID."                       �"Information describing the configured  parame-
           ters  and cumulative statistics of the router's
           attached areas." A"OSPF Version 2, Section 6  The Area Data Struc-
          ture"                     �"Information describing the configured  parame-
           ters  and  cumulative  statistics of one of the
           router's attached areas."                       k"A 32-bit integer uniquely identifying an area.
           Area ID 0.0.0.0 is used for the OSPF backbone." ."OSPF Version 2, Appendix C.2 Area parameters"                     �"The authentication type specified for an area.
           Additional authentication types may be assigned
           locally on a per Area basis." +"OSPF Version 2, Appendix E Authentication"         ^-- none (0),
-- simplePassword (1)
-- md5 (2)
-- reserved for specification by IANA (> 2)
         "-- no authentication, by default
 X"The area's support for importing  AS  external
           link- state advertisements." ."OSPF Version 2, Appendix C.2 Area parameters"                     �"The number of times that the intra-area  route
           table  has  been  calculated  using this area's
           link-state database.  This  is  typically  done
           using Dijkstra's algorithm."                       �"The total number of area border routers reach-
           able within this area.  This is initially zero,
           and is calculated in each SPF Pass."                       �"The total number of Autonomous  System  border
           routers  reachable  within  this area.  This is
           initially zero, and is calculated in  each  SPF
           Pass."                       �"The total number of link-state  advertisements
           in  this  area's link-state database, excluding
           AS External LSA's."                      �"The 32-bit unsigned sum of the link-state  ad-
           vertisements'  LS  checksums  contained in this
           area's link-state database.  This sum  excludes
           external (LS type 5) link-state advertisements.
           The sum can be used to determine if  there  has
           been  a  change  in a router's link state data-
           base, and to compare the link-state database of
           two routers."                      �"The variable ospfAreaSummary controls the  im-
           port  of  summary LSAs into stub areas.  It has
           no effect on other areas.

           If it is noAreaSummary, the router will neither
           originate  nor  propagate summary LSAs into the
           stub area.  It will rely entirely  on  its  de-
           fault route.

           If it is sendAreaSummary, the router will  both
           summarize and propagate summary LSAs."                       �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                       "The area's support for TE."                       k"The set of metrics that will be advertised  by
           a default Area Border Router into a stub area." /"OSPF Version 2, Appendix C.2, Area Parameters"                     �"The metric for a given Type  of  Service  that
           will  be  advertised  by  a default Area Border
           Router into a stub area." /"OSPF Version 2, Appendix C.2, Area Parameters"                     �"The 32 bit identifier for the Stub  Area.   On
           creation,  this  can  be  derived  from the in-
           stance."                       �"The  Type  of  Service  associated  with   the
           metric.   On creation, this can be derived from
           the instance."                       �"The metric value applied at the indicated type
           of  service.  By default, this equals the least
           metric at the type of service among the  inter-
           faces to other areas."                       �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                       Y"This variable displays the type of metric  ad-
           vertised as a default route."                       )"The OSPF Process's Link State Database." F"OSPF Version 2, Section 12  Link  State  Adver-
          tisements"                     $"A single Link State Advertisement."                       R"The 32 bit identifier of the Area  from  which
           the LSA was received." ."OSPF Version 2, Appendix C.2 Area parameters"                     �"The type  of  the  link  state  advertisement.
           Each  link state type has a separate advertise-
           ment format." Q"OSPF Version 2, Appendix A.4.1 The  Link  State
          Advertisement header"                     �"The Link State ID is an LS Type Specific field
           containing either a Router ID or an IP Address;
           it identifies the piece of the  routing  domain
           that is being described by the advertisement." ."OSPF Version 2, Section 12.1.4 Link State ID"                     i"The 32 bit number that uniquely identifies the
           originating router in the Autonomous System." 0"OSPF Version 2, Appendix C.1 Global parameters"                    ;"The sequence number field is a  signed  32-bit
           integer.   It  is used to detect old and dupli-
           cate link state advertisements.  The  space  of
           sequence  numbers  is  linearly  ordered.   The
           larger the sequence number the more recent  the
           advertisement." C"OSPF Version  2,  Section  12.1.6  LS  sequence
          number"                     Q"This field is the age of the link state adver-
           tisement in seconds." '"OSPF Version 2, Section 12.1.1 LS age"         -- Should be 0..MaxAge
          �"This field is the  checksum  of  the  complete
           contents  of  the  advertisement, excepting the
           age field.  The age field is excepted  so  that
           an   advertisement's  age  can  be  incremented
           without updating the  checksum.   The  checksum
           used  is  the same that is used for ISO connec-
           tionless datagrams; it is commonly referred  to
           as the Fletcher checksum." ,"OSPF Version 2, Section 12.1.7 LS checksum"                     H"The entire Link State Advertisement, including
           its header." F"OSPF Version 2, Section 12  Link  State  Adver-
          tisements"                    "A range if IP addresses  specified  by  an  IP
           address/IP  network  mask  pair.   For example,
           class B address range of X.X.X.X with a network
           mask  of  255.255.0.0 includes all IP addresses
           from X.X.0.0 to X.X.255.255" /"OSPF Version 2, Appendix C.2  Area parameters"                    "A range if IP addresses  specified  by  an  IP
           address/IP  network  mask  pair.   For example,
           class B address range of X.X.X.X with a network
           mask  of  255.255.0.0 includes all IP addresses
           from X.X.0.0 to X.X.255.255" /"OSPF Version 2, Appendix C.2  Area parameters"                     D"The Area the Address  Range  is  to  be  found
           within." ."OSPF Version 2, Appendix C.2 Area parameters"                     J"The IP Address of the Net or Subnet  indicated
           by the range." ."OSPF Version 2, Appendix C.2 Area parameters"                     D"The Subnet Mask that pertains to  the  Net  or
           Subnet." ."OSPF Version 2, Appendix C.2 Area parameters"                     �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                       �"Subnets subsumed by ranges either trigger  the
           advertisement  of the indicated summary (adver-
           tiseMatching), or result in  the  subnet's  not
           being advertised at all outside the area."                       b"The list of Hosts, and their metrics, that the
           router will advertise as host routes." B"OSPF Version 2, Appendix C.6  Host route param-
          eters"                     e"A metric to be advertised, for a given type of
           service, when a given host is reachable."                       "The IP Address of the Host." A"OSPF Version 2, Appendix C.6 Host route parame-
          ters"                     B"The Type of Service of the route being config-
           ured." A"OSPF Version 2, Appendix C.6 Host route parame-
          ters"                     "The Metric to be advertised." A"OSPF Version 2, Appendix C.6 Host route parame-
          ters"                     �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                       �"The Area the Host Entry is to be found within.
           By  default, the area that a subsuming OSPF in-
           terface is in, or 0.0.0.0" ."OSPF Version 2, Appendix C.2 Area parameters"                     ^"The OSPF Interface Table describes the  inter-
           faces from the viewpoint of OSPF." G"OSPF Version 2, Appendix C.3  Router  interface
          parameters"                     ]"The OSPF Interface Entry describes one  inter-
           face from the viewpoint of OSPF."                       ("The IP address of this OSPF interface."                      "For the purpose of easing  the  instancing  of
           addressed   and  addressless  interfaces;  This
           variable takes the value 0 on  interfaces  with
           IP  Addresses,  and  the corresponding value of
           ifIndex for interfaces having no IP Address."                       �"A 32-bit integer uniquely identifying the area
           to  which  the  interface  connects.   Area  ID
           0.0.0.0 is used for the OSPF backbone."                     -- 0.0.0.0
�"The OSPF interface type.

           By way of a default, this field may be intuited
           from the corresponding value of ifType.  Broad-
           cast LANs, such as  Ethernet  and  IEEE  802.5,
           take  the  value  'broadcast', X.25 and similar
           technologies take the value 'nbma',  and  links
           that  are  definitively point to point take the
           value 'pointToPoint'."                      "The OSPF  interface's  administrative  status.
           The  value formed on the interface, and the in-
           terface will be advertised as an internal route
           to  some  area.   The  value 'disabled' denotes
           that the interface is external to OSPF."                      �"The  priority  of  this  interface.   Used  in
           multi-access  networks,  this  field is used in
           the designated router election algorithm.   The
           value 0 signifies that the router is not eligi-
           ble to become the  designated  router  on  this
           particular  network.   In the event of a tie in
           this value, routers will use their Router ID as
           a tie breaker."                       �"The estimated number of seconds  it  takes  to
           transmit  a  link state update packet over this
           interface."                      "The number of seconds between  link-state  ad-
           vertisement  retransmissions,  for  adjacencies
           belonging to this  interface.   This  value  is
           also used when retransmitting database descrip-
           tion and link-state request packets."                       �"The length of time, in  seconds,  between  the
           Hello  packets that the router sends on the in-
           terface.  This value must be the same  for  all
           routers attached to a common network."                      A"The number of seconds that  a  router's  Hello
           packets  have  not been seen before it's neigh-
           bors declare the router down.  This  should  be
           some  multiple  of  the  Hello  interval.  This
           value must be the same for all routers attached
           to a common network."                       �"The larger time interval, in seconds,  between
           the  Hello  packets  sent  to  an inactive non-
           broadcast multi- access neighbor."                       "The OSPF Interface State."                       *"The IP Address of the Designated Router."                     -- 0.0.0.0
 D"The  IP  Address  of  the  Backup   Designated
           Router."                     -- 0.0.0.0
 i"The number of times this  OSPF  interface  has
           changed its state, or an error has occurred."                      �"The Authentication Key.  If the Area's Author-
           ization  Type  is  simplePassword,  and the key
           length is shorter than 8 octets, the agent will
           left adjust and zero fill to 8 octets.

           Note that unauthenticated  interfaces  need  no
           authentication key, and simple password authen-
           tication cannot use a key of more  than  8  oc-
           tets.  Larger keys are useful only with authen-
           tication mechanisms not specified in this docu-
           ment.

           When read, ospfIfAuthKey always returns an  Oc-
           tet String of length zero." F"OSPF Version 2, Section 9  The  Interface  Data
          Structure"                   -- 0.0.0.0.0.0.0.0
 �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                      �"The way multicasts should  forwarded  on  this
           interface;  not  forwarded,  forwarded  as data
           link multicasts, or forwarded as data link uni-
           casts.   Data link multicasting is not meaning-
           ful on point to point and NBMA interfaces,  and
           setting ospfMulticastForwarding to 0 effective-
           ly disables all multicast forwarding."                       �"Indicates whether Demand OSPF procedures (hel-
           lo supression to FULL neighbors and setting the
           DoNotAge flag on proogated LSAs) should be per-
           formed on this interface."                       �"The authentication type specified for  an  in-
           terface.   Additional  authentication types may
           be assigned locally." +"OSPF Version 2, Appendix E Authentication"         ^-- none (0),
-- simplePassword (1)
-- md5 (2)
-- reserved for specification by IANA (> 2)
         "-- no authentication, by default
 _"The TOS metrics for  a  non-virtual  interface
           identified by the interface index." G"OSPF Version 2, Appendix C.3  Router  interface
          parameters"                     g"A particular TOS metric for a non-virtual  in-
           terface identified by the interface index." G"OSPF Version 2, Appendix C.3  Router  interface
          parameters"                     �"The IP address of this OSPF interface.  On row
           creation,  this  can  be  derived  from the in-
           stance."                      Y"For the purpose of easing  the  instancing  of
           addressed   and  addressless  interfaces;  This
           variable takes the value 0 on  interfaces  with
           IP  Addresses, and the value of ifIndex for in-
           terfaces having no IP Address.   On  row  crea-
           tion, this can be derived from the instance."                       �"The type of service metric  being  referenced.
           On  row  creation, this can be derived from the
           instance."                       �"The metric of using this type  of  service  on
           this interface.  The default value of the TOS 0
           Metric is 10^8 / ifSpeed."                       �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                       C"Information about this router's virtual inter-
           faces." G"OSPF Version  2,  Appendix  C.4   Virtual  link
          parameters"                     /"Information about a single Virtual Interface."                       k"The  Transit  Area  that  the   Virtual   Link
           traverses.  By definition, this is not 0.0.0.0"                       ("The Router ID of the Virtual Neighbor."                       �"The estimated number of seconds  it  takes  to
           transmit  a link- state update packet over this
           interface."                      s"The number of seconds between  link-state  ad-
           vertisement  retransmissions,  for  adjacencies
           belonging to this  interface.   This  value  is
           also used when retransmitting database descrip-
           tion  and  link-state  request  packets.   This
           value  should  be well over the expected round-
           trip time."                       �"The length of time, in  seconds,  between  the
           Hello  packets that the router sends on the in-
           terface.  This value must be the same  for  the
           virtual neighbor."                      1"The number of seconds that  a  router's  Hello
           packets  have  not been seen before it's neigh-
           bors declare the router down.  This  should  be
           some  multiple  of  the  Hello  interval.  This
           value must be the same for the  virtual  neigh-
           bor."                        "OSPF virtual interface states."                       N"The number of state changes or error events on
           this Virtual Link"                      "If Authentication Type is simplePassword,  the
           device  will left adjust and zero fill to 8 oc-
           tets.

           Note that unauthenticated  interfaces  need  no
           authentication key, and simple password authen-
           tication cannot use a key of more  than  8  oc-
           tets.  Larger keys are useful only with authen-
           tication mechanisms not specified in this docu-
           ment.

           When  read,  ospfVifAuthKey  always  returns  a
           string of length zero." F"OSPF Version 2, Section 9  The  Interface  Data
          Structure"                   -- 0.0.0.0.0.0.0.0
 �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                       �"The authentication type specified for a virtu-
           al  interface.  Additional authentication types
           may be assigned locally." +"OSPF Version 2, Appendix E Authentication"         ^-- none (0),
-- simplePassword (1)
-- md5 (2)
-- reserved for specification by IANA (> 2)
         "-- no authentication, by default
 ."A table of non-virtual neighbor information." F"OSPF Version 2, Section 10  The  Neighbor  Data
          Structure"                     ."The information regarding a single neighbor." F"OSPF Version 2, Section 10  The  Neighbor  Data
          Structure"                     �"The IP address this neighbor is using  in  its
           IP  Source  Address.  Note that, on addressless
           links, this will not be 0.0.0.0,  but  the  ad-
           dress of another of the neighbor's interfaces."                       �"On an interface having an  IP  Address,  zero.
           On  addressless  interfaces,  the corresponding
           value of ifIndex in the Internet Standard  MIB.
           On  row  creation, this can be derived from the
           instance."                       �"A 32-bit integer (represented as a type  IpAd-
           dress)  uniquely  identifying  the  neighboring
           router in the Autonomous System."                     -- 0.0.0.0
�"A Bit Mask corresponding to the neighbor's op-
           tions field.

           Bit 0, if set, indicates that the  system  will
           operate  on  Type of Service metrics other than
           TOS 0.  If zero, the neighbor will  ignore  all
           metrics except the TOS 0 metric.

           Bit 1, if set, indicates  that  the  associated
           area  accepts and operates on external informa-
           tion; if zero, it is a stub area.

           Bit 2, if set, indicates that the system is ca-
           pable  of routing IP Multicast datagrams; i.e.,
           that it implements the Multicast Extensions  to
           OSPF.

           Bit 3, if set, indicates  that  the  associated
           area  is  an  NSSA.  These areas are capable of
           carrying type 7 external advertisements,  which
           are  translated into type 5 external advertise-
           ments at NSSA borders." ("OSPF Version 2, Section 12.1.2 Options"                     �"The priority of this neighbor in the designat-
           ed router election algorithm.  The value 0 sig-
           nifies that the neighbor is not eligible to be-
           come  the  designated router on this particular
           network."                       A"The State of the relationship with this Neigh-
           bor." ."OSPF Version 2, Section 10.1 Neighbor States"                     i"The number of times this neighbor relationship
           has changed state, or an error has occurred."                       C"The  current  length  of  the   retransmission
           queue."                       �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                       �"This variable displays the status of  the  en-
           try.   'dynamic'  and  'permanent' refer to how
           the neighbor became known."                       L"Indicates whether Hellos are being  suppressed
           to the neighbor"                       *"A table of virtual neighbor information." +"OSPF Version 2, Section 15  Virtual Links"                     "Virtual neighbor information."                       "The Transit Area Identifier."                       i"A  32-bit  integer  uniquely  identifying  the
           neighboring router in the Autonomous System."                       A"The IP address this Virtual  Neighbor  is  us-
           ing."                      �"A Bit Mask corresponding to the neighbor's op-
           tions field.

           Bit 1, if set, indicates that the  system  will
           operate  on  Type of Service metrics other than
           TOS 0.  If zero, the neighbor will  ignore  all
           metrics except the TOS 0 metric.

           Bit 2, if set, indicates  that  the  system  is
           Network  Multicast  capable; ie, that it imple-
           ments OSPF Multicast Routing."                       B"The state of the  Virtual  Neighbor  Relation-
           ship."                       i"The number of  times  this  virtual  link  has
           changed its state, or an error has occurred."                       C"The  current  length  of  the   retransmission
           queue."                       L"Indicates whether Hellos are being  suppressed
           to the neighbor"                       *"The OSPF Process's Links State Database." F"OSPF Version 2, Section 12  Link  State  Adver-
          tisements"                     $"A single Link State Advertisement."                       �"The type  of  the  link  state  advertisement.
           Each  link state type has a separate advertise-
           ment format." Q"OSPF Version 2, Appendix A.4.1 The  Link  State
          Advertisement header"                     �"The Link State ID is an LS Type Specific field
           containing either a Router ID or an IP Address;
           it identifies the piece of the  routing  domain
           that is being described by the advertisement." ."OSPF Version 2, Section 12.1.4 Link State ID"                     i"The 32 bit number that uniquely identifies the
           originating router in the Autonomous System." 0"OSPF Version 2, Appendix C.1 Global parameters"                    ;"The sequence number field is a  signed  32-bit
           integer.   It  is used to detect old and dupli-
           cate link state advertisements.  The  space  of
           sequence  numbers  is  linearly  ordered.   The
           larger the sequence number the more recent  the
           advertisement." C"OSPF Version  2,  Section  12.1.6  LS  sequence
          number"                     Q"This field is the age of the link state adver-
           tisement in seconds." '"OSPF Version 2, Section 12.1.1 LS age"         -- Should be 0..MaxAge
          �"This field is the  checksum  of  the  complete
           contents  of  the  advertisement, excepting the
           age field.  The age field is excepted  so  that
           an   advertisement's  age  can  be  incremented
           without updating the  checksum.   The  checksum
           used  is  the same that is used for ISO connec-
           tionless datagrams; it is commonly referred  to
           as the Fletcher checksum." ,"OSPF Version 2, Section 12.1.7 LS checksum"                     H"The entire Link State Advertisement, including
           its header." F"OSPF Version 2, Section 12  Link  State  Adver-
          tisements"                                        
"A range of IP addresses  specified  by  an  IP
           address/IP  network  mask  pair.   For example,
           class B address range of X.X.X.X with a network
           mask  of  255.255.0.0 includes all IP addresses
           from X.X.0.0  to  X.X.255.255.   Note  that  if
           ranges  are configured such that one range sub-
           sumes  another  range  (e.g.,   10.0.0.0   mask
           255.0.0.0  and  10.1.0.0 mask 255.255.0.0), the
           most specific match is the preferred one." /"OSPF Version 2, Appendix C.2  Area parameters"                    
"A range of IP addresses  specified  by  an  IP
           address/IP  network  mask  pair.   For example,
           class B address range of X.X.X.X with a network
           mask  of  255.255.0.0 includes all IP addresses
           from X.X.0.0  to  X.X.255.255.   Note  that  if
           ranges are range configured such that one range
           subsumes another  range  (e.g.,  10.0.0.0  mask
           255.0.0.0  and  10.1.0.0 mask 255.255.0.0), the
           most specific match is the preferred one." /"OSPF Version 2, Appendix C.2  Area parameters"                     D"The Area the Address Aggregate is to be  found
           within." ."OSPF Version 2, Appendix C.2 Area parameters"                     �"The type of the Address Aggregate.  This field
           specifies  the  Lsdb type that this Address Ag-
           gregate applies to." Q"OSPF Version 2, Appendix A.4.1 The  Link  State
          Advertisement header"                     J"The IP Address of the Net or Subnet  indicated
           by the range." ."OSPF Version 2, Appendix C.2 Area parameters"                     D"The Subnet Mask that pertains to  the  Net  or
           Subnet." ."OSPF Version 2, Appendix C.2 Area parameters"                     �"This variable displays the status of  the  en-
           try.  Setting it to 'invalid' has the effect of
           rendering it inoperative.  The internal  effect
           (row removal) is implementation dependent."                       �"Subnets subsumed by ranges either trigger  the
           advertisement  of  the indicated aggregate (ad-
           vertiseMatching), or result in the subnet's not
           being advertised at all outside the area."                               ."These objects are required for OSPF systems."                 N"These objects are required  for  OSPF  systems
           supporting areas."                 S"These objects are required  for  OSPF  systems
           supporting stub areas."                 d"These objects are required  for  OSPF  systems
           that display their link state database."                 a"These objects are required for  non-CIDR  OSPF
           systems that support multiple areas."                 Y"These objects are required  for  OSPF  systems
           that support attached hosts."                 ."These objects are required for OSPF systems."                 ."These objects are required for OSPF systems."                 ."These objects are required for OSPF systems."                 ."These objects are required for OSPF systems."                 ."These objects are required for OSPF systems."                 d"These objects are required  for  OSPF  systems
           that display their link state database."                 ."These objects are required for OSPF systems."                     "The compliance statement "                  