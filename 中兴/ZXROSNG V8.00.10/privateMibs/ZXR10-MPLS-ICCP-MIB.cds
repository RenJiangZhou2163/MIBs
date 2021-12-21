K-- *****************************************************************
-- ZXR10-MPLS-ICCP-MIB.mib 
-- MPLS Label Distribution Protocol MIB Definitions
-- zhangjie00067308
-- 2013-2-19
--
-- Copyright (c) 1985-2008 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
--
                         �"This MIB contains managed object definitions for the
             'Inter-Chassis Communication Protocol for L2VPN PE Redundancy,
             ICCP' document." p"Zhang Jie
              Tel:    +86-18068809926
              E-Mail: zhang.jie17@zte.com.cn 
             " "201406261200Z" "201401091200Z" "201302281200Z"u"modify: change DEFVAL from number to defined word 
                      of below tables or nodes:
                   zxr10IccpRgAppCfgMlacpEnble zxr10IccpRgAppCfgMcPortEnble
                   zxr10IccpRgAppCfgMcPwEnble zxr10IccpRgAppCfgArpEnble
                   zxr10IccpRgAppCfgMacEnble zxr10IccpRgPeerState
                   zxr10IccpRgAppState
             " �"add: zxr10IccpRgAppCfgMacEnble in zxr10IccpRgAppCfgTable 
                  mac in SYNTAX of zxr10IccpRgAppStateAppType
             " "Initial revision."       -- June 26, 2014
               R"ICCP RG Table. This table contains
                     one entry per rg table."                       w"The parameter of a rg entity containing statistics 
                information about a particular Redundancy Group."                       |"The identifier of a redundancy group.The maximum
                         range can be configured is dynamically defined."                       "The host name of the rg."                       Z"ICCP Peer Table. This table contains
                    one entry per iccp peer table."                       s"The parameter of a rg peer entity containing statistics 
                information about a particular rg peer."                       '"The identifier of a redundancy group."                       8"The identifier of peer lsr used to identify a session."                       X"ICCP App Table. This table contains
                    one entry per iccp app table."                       q"The parameter of a rg app entity containing statistics 
                information about a particular rg app."                       '"The identifier of a redundancy group."                       &"The mlacp applied status in this rg."                       ("The mc-port applied status in this rg."                       &"The mc-pw applied status in this rg."                       $"The arp applied status in this rg."                       $"The mac applied status in this rg."                       f"ICCP Peer State Table. This table contains
                    one entry per iccp peer state table."                       s"The parameter of a rg peer entity containing statistics 
                information about a particular rg peer."                       '"The identifier of a redundancy group."                       8"The identifier of peer lsr used to identify a session."                       )"Indicates the status of the rg connect."                       d"Rg Apply Protocol Table. This table contains
                    one entry per iccp rg app table."                       s"The parameter of a app entity in a rg containing statistics 
                information about a particular app."                       '"The identifier of a redundancy group."                       &"The type of the app applied in a rg."                       8"The identifier of peer lsr used to identify a session."                       2"Indicates the status of the app connect in a rg."                                                          