                                                           	"P2MP TE" �"ZTE Corporation
                 Nanjing Institute of ZTE Corporation
                 No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
                 Tel: +86-25-52870000 " "201601291000Z" "201512031000Z" "201508061000Z" "201507101000Z" "201502101000Z" "201402171000Z" "201401211000Z" "201308291700Z" "201306070000Z" �"Modify the range of zxr10P2mpTeLocTnnlCfgMinTxInter, The old min value is 10,The new min value is 3.
                   Modify the range of zxr10P2mpTeLocTnnlCfgMinRxInter, The old min value is 10,The new min value is 3."P"Add the leaf bfd of zxr10P2mpTeLocTnnlCfgTable.
                   Add the leaf MinTxInter of zxr10P2mpTeLocTnnlCfgTable.
                   Add the leaf MinRxInter of zxr10P2mpTeLocTnnlCfgTable.
                   Add the leaf Mult of zxr10P2mpTeLocTnnlCfgTable.
                   Add the leaf e2e of zxr10P2mpTeLocTnnlCfgTable."3"Modify the range of zxr10P2mpTeLeafTnnlCfgRootTnnlID,The old value is 65535,The new value is 200.
                   Modify the range of zxr10P2mpTeLocTnnlName,The old value is 0,The new value is 1.
                   Modify the range of zxr10P2mpTeLeafTnnlName,The old value is 0,The new value is 1.
                   Modify the description of zxr10P2mpTeHopRowStatus and zxr10P2mpTeHopStorageType.
                   Modify the MAX-ACCESS of zxr10P2mpTeFrrBackupTunnelIndex,zxr10P2mpTeFrrProtectedIfName,zxr10P2mpTeFrrInnerLabel,and zxr10P2mpTeFrrStatus." P"Add a new field zxr10P2mpTeLocTnnlCfgEscapepath in Zxr10P2mpTeLocTnnlCfgEntry."a"Modify the range and MAX-ACCESS field of zxr10P2mpTeLocTnnlCfgBandwith in zxr10P2mpTeLocTnnlCfgEntry.
                   Modify the MAX-ACCESS field of zxr10P2mpTeLocTnnlCfgSetupprio in zxr10P2mpTeLocTnnlCfgEntry.
                   Modify the MAX-ACCESS field of zxr10P2mpTeLocTnnlCfgHoldprio in zxr10P2mpTeLocTnnlCfgEntry.
                   Modify the range and MAX-ACCESS field of zxr10P2mpTeLocTnnlCfgResvStyle in zxr10P2mpTeLocTnnlCfgEntry.
                   Modify the MAX-ACCESS field of zxr10P2mpTeLspResvStyle in zxr10P2mpTeLspEntry.
                   Add new table zxr10P2mpTeDsteCfgTable." L"Modify the range of destlist name,The old value is 20,The new value is 16." /"Add zxr10P2mpTeFrrDBTable for frr of mtunnel." /"Add some new fields for crankback of mtunnel." "ADD P2MP TE MIB"                       ""                       ""                       "P2mp Local tunnel Name ."                       "P2mp Local tunnel Index."                       +"The destlist type of P2mp Local tunnel  ."                       1"The destlist type of P2mp Local tunnel is Name."                       /"The destlist type of P2mp Local tunnel is Id."                       +"P2mp Local tunnel is configed Integrity ."                       ."P2mp Local tunnel is configed Integrity RRO."                       +"The total bandwith of P2mp Local tunnel ."                       &"The Setupprio of P2mp Local tunnel ."                       %"The Holdprio of P2mp Local tunnel ."                       &"The ResvStyle of P2mp Local tunnel ."                       '"The ReopEnable of P2mp Local tunnel ."                       *"The CrankbackMode of P2mp Local tunnel ."                        "The Frr of P2mp Local tunnel ."                       '"The Escapepath of P2mp Local tunnel ."                       '"The bfd enable of P2mp Local tunnel ."                       ."The bfd MinTxInterval of P2mp Local tunnel ."                       ."The bfd MinRxInterval of P2mp Local tunnel ."                       +"The bfd multiplier of P2mp Local tunnel ."                       '"The e2e enable of P2mp Local tunnel ."                       "Row status"                       ""                       ""                       "P2mp Leaf Tunnel Name."                       "P2mp Leaf Tunnel index."                       $"The IngressId of P2mp Leaf Tunnel."                        "The Index of P2mp Leaf Tunnel."                       !"The P2mpId of P2mp Leaf Tunnel."                       "RowStatus."                       ""                       ""                      g"The canonical name assigned to the tunnel. This name can be used
            to refer to the tunnel on the LSR's console port.If
            mplsTETunnelIsIf is set to true then the ifName of the interface
            corresponding to this tunnel should have a value equal to
            mplsTETunnelName. Also see the description of ifName in RFC 2863."                       %"The dste class type of this tunnel."                       $"The dste bandwidth of this tunnel."                       "Row status."                       ""                       ""                       "The Name of destlist."                       "row status."                       ""                       ""                       "The id of destlist."                       "row status."                       ""                       ""                       "The Name of destlist."                       *"The destination address of destlistname."                       *"The destination address of destlistname."                       "The pathtype of destname."                       $"The explicit pathname of destname."                       ""The explicit pathid of destname."                       "Row status."                       ""                       ""                       "The id of destlist."                       $"The destination address of destid."                       "The pathopt num of destid."                       "The pathtype of destid."                       %"The explicitpathname of destlistid."                       "The expicit pathid of destid."                       "Row status."                       ""                       ""                       "P2mp Local tunnel Index."                       "P2mp Local tunnel Name ."                       $"The p2mpid of P2mp Local tunnel  ."                       '"The inuselspid of P2mp Local tunnel ."                       ("The creationtime of P2mp Local tunnel."                       ""The uptime of P2mp Local tunnel."                       '"The operstatus of P2mp Local tunnel ."                       ("The adminstatus of P2mp Local tunnel ."                       ""                       ""                       "P2mp Leaf tunnel Index."                       "P2mp Leaf tunnel Name ."                       &"The operstatus of P2mp root tunnel ."                       ""                       ""                       "P2mp Te Lsp Name ."                       "P2mp Te Lsp P2mpId ."                       "P2mp Te Lsp Index."                       "P2mp Te Lsp IngressId."                       "P2mp Te Lsp PrevHop."                       "P2mp Te Lsp Bandwith."                       "P2mp Te Lsp Setupprio."                       "P2mp Te Lsp Holdprio."                       "P2mp Te Lsp Integrity."                       "P2mp Te Lsp RRO."                       "P2mp Te Lsp RevStyle."                       "P2mp Te Lsp Role."                       "P2mp Te Lsp CreationTime."                       !"The operstatus of P2mp Te lsp ."                       $"The CrankbackMode of P2mp Te lsp ."                       ""                       ""                       "P2mp Te SubLsp TunnelIndex ."                       "P2mp Te SubLsp P2mpId ."                       "P2mp Te SubLsp LSPId."                       "P2mp Te SubLsp IngressAddr."                       "P2mp Te SubLsp DestAddr ."                       "P2mp Te SubLsp PrevHop ."                       "P2mp Te SubLsp InLabel."                       "P2mp Te SubLsp OutLabel."                       "P2mp Te SubLsp InIfName."                       "P2mp Te SubLsp OutIfName."                       ("P2mp Te SubLsp Src SubGroupOriginType."                       $"P2mp Te SubLsp Src SubGroupOrigin."                        "P2mp Te SubLsp Src SubGroupID."                       $"P2mp Te SubLsp SubGroupOriginType."                        "P2mp Te SubLsp SubGroupOrigin."                       "P2mp Te SubLsp SubGroupID."                       "P2mp Te SubLsp hopindex."                       "P2mp Te SubLsp chopindex."                       "P2mp Te SubLsp arhopindex."                       "P2mp Te SubLsp UpTime."                       "P2mp Te SubLsp CreationTime."                       "P2mp Te SubLsp UpTime."                       "P2mp Te SubLsp OperStatus."                       ""                       ""                       X"Primary index into this table identifying a
        particular explicit route object."                       �"Secondary index into this table identifying a
        particular group of hops representing a particular
        configured path. This is otherwise known as a path
        option."                       >"Tertiary index into this table identifying a particular hop."                       *"The Hop Address Type of this tunnel hop."                       -"The Tunnel Hop Address for this tunnel hop."                      	"If zxr10P2mpTeHopAddrType is set to ipv4(1) or
         ipv6(2), then this value will contain an
         appropriate prefix length for the IP address in
         object zxr10P2mpTeHopIpAddr. Otherwise this value
         is irrelevant and should be ignored. "                       �"If zxr10P2mpTeHopAddrType is set to asnumber(3), then
         this value will contain the AS number of this hop.
         Otherwise the agent should set this object to zerolength
         string and the manager should ignore this."                      �"If zxr10P2mpTeHopAddrType is set to unnum(4), then
        this value will contain the interface identifier of
        the unnumbered interface for this hop. This object
        should be used in conjunction with
        zxr10P2mpTeHopIpAddr which would contain the LSR
        Router ID in this case. Otherwise the agent should
        set this object to zero-length string and the
        manager should ignore this."                      S"If zxr10P2mpTeHopAddrType is set to lspid(5), then
        this value will contain the LSPID of a tunnel of
        this hop. The present tunnel being configured is
        tunneled through this hop (using label stacking).
        This object is otherwise insignificant and should
        contain a value of 0 to indicate this fact."                       �"Denotes whether this tunnel hop is routed in a
         strict or loose fashion. The value of this object
         has no meaning if the zxr10P2mpTeHopInclude object
         is set to false."                      �"If this value is set to true, then this indicates
        that this hop must be included in the tunnel's
        path. If this value is set to 'false', then this hoph
        must be avoided when calculating the path for this
        tunnel. The default value of this object is 'true',
        so that by default all indicated hops are included
        in the CSPF path computation. If this object is set
        to 'false' the value of zxr10P2mpTeHopType should be
        ignored."                       �"The description of this series of hops as they
     relate to the specified path option. The
     value of this object SHOULD be the same for
     each hop in the series that comprises a
     path option."                      �"If this value is set to dynamic, then the user
         should only specify the source and destination of
         the path and expect that the CSPF will calculate
         the remainder of the path. If this value is set to
         explicit, the user should specify the entire path
         for the tunnel to take. This path may contain
         strict or loose hops. Each hop along a specific
         path SHOULD have this object set to the same value."                       "Row status."                       &"The storage type for this Hop entry."                       ""                       ""                       P"Primary index into this table identifying a
    particular computed hop list."                       F"Secondary index into this table identifying the
    particular hop."                       ~"The Hop Address Type of this tunnel hop.
    Note that lspid(5) is a valid option only
    for tunnels signaled via CRLDP."                      �"The Tunnel Hop Address for this tunnel hop.
    The type of this address is determined by the
    value of the corresponding zxr10r10MplsTunnelCHopAddrType.
    If zxr10r10MplsTunnelCHopAddrType is set to unnum(4), then
    this value will contain the LSR Router ID of the
    unnumbered interface. Otherwise the agent should
    set this object to the zero-length string and the
    manager SHOULD ignore this object."                       �"If zxr10P2mpTeCHopAddrType is set to ipv4(1) or
    ipv6(2), then this value will contain an
    appropriate prefix length for the IP address in
    object zxr10P2mpTeCHopIpAddr. Otherwise this value
    is irrelevant and should be ignored."                       �"If zxr10P2mpTeCHopAddrType is set to asnumber(3),
    then this value will contain the AS number of this
    hop. Otherwise the agent should set this object to
    zero-length string and the manager should ignore
    this."                      y"If zxr10P2mpTeCHopAddrType is set to unnum(4), then
    this value will contain the unnumbered interface
    identifier of this hop. This object should be used
    in conjunction with zxr10P2mpTeCHopIpAddr which
    would contain the LSR Router ID in this case.
    Otherwise the agent should set this object to zerolength
    string and the manager should ignore this."                       �"If zxr10P2mpTeCHopAddrType is set to lspid(5), then
    his value will contain the LSP ID of this hop.
    his object is otherwise insignificant and should
    contain a value of 0 to indicate this fact."                       Q"Denotes whether this is tunnel hop is routed in a
    strict or loose fashion."                       ""                       ""                       P"Primary index into this table identifying a
    particular recorded hop list."                       F"Secondary index into this table identifying the
    particular hop."                       }"The Hop Address Type of this tunnel hop.
    ote that lspid(5) is a valid option only
    for tunnels signaled via CRLDP."                      �"The Tunnel Hop Address for this tunnel hop.
    The type of this address is determined by the
    value of the corresponding zxr10r10MplsTunnelARHopAddrType.
    If zxr10P2mpTeARHopAddrType is set to unnum(4),
    then this value contains the LSR Router ID of the
    unnumbered interface. Otherwise the agent SHOULD
    set this object to the zero-length string and the
    manager should ignore this object.
"                      �"If zxr10P2mpTeARHopAddrType is set to unnum(4), then
    this value will contain the interface identifier of
    the unnumbered interface for this hop. This object
    should be used in conjunction with
    zxr10P2mpTeARHopIpAddr which would contain the LSR
    Router ID in this case. Otherwise the agent should
    set this object to zero-length string and the
    manager should ignore this.
"                       �"If zxr10P2mpTeARHopAddrType is set to lspid(5), then
    this value will contain the LSP ID of this hop.
    This object is otherwise insignificant and should
    contain a value of 0 to indicate this fact."                       ""                       ""                       ("P2MP TE FRR Protected Interface Index."                       #"P2MP TE FRR Primary Tunnel Index."                       %"P2MP TE FRR Primary Tunnel P2MP ID."                       '"P2MP TE FRR Primary Tunnel IngressID."                       #"P2MP TE FRR Primary Tunnel LspId."                       %"P2MP TE FRR Primary Tunnel PrevHop."                       %"P2MP TE FRR Primary Tunnel NextHop."                       ""P2MP TE FRR Backup tunnel index."                       '"P2MP TE FRR Protected Interface Name."                       "P2MP TE FRR Inner Label."                       "P2MP TE FRR Status."                                      