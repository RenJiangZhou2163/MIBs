>--  ************************************************
--  $Id: ZXR10-PROPAGATE-MIB.mib 2013-05$
--
--  ZXR10-PROPAGATE-MIB.mib: ZXR10 PROPAGATE MIB file
--
--  MAY. 2013, Zhao Yanhua
--
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                                         !"ZTE PROPAGATE MIB
            " t"       Zhao yanhua
            Tel:    +86-25-52870000
            E-Mail: zhao.yanhua3@zte.com.cn
            " "201308211610Z" "201307031110Z" "201305201230Z" z"Modify: index sequence of zxr10PropagateSecRelationTable and 
            zxr10PropagateLspRelationTable.
            " ?"Add zxr10PropagateSecPhb, zxr10PropagateLspPhb.
            " 8"Initial version of Propagate MIB module.
            "                           '"Propagate configure table of Section."                       1"Defines an entry in the zxr10PropagateSecTable."                       "Section ID"                       �"Propagate is enabled or disabled on this section:
         -`true', which indicates that propagate is enabled,
         -`false', which indicates that propagate is disabled."                       "PHB value"                           #"Propagate configure table of LSP."                       1"Defines an entry in the zxr10PropagateLspTable."                       "Tunnel ID"                       "LSP ID"                       �"Propagate is enabled or disabled on this LSP:
        - `true', which indicates that propagate is enabled,
        - `false', which indicates that propagate is disabled."                       "PHB value"                           ."Propagate relation table from Secion to LSP."                       9"Defines an entry in the zxr10PropagateSecRelationTable."                       "Section ID"                       "Tunnel ID"                       "LSP ID"                           *"Propagate relation table from LSP to PW."                       9"Defines an entry in the zxr10PropagateLspRelationTable."                       "Tunnel ID"                       "LSP ID"                       	"PW Name"                                  