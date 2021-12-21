                          @"This MIB module provides commonly used textual
                   conventions for tunel policy.

                   Copyright (C) The Internet Society (2003).  This
                   version of this MIB module is part of RFC 3595,
                   see the RFC itself for full legal notices.
                  " "
                  " "201610171600Z" "201404141000Z" "201311111600Z" "200308280000Z"�"modify: 
                         zxTunnelPolicyInstTunnelSelectType      add SYNTAX INTEGER{greTunnel(4))
                         zxTunnelPolicyPWSelectResultSelectType  add SYNTAX INTEGER{greTunnel(4))
                         zxTunnelPolicyPWSelectResultLspType     add SYNTAX INTEGER(greTunnel(4))
                         zxTunnelPolicyVRFSelectResultSelectType add SYNTAX INTEGER{greTunnel(4))
                         zxTunnelPolicyVRFSelectResultLspType    add SYNTAX INTEGER(greTunnel(4))
                         zxTunnelPolicyVRFNh6SelRstType          add SYNTAX INTEGER{greTunnel(5))
                         zxTunnelPolicyVRFNh6SelLspType          add SYNTAX INTEGER(greTunnel(5))
                         " {"add:Ipv6Address  FROM IPV6-TC   in IMPORTS
                     zxTunnelPolicyVRFNh6SelRstTable  
                     "s"modify: 
                         zxTunnelPolicyInstTunnelSelectType      add SYNTAX INTEGER{teEcmp(4))
                         zxTunnelPolicyPWSelectResultSelectType  add SYNTAX INTEGER{teEcmp(4))
                         zxTunnelPolicyPWSelectResultLspType     add SYNTAX  INTEGER(teEcmp(4))

                         zxTunnelPolicyVRFSelectResultSelectType add SYNTAX INTEGER{teEcmp(4))
                         zxTunnelPolicyVRFSelectResultLspType    add SYNTAX INTEGER(teEcmp(4))

                  add:   zxTunnelPolicyInstTeEcmpGroupId in ZxTunnelPolicyInstEntry
                         zxTunnelPolicyInstRmpName       in ZxTunnelPolicyInstEntry
                         zxTunnelPolicyPWSelRstEcmpGrpId in ZxTunnelPolicyPWSelectResultEntry
                         zxTunnelPolicyVRFSelRstEcmpGrp  in ZxTunnelPolicyVRFSelectResultEntry
                         " "Initial version"       -- 17 Oct 2016
       "tunnel policy instance info."                       a"An entry containing management information applicable to a
            tunnel policy instance."                       "tunnel policy name."                       "tunnel policy select type."                       "disable fall back."                       "auto creat."                       "select sequence."                       "tunnel interface name."                       "te ecmp group id."                       "route map name."                       '"pw tunnel policy select result info.."                       k"An entry containing management information applicable to a
            tunnel policy select result info."                       
"pw name."                       "te tunnel name."                       "te tunnel id."                       "pw bandwidth."                       '"tunnel policy instance existing flag."                       "tunnel-policy name."                       "tunnel policy select type."                       "lsp type."                       "te ecmp group id."                       '"pw tunnel policy select result info.."                       k"An entry containing management information applicable to a
            tunnel policy select result info."                       "VRF name."                       "VRF peer ip."                       "te tunnel name."                       "te tunnel id."                       "VRF bandwidth."                       '"tunnel policy instance existing flag."                       "tunnel-policy name."                       "tunnel policy select type."                       "lsp type."                       "te ecmp group id."                       s"A table that contains the information of the VRF nexthop is ipv6 address 
    using tunnel policy select result."                       a"A list of objects containing information applicable to a
      tunnel policy selecting result."                       2"The name of the VRF which applies tunnel policy."                       R"The ipv6 address of the neighbor of the VRF which applies tunnel
       policy."                       N"The name of the TE tunnel which the VRF selects with tunnel
        policy."                       C"The ID of the TE tunnel which the VRF selects with tunnel policy."                       ,"The bandwidth of TE that the VRF requires."                       �"To indicate that the tunnel policy instance exists or not.
             notExist(1):The tunnel policy instance does not exist.
             exist(2) : The tunnel policy instance exists."                       A"The name of the tunnel policy's instance which the VRF selects."                      T"To indicate the tunnel policy type.
             auto(1): auto tunnel policy.
             mplsTe(2):fixed TE tunnel for tunnel policy.
             prefer(3):fixed TE tunnel as preference,if down, select others.
             teEcmp(4):fixed TE ecmp id for tunnel policy.
             greTunnel(5):fixed GRE tunnel for tunnel policy."                      ["To indicate the lsp type of the tunnel which the tunnel policy 
            selects for the VRF. 
             none(1): select none.
             te(2):select a TE tunnel for the VRF.
             ldp(3):select LDP lsp for the VRF.
             teEcmp(4):select te ecmp for the VRF.
             greTunnel(5):select GRE tunnel for the VRF."                       c"The TE ecmp(Equal-cost multi-path) group ID that tunnel policy 
            selects for the VRF."                              