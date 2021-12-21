)--  ******************************************************
--  $Id: trace.mib 2008-03$
--
--  zesr.mib: ZXR10 Access List MIB file
--
--  Nov. 2008, Zhong Yan
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--  ******************************************************
   "if PE option of mac trace"               ""The type of mac trace hop result"               "lsp trace pw type"               "The type of trace hop result"               #"The type used to crontrol tracing"               "lsp trace option"               "lsp trace type"               
"Hop type"                                                                                                 "ZTE TRACE MIB
            " t"       Zhao yanhua
            Tel:    +86-25-52870000
            E-Mail: zhao.yanhua3@zte.com.cn
            " "201408251939Z" "201403071004Z" "201309051924Z" "201308080930Z" "201305310930Z" "201303191130Z" "200811240000Z"�"Add     MactraceHopsResult;
             update  DESCRIPTION of zxr10LspTraceCtlTable;
                     DESCRIPTION of zxr10LspTraceCtlEntry;
                     DESCRIPTION of zxr10LspTraceResultsTabl;
                     DESCRIPTION of zxr10LspTraceHopsTable;
                     DESCRIPTION of zxr10MacTraceCtlTable;
                     DESCRIPTION of zxr10MacTraceHopsTable;
                     DESCRIPTION of zxr10TraceRouteCtlVrfType;
                     DESCRIPTION of lspTraceTrapResult;
                     DESCRIPTION of lspTraceTrapHops;
                     DESCRIPTION of macTraceTrapResult;
                     Zxr10MacTraceHopsEntry;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop0;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop1;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop2;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop3;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop4;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop5;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop6;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop7;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop8;
                     DESCRIPTION and SYNTAX of zxr10MacTraceHopsResultValidHop9.
            " 2"Add     zxr10TraceRouteCtlDataSize
            "g"Add     zxr10LspTraceCtlReplyMode for pw ping ttl tlv;
                     zxr10LspTraceHopsV6Addr for ipv6 trace;
                     zxr10LspTraceHopsV6Addr in lspTraceTrapHops 
                     for ipv6 trace;
                     zxr10LspTraceHopsResultValid in lspTraceTrapHops 
                     because it's omitted before
            " ?"Add description for zxr10MacTraceHopsEntryOwner
            "b"update  zxr10LspTraceCtlPwDestAddr to obsolete
                     zxr10LspTraceCtlPwVcId to obsolete
                     zxr10LspTraceCtlPwType to obsolete
                     zxr10LspTraceCtlTraceType add v6ldp(3)
                     zxr10LspTraceCtlLspType add tunnel(3)
             fix comling error and update descriptions.
            ""Add trace MIB (zte.zxr10.trace.zxr10TraceRoute)
             Add    zxr10LspTraceCtlMultiSegment
                    zxr10LspTraceCtlLdpV6Prefix
                    zxr10LspTraceCtlLdpV6PrefixLen
                    zxr10LspTraceCtlOutInterface
                    zxr10LspTraceCtlLspType
                    zxr10LspTraceCtlSrcIpAddr
                    zxr10LspTraceCtlV6SrcIpAddr
                    zxr10LspTraceCtlDownstreamMapType
             fix comling error and update descriptions.
            " 3"Initial version of this MIB module.
            "                       4"The object will return a value while trace finish."                 4"The object will return a value while trace finish."                 +"the description of lsp trace information."                       "lsp trace control entry"                       !"lsp trace control serial number"                       3"lsp trace type (0:ldp, 1:rsvpTe, 2:vccv, 3:v6ldp)"                       "ldp prefix"                       "ldp prefix length"                       "tunnel name "                       "pw peer address"                       	"pw vcid"                       "if select option,default:none"                       "timeout,default:3"                       "ttl,default:30"                       	"if trap"                       "controls to start lsp trace"                       "entry owner"                       #"lsp pw type (0:etherVlan,1:ether)"                       	"pw name"                       -"Indicate if the pw is multi-segment or not."                       "IPv6 ldp prefix"                       "IPv6 ldp prefix length"                       #"out-interface for tracing packets"                       "te-tunnel lsp type"                       !"Source IPv4 address for tracing"                       !"Source IPv6 address for tracing"                       �"Downstream mapping type
            - 0, Downstream Mapping in RFC4379
            - 1, Downstream Detailed Mapping in RFC6424"                       E"The reply mode by the receiving router receive an MPLS echo request"                       2"the description of lsp trace results information"                       "lsp trace result entry"                        "lsp trace result serial number"                       "valid hops count"                       "entry owner"                       0"the description of lsp trace hops information."                       "lsp trace hops entry"                       "lsp trace hops serial number"                       "Hop index"                       �"Hop Result (0:valid,1:success,2:downstreamRouterButNotTarget,
                      3:requestNotTransmitted,4:timeout,5:unreachable)"                       ,"Hop Type (0:Ingress,1:Downstream,2:Egress)"                       "Hop Address"                       "Hop Label"                       	"Hop Mtu"                       	"Hop Rtt"                       "IPv6 hop address"                               4"The object will return a value while trace finish."                 +"the description of mac trace information."                       "mac trace control entry"                       !"mac trace control serial number"                       "destination mac address"                       "if PE option (0:CE,1:PE)"                       "index of out interface on CE"                       
"VFI name"                       "Peer Address"                       "vlan count"                       "Internal VlanId"                       "External VlanId"                       	"if trap"                       "control to start mac trace"                       "entry owner"                       0"the description of mac trace hops information."                       "mac trace hops entry"                       "mac trace hops serial number"                       !"Hop0 Result (0:valid,1:success)"                       "Hop0 Host Name"                       "Hop0 Interface Name"                       "Hop0 Mac Address"                       !"Hop1 Result (0:valid,1:success)"                       "Hop1 Host Name"                       "Hop1 Interface Name"                       "Hop1 Mac Address"                       !"Hop2 Result (0:valid,1:success)"                       "Hop2 Host Name"                       "Hop2 Interface Name"                       "Hop2 Mac Address"                       !"Hop3 Result (0:valid,1:success)"                       "Hop3 Host Name"                       "Hop3 Interface Name"                       "Hop3 Mac Address"                       !"Hop4 Result (0:valid,1:success)"                       "Hop4 Host Name"                       "Hop4 Interface Name"                       "Hop4 Mac Address"                       !"Hop5 Result (0:valid,1:success)"                       "Hop5 Host Name"                       "Hop5 Interface Name"                       "Hop5 Mac Address"                       !"Hop6 Result (0:valid,1:success)"                       "Hop6 Host Name"                       "Hop6 Interface Name"                       "Hop6 Mac Address"                       !"Hop7 Result (0:valid,1:success)"                       "Hop7 Host Name"                       "Hop7 Interface Name"                       "Hop7 Mac Address"                       !"Hop8 Result (0:valid,1:success)"                       "Hop8 Host Name"                       "Hop8 Interface Name"                       "Hop8 Mac Address"                       !"Hop9 Result (0:valid,1:success)"                       "Hop9 Host Name"                       "Hop9 Interface Name"                       "Hop9 Mac Address"                       "Hop entry owner"                              !"Defines the Remote Operations Traceroute Control Table for
            providing the capability of invoking traceroute from a remote
            host.  The results of traceroute operations can be stored in
            the zxr10TraceRouteResultsTable, and the zxr10TraceRouteHopsTable."                       �"Defines an entry in the zxr10TraceRouteCtlTable.  The index
            element, zxr10TraceRouteCtlSerial, is of type Integer32, limited
            to 100 entries."                       "serial number"                       �"The type of a traceroute destination.
             1: IP address, uses zxr10TraceRouteCtlTgtAddr
             2: domain name, uses zxr10TraceRouteCtlDomainName"                       �"Specifies the IP address type for the traceroute
           request, including zxr10TraceRouteCtlDstAddr
           and zxr10TraceRouteCtlSrcAddr."                       \"Specifies the host address used on the traceroute
            request at the remote host."                       w"The name of a traceroute domain. This is locally unique,
            within the scope of a zxr10TraceRouteCtlSerial."                      "Controls the vrf type of traceroute test. This is locally
            unique, within the scope of a zxr10TraceRouteCtlSerial.
              1: not vrf
              2: normal vrf, uses zxr10TraceRouteCtlVrfName
              3: dcn vrf, the vrf name is ?_dcn
            "                       t"The name of a traceroute vrf. This is locally unique,
            within the scope of a zxr10TraceRouteCtlSerial."                       +"Specifies the maximum time-to-live value."                       R"Specifies the time-out value, in seconds, for
            a traceroute request."                       s"Specifies the number of times to reissue a traceroute
           request with the same time-to-live (TTL) value."                      "Use the specified IP address (which must be given as an
            IP number, not a hostname) as the source address in
            outgoing probe packets.  On hosts with more than one IP
            address, this option can be used to select the address
            to be used.  If the IP address is not one of this
            machine's interface addresses, an error is returned, and
            nothing is sent.  A zero-length octet string value for
            this object disables source address specification."                       �"The current path for a traceroute test is kept in the
            zxr10TraceRouteHopsTable on a per-hop basis when the value
            of this object is true(1)."                       e"This object allows to start tracing or destroy entries
            in the zxr10TraceRouteCtlTable."                       �"Specifies the size of the data portion of a traceroute
           request, in octets.
           The value for this object includes IP header size and 
           UDP header size."                      �"Defines the Remote Operations Traceroute Results Table for
            keeping track of the status of a zxr10TraceRouteCtlEntry.

            An entry is added to the zxr10TraceRouteResultsTable when an
            zxr10TraceRouteCtlEntry is started.

            An entry is removed from the zxr10TraceRouteResultsTable when
            its corresponding zxr10TraceRouteCtlEntry is deleted."                       �"Defines an entry in the zxr10TraceRouteResultsTable.  The
            zxr10TraceRouteResultsTable has the same indexing as the
            zxr10TraceRouteCtlTable."                       �"Reflects the current TTL value (from 1 to
            255) for a remote traceroute operation.
            Maximum TTL value is determined by
            zxr10TraceRouteCtlMaxTtl."                       �"Reflects the current probe count (1..10) for
            a remote traceroute operation.  The maximum
            probe count is determined by
            zxr10TraceRouteCtlProbPerHop."                       �"This object indicates the type of address stored
            in the corresponding zxr10TraceRouteResIpTgtAddr
            object."                      ^"This object reports the IP address associated
            with a zxr10TraceRouteCtlTgtAddr value when the
            destination address is specified as a DNS name.
            The value of this object should be a zero-length
            octet string when a DNS name is not specified or
            when a specified DNS name fails to resolve."                       �"The current number of attempts to determine a path
            to a target.  The value of this object MUST be started
            at 0."                       �"The current number of attempts to determine a path
            to a target that have succeeded.  The value of this
            object MUST be reported as 0 when no attempts have
            succeeded."                       �"The date and time when the last complete path
            was determined.  A path is complete if responses
            were received or timeout occurred for each hop on
            the path."                       �"Defines the Remote Operations Traceroute Hop Table for
            keeping track of the results of traceroute tests on a
            per-hop basis."                       �"Defines an entry in the zxr10TraceRouteHopsTable.
            The index elements identify the zxr10TraceRouteCtlEntry
            that a zxr10TraceRouteHopsEntry belongs to."                       /"Specifies the hop index for a traceroute hop."                       �"This object indicates the type of address stored
            in the corresponding zxr10TraceRouteHopsIpTgtAddr
            object."                       �"This object reports the IP address associated with
            the hop.  A value for this object should be reported
            as a numeric IP address, not as a DNS name."                       �"The minimum traceroute round-trip-time (RTT) received for
            this hop.  A value of 0 for this object implies that no
            RTT has been received."                       �"The maximum traceroute round-trip-time (RTT) received for
            this hop.  A value of 0 for this object implies that no
            RTT has been received."                       Q"The current average traceroute round-trip-time (RTT) for
            this hop."                       �"This object contains the sum of the squares of all
            round-trip-times received for this hop.  Its purpose is
            to enable standard deviation calculation."                       �"The value of this object reflects the number of probes sent
            for this hop during this traceroute test.  The value of this
            object should start at 0."                       �"Number of responses received for this hop during this
            traceroute test.  This value of this object should start
            at 0."                       {"Date and time at which the last response was received for a
             probe for this hop during this traceroute test."                          