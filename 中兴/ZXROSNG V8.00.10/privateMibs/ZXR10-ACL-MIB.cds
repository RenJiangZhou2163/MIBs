X--  ******************************************************
--  $Id: zxr10T8kACL.mib  2010-09-25  liulele $
--
--  zxr10T8kACL.mib: ZXR10 T8000 Access List MIB file
--  
--  Sep. 2010, liu lele 
--   
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--
-- 
--  ******************************************************
                                                                         ."The MIB module to describe the ACL protocol." ^"       Hu Jun
            Tel:    +86-25-52870000
            E-Mail: hu.jun11@zte.com.cn " "201308081500Z" "201308051500Z" "201306081000Z" �"Modify syntax of icmptype icmpcode and HeaderOption:
             1. change the range of icmptype and icmpcode 
             from 0-15 to 0-255
             2. change the descriptino of HeaderOption" �"Modify syntax of port and protcol:
             1. Correct enumeration of port: change pim_atup_rp 
             to pim_auto_rp.
             2. Delete error enumeration of protcol: ip(0)." �"Modify description of bitmap.
             Change hyphen to underline in the labels of 
             the enumeration list.
             Delete some unused definition.
             Add definition about MODULE-IDENTITY."               "IPv4 ACL Table"                       
"IPv4 ACL"                       T"ipv4-access-list
             WORD  Name of an IPv4 access-list (1-31 characters)"                       ="rule
            <1-2147483644>  (Optional)ID of this rule"                       T"deny    Specify packets to reject
             permit  Specify packets to forward"                       "A.B.C.D  Source address"                       "A.B.C.D  Wildcard bits"                       "Any source address"                       "A.B.C.D  Destination address"                       $"A.B.C.D  Destination wildcard bits"                       "Any destination address"                      /"<0-255>   An IP protocol number
              gre      Generic Routing Encapsulation (47)
              icmp     Internet Control Message Protocol(1)
              igmp     Internet Group Management Protocol (2)
              ip       Any internet protocol
              ospf     Open Shortest Path First Protocol (89)
              pim      Protocol Independent Multicast (103)
              tcp      Transmission Control Protocol(6)
              udp      User Datagram Protocol(17)
              vrrp     Virtual Router Redundancy Protocol (112)"                      "eq       (Optional)Match only packets on a given port number                                                                                
            ge       (Optional)Match only packets with a no lower port number                                                                           
            le       (Optional)Match only packets with a no greater port number                                                                         
            range    (Optional)Match only packet on a given port range "                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      "eq       (Optional)Match only packets on a given port number                                                                                
            ge       (Optional)Match only packets with a no lower port number                                                                           
            le       (Optional)Match only packets with a no greater port number                                                                         
            range    (Optional)Match only packet on a given port range "                       "<0-65535>   Port number                                                                         
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                       )"(Optional)Match established connections"                      &"0-254|256            ICMP code
            255                   Any ICMP code
            alternate-address     Alternate address (6)
            echo                  Echo (ping, 8)
            echo-reply            Echo reply (0)
            information-reply     Information replies (16)
            information-request   Information requests (15)
            mask-request          Mask requests (17)
            mask-reply            Mask replies (18)
            parameter-problem     All parameter problems (12)
            redirect              All redirects (5)
            router-advertisement  Router discovery advertisements (9)
            router-solicitation   Router discovery solicitations (10)
            source-quench         Source quenches (4)
            time-exceeded         All time exceededs (11)
            timestamp-reply       Timestamp replies (14)
            timestamp-request     Timestamp requests (13)
            traceroute            Traceroute (30)
            unreachable           All unreachables (3)"                       O"0-254|256      (Optional)ICMP code
             255            Any ICMP code"                       "<0-7>  Precedence level"                       "<0-15>  Type of service(ToS)"                       "<0-63>  DSCP value"                       ""Timerange enable or disable flag"                       ,"time-range  (Optional)Configure time range"                       Y"createAndGo(4)  Configure IPv4 ACL or rule
        destroy(6)  Delete IPv4 ACL or rule"                       !"Fragment enable or disable flag"                      0"Match on the specify TCP flag bit.  
            1 means + , and 0 means -.
            Bit from low to high represents:
            first     :  ack
            second    :  fin
            third     :  psh
            fourth    :  rst
            fifth     :  syn
            sixth     :  urg"                      7"Match when the TCP flag set or not. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  ack
            second    :  fin
            third     :  psh
            fourth    :  rst
            fifth     :  syn
            sixth     :  urg"                      �"Match on the specify ip flag bit. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  DSCP
            second    :  TOS
            third     :  Precedence
            fourth    :  ICMPCode
            fifth     :  ICMPType
            sixth     :  ipprotocol
            seventh   :  fragment    (obsolete, default value 1)"                      J"eq       (Optional)Match only packets on a given ttl value                                                                                
            ge       (Optional)Match only packets with a no lower ttl value                                                                           
            le       (Optional)Match only packets with a no greater ttl value
            neq      (Optional)Match only packets with a no equeal ttl value                                                           
            range    (Optional)Match only packet on a given ttl value range "                       "The TTL value"                       "The TTL value Begin"                       "The TTL value Begin"                       "The acl rule type"                       "IPv6 ACL Table"                       
"IPv6 ACL"                       V"ipv6-access-list  
             WORD  Name of an IPv6 access-list (1-31 characters)"                       ="rule
            <1-2147483644>  (Optional)ID of this rule"                       T"deny    Specify packets to reject
             permit  Specify packets to forward"                       "<0-1048575>  Flowlabel value"                       "<X:X::X:X>  Source address"                       "<0-128>  Source Wildcard"                       "Any source address"                       !"<X:X::X:X>  Destination address"                       "<0-128>  Destination Wildcard"                       "Any destination address"                      0" <0-255>  An IP protocol number
              gre      Generic Routing Encapsulation (47)
              icmp     Internet Control Message Protocol(58)
              igmp     Internet Group Management Protocol (2)
              ip       Any internet protocol
              ospf     Open Shortest Path First Protocol (89)
              pim      Protocol Independent Multicast (103)
              tcp      Transmission Control Protocol(6)
              udp      User Datagram Protocol(17)
              vrrp     Virtual Router Redundancy Protocol (112)"                      "eq       (Optional)Match only packets on a given port number                                                                                
            ge       (Optional)Match only packets with a no lower port number                                                                           
            le       (Optional)Match only packets with a no greater port number                                                                         
            range    (Optional)Match only packet on a given port range "                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      "eq       (Optional)Match only packets on a given port number                                                                                
            ge       (Optional)Match only packets with a no lower port number                                                                           
            le       (Optional)Match only packets with a no greater port number                                                                         
            range    (Optional)Match only packet on a given port range "                       "<0-65535>   Port number                                                                         
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                       )"(Optional)Match established connections"                      0"Match on the specify TCP flag bit.  
            1 means + , and 0 means -.
            Bit from low to high represents:
            first     :  ack
            second    :  fin
            third     :  psh
            fourth    :  rst
            fifth     :  syn
            sixth     :  urg"                      7"Match when the TCP flag set or not. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  ack
            second    :  fin
            third     :  psh
            fourth    :  rst
            fifth     :  syn
            sixth     :  urg"                      g"Matches if the specify IPv6 header is present.
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  hop-by-hop   
            second    :  destopts 
            third     :  routing        
            fourth    :  fragments
            fifth     :  authen 
            sixth     :  esp"                      K"0-254|256               ICMP type
            255                      Any ICMP type
            destination-unreachable  Destination unreachable (1)
            echo-reply               Echo reply (129)
            echo-request             Echo request (ping, 128)
            mld-query                Multicast Listener Discovery Query (130)
            mld-reduction            Multicast Listener Discovery Reduction 
                                     (132)
            mld-report               Multicast Listener Discovery Report (131)
            nd-na                    Neighbor discovery neighbor advertisments 
                                     (136)
            nd-ns                    Neighbor discovery neighbor solicitations 
                                     (135)
            packet-too-big           Packet too big (2)
            parameter-problem        All parameter problems (4)
            redirect                 Neighbor redirect (137)
            router-advertisment      Neighbor discovery router advertisments 
                                     (134)
            router-renumbering       All router renumbering (138)
            router-solicitation      Neighbor discovery router solicitations 
                                     (133)
            time-exceeded            Time exceeded (3)"                       Q"0-254|256            ICMP code
            255                   Any ICMP code"                       "<0-63>  DSCP value"                       ""Timerange enable or disable flag"                       ,"time-range  (Optional)Configure time range"                       Y"createAndGo(4)  Configure IPv6 ACL or rule
        destroy(6)  Delete IPv6 ACL or rule"                      �"Match on the specify ip flag bit. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  DSCP
            second    :              (reserved, default value 0)
            third     :              (reserved, default value 0)
            fourth    :  ICMPCode
            fifth     :  ICMPType
            sixth     :  FlowLabel
            seventh   :  ipv6protocol"                       
"Link ACL"                       
"Link ACL"                       T"link-access-list
             WORD  Name of an link access-list (1-31 characters)"                       ="rule
            <1-2147483644>  (Optional)ID of this rule"                       T"deny    Specify packets to reject
             permit  Specify packets to forward"                       "<0-65535>  Link protocal "                       &"<xxxx.xxxx.xxxx>  Source MAC address"                       '"<xxxx.xxxx.xxxx>  Source MAC wildcard"                       *"any               Any source MAC address"                       +"<xxxx.xxxx.xxxx>  Destination MAC address"                       ,"<xxxx.xxxx.xxxx>  Destination MAC wildcard"                       /"any               Any destination MAC address"                       "<0-7>  Value of inner cos"                       "<0-7>  Value of outer cos"                       "<1-4094>  Value of inner vlan"                       "<1-4094>  Value of outer vlan"                       ""Timerange enable or disable flag"                       c"time-range  (Optional)Configure time range
              WORD  Time range name (1-31 characters)"                       O"createAndGo(4)  Configure ACL or rule
        destroy(6)  Delete ACL or rule"                      2"Match on the specify limk flag bit. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  in cos
            second    :  out cos
            third     :  in vlan
            fourth    :  out vlan
            fifth     :  linkprotocol"                       "<1-4094>  Value of inner vlan"                       "<1-4094>  Value of outer vlan"                       "IPv4 Mixed ACL Table"                       "IPv4Mixed ACL"                       _"IPv4Mixed-access-list
             WORD  Name of an IPv4 mixed access-list (1-31 characters)"                       ="rule
            <1-2147483644>  (Optional)ID of this rule"                       T"deny    Specify packets to reject
             permit  Specify packets to forward"                       "<0-65535>  Link protocal "                       &"<xxxx.xxxx.xxxx>  Source MAC address"                       '"<xxxx.xxxx.xxxx>  Source MAC wildcard"                       *"any               Any source MAC address"                       +"<xxxx.xxxx.xxxx>  Destination MAC address"                       ,"<xxxx.xxxx.xxxx>  Destination MAC wildcard"                       /"any               Any destination MAC address"                       "<0-7>  Value of inner cos"                       "<0-7>  Value of outer cos"                       "<1-4094>  Value of inner vlan"                       "<1-4094>  Value of outer vlan"                       "A.B.C.D  Source address"                       "A.B.C.D  Wildcard bits"                       "Any source address"                       "A.B.C.D  Destination address"                       $"A.B.C.D  Destination wildcard bits"                       "Any destination address"                      /" <0-255>  An IP protocol number
              gre      Generic Routing Encapsulation (47)
              icmp     Internet Control Message Protocol(1)
              igmp     Internet Group Management Protocol (2)
              ip       Any internet protocol
              ospf     Open Shortest Path First Protocol (89)
              pim      Protocol Independent Multicast (103)
              tcp      Transmission Control Protocol(6)
              udp      User Datagram Protocol(17)
              vrrp     Virtual Router Redundancy Protocol (112)"                      "eq       (Optional)Match only packets on a given port number                                                                                
            ge       (Optional)Match only packets with a no lower port number                                                                           
            le       (Optional)Match only packets with a no greater port number                                                                         
            range    (Optional)Match only packet on a given port range "                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      "eq       (Optional)Match only packets on a given port number                                                                                
            ge       (Optional)Match only packets with a no lower port number                                                                           
            le       (Optional)Match only packets with a no greater port number                                                                         
            range    (Optional)Match only packet on a given port range "                       "<0-65535>   Port number                                                                         
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                       )"(Optional)Match established connections"                      &"0-254|256            ICMP type
            255                   Any ICMP type
            alternate-address     Alternate address (6)
            echo                  Echo (ping, 8)
            echo-reply            Echo reply (0)
            information-reply     Information replies (16)
            information-request   Information requests (15)
            mask-request          Mask requests (17)
            mask-reply            Mask replies (18)
            parameter-problem     All parameter problems (12)
            redirect              All redirects (5)
            router-advertisement  Router discovery advertisements (9)
            router-solicitation   Router discovery solicitations (10)
            source-quench         Source quenches (4)
            time-exceeded         All time exceededs (11)
            timestamp-reply       Timestamp replies (14)
            timestamp-request     Timestamp requests (13)
            traceroute            Traceroute (30)
            unreachable           All unreachables (3)"                       Q"0-254|256            ICMP code
            255                   Any ICMP code"                       "<0-7>  Precedence level"                       "<0-15>  Type of service(ToS)"                       "<0-63>  DSCP value"                       ""Timerange enable or disable flag"                       ,"time-range  (Optional)Configure time range"                       e"createAndGo(4)  Configure IPv4 Mixed ACL or rule
        destroy(6)  Delete IPv4 Mixed ACL or rule"                      �"Match on the specify ip flag bit. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  DSCP
            second    :  TOS
            third     :  Precedence
            fourth    :  ICMPCode
            fifth     :  ICMPType
            sixth     :  ipprotocol
            seventh   :  fragment    (obsolete, default value 1)"                      2"Match on the specify limk flag bit. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  in cos
            second    :  out cos
            third     :  in vlan
            fourth    :  out vlan
            fifth     :  linkprotocol"                       "<1-4094>  Value of inner vlan"                       "<1-4094>  Value of outer vlan"                       !"Fragment enable or disable flag"                       "IPv6 Mixed ACL Table"                       "IPv6 Mixed ACL"                       _"IPv6Mixed-access-list
             WORD  Name of an IPv6 Mixed access-list (1-31 characters)"                       ="rule
            <1-2147483644>  (Optional)ID of this rule"                       T"deny    Specify packets to reject
             permit  Specify packets to forward"                       "<0-65535>  Link protocal "                       &"<xxxx.xxxx.xxxx>  Source MAC address"                       '"<xxxx.xxxx.xxxx>  Source MAC wildcard"                       *"any               Any source MAC address"                       +"<xxxx.xxxx.xxxx>  Destination MAC address"                       ,"<xxxx.xxxx.xxxx>  Destination MAC wildcard"                       /"any               Any destination MAC address"                       "<0-7>  Value of inner cos"                       "<0-7>  Value of outer cos"                       "<1-4094>  Value of inner vlan"                       "<1-4094>  Value of outer vlan"                       "<0-1048575>  Flowlabel value"                       "X:X::X:X  Source address"                       "<0-128>  Source Wildcard"                       "Any source address"                       "X:X::X:X  Destination address"                       "<0-128>  Destination Wildcard"                       "Any destination address"                      0" <0-255>  An IP protocol number
              gre      Generic Routing Encapsulation (47)
              icmp     Internet Control Message Protocol(58)
              igmp     Internet Group Management Protocol (2)
              ip       Any internet protocol
              ospf     Open Shortest Path First Protocol (89)
              pim      Protocol Independent Multicast (103)
              tcp      Transmission Control Protocol(6)
              udp      User Datagram Protocol(17)
              vrrp     Virtual Router Redundancy Protocol (112)"                      "eq       (Optional)Match only packets on a given port number                                                                                
            ge       (Optional)Match only packets with a no lower port number                                                                           
            le       (Optional)Match only packets with a no greater port number                                                                         
            range    (Optional)Match only packet on a given port range "                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      "eq       (Optional)Match only packets on a given port number                                                                                
            ge       (Optional)Match only packets with a no lower port number                                                                           
            le       (Optional)Match only packets with a no greater port number                                                                         
            range    (Optional)Match only packet on a given port range "                       "<0-65535>   Port number                                                                         
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                      A"<0-65535>   Port number                                                                                                          
            bootpc       Bootstrap protocol (BOOTP) client (68)                                                                               
            bootps       Bootstrap protocol (BOOTP) server (67)                                                                               
            domain       Domain name service (DNS, 53)                                                                                        
            ntp          Network time protocol (123)                                                                                          
            pim-auto-rp  PIM auto-RP (496)                                                                                                    
            rip          Routing information protocol (router, in.routed, 520)                                                                
            snmp         Simple network management protocol (161)                                                                             
            snmptrap     SNMP traps (162)                                                                                                     
            tftp         Trivial file transfer protocol (69)"                       )"(Optional)Match established connections"                      0"Match on the specify TCP flag bit.  
            1 means + , and 0 means -.
            Bit from low to high represents:
            first     :  ack
            second    :  fin
            third     :  psh
            fourth    :  rst
            fifth     :  syn
            sixth     :  urg"                      7"Match when the TCP flag set or not. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  ack
            second    :  fin
            third     :  psh
            fourth    :  rst
            fifth     :  syn
            sixth     :  urg"                      g"Matches if the specify IPv6 header is present.
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  hop-by-hop   
            second    :  destopts 
            third     :  routing        
            fourth    :  fragments
            fifth     :  authen 
            sixth     :  esp"                      K"0-254|256               ICMP type
            255                      Any ICMP type
            destination-unreachable  Destination unreachable (1)
            echo-reply               Echo reply (129)
            echo-request             Echo request (ping, 128)
            mld-query                Multicast Listener Discovery Query (130)
            mld-reduction            Multicast Listener Discovery Reduction 
                                     (132)
            mld-report               Multicast Listener Discovery Report (131)
            nd-na                    Neighbor discovery neighbor advertisments 
                                     (136)
            nd-ns                    Neighbor discovery neighbor solicitations 
                                     (135)
            packet-too-big           Packet too big (2)
            parameter-problem        All parameter problems (4)
            redirect                 Neighbor redirect (137)
            router-advertisment      Neighbor discovery router advertisments 
                                     (134)
            router-renumbering       All router renumbering (138)
            router-solicitation      Neighbor discovery router solicitations 
                                     (133)
            time-exceeded            Time exceeded (3)"                       W"0-254|256               ICMP code
            255                      Any ICMP code"                       "<0-63>  DSCP value"                       ""Timerange enable or disable flag"                       ,"time-range  (Optional)Configure time range"                       e"createAndGo(4)  Configure IPv6 Mixed ACL or rule
        destroy(6)  Delete IPv6 Mixed ACL or rule"                      �"Match on the specify ip flag bit. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  DSCP
            second    :              (reserved, default value 0)
            third     :              (reserved, default value 0)
            fourth    :  ICMPCode
            fifth     :  ICMPType
            sixth     :  FlowLabel
            seventh   :  ipv6protocol"                      2"Match on the specify limk flag bit. 
            1 means setted , and 0 means not.
            Bit from low to high represents:
            first     :  in cos
            second    :  out cos
            third     :  in vlan
            fourth    :  out vlan
            fifth     :  linkprotocol"                       "<1-4094>  Value of inner vlan"                       "<1-4094>  Value of outer vlan"                      