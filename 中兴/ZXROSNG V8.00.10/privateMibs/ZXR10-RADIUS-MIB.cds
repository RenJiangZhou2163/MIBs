--*****************************************************************
-- ZXR10-RADIUS-MIB
-- OAM
-- 2013-10-29 10:54  zhuhuaxing
-- Copyright (c) 1985-2013 by ZTE Corp.
-- All rights reserved. 
--*****************************************************************
   )"The true value of radius protocol type."               ."The true value of radius master server flag."                                                                                                     "M6000 60 RADIUS config MIB" `"       Jin Kang
            Tel:    +86-25-52870000
            E-Mail: jin.kang@zte.com.cn " "201709211000Z" "201701061000Z" "201612271000Z" "201508131000Z" "201504281000Z" "201411200000Z" "201403201000Z" "201312021000Z" "201106070000Z" �"1.Add new leaf  locationAndOption82 under zxr10RadAuthenNasPortIdFormat 
             2.Add new leaf  locationAndOption82 under zxr10RadAccountNasPortIdFormat " G"1.Add new leaf zxr10RadAuthenAlgorithm under zxr10RadAuthenGroupTable" j"1.Add new table zxr10RadAuthenNasPortIdTable
             2.Add new table zxr10RadAccountNasPortIdTable""1.The description of leaf zxr10RadAuthenServerLongKey
             2.The description of leaf zxr10RadAuthenServerEncryptLongKey
             3.The description of leaf zxr10RadAccountServerLongKey
             4.The description of leaf zxr10RadAccountServerEncryptLongKey""1.The description of leaf zxr10RadiusAuthenServerIPAddress 
             2.The description of leaf zxr10RadiusAccountServerIPAddress
	     3.The description of leaf zxr10RadAuthenServerIPAddress 
             4.The description of leaf zxr10RadAccountServerIPAddress" d"1.Add new tables zxr10RadiusAuthSvrStatDataTable
             and zxr10RadiusAccSvrStatDataTable." ~"1.leaf zxr10RadAuthenServerID max value modified to 16
             2.leaf zxr10RadAccountServerID max value modified to 16"�"1.zxr10RadiusAuthenGroupTable 
               1.3.6.1.4.1.3902.3.6000.162.1 obsolete
             2.zxr10RadiusAuthenServerTable 
               1.3.6.1.4.1.3902.3.6000.162.2 obsolete
             3.zxr10RadiusAccountGroupTable 
               1.3.6.1.4.1.3902.3.6000.162.3 obsolete
             4.zxr10RadiusAccountServerTable
               1.3.6.1.4.1.3902.3.6000.162.4 obsolete
             5.zxr10RadAuthenGroupTable 
               1.3.6.1.4.1.3902.3.6000.162.5 add
             6.zxr10RadAuthenServerTable 
               1.3.6.1.4.1.3902.3.6000.162.6 add
             7.zxr10RadAccountGroupTable 
               1.3.6.1.4.1.3902.3.6000.162.7 add
             8.zxr10RadAccountServerTable
               1.3.6.1.4.1.3902.3.6000.162.8 add" <"This mib defines management information objects for RADIUS"               ="A table containing radius authentication group information."                       0"Information about radius authentication group."                       )"The RADIUS authentication group number."                       -"The RADIUS authentication group alias name."                       *"The RADIUS authentication protocol type."                       ."The RADIUS authentication Group max retries."                       *"The RADIUS authentication Group timeout."                       D"A table containing RADIUS authentication group server information."                       7"Information about RADIUS authentication group server."                       )"The RADIUS authentication group number."                       0"The RADIUS authentication group server number."                       :"The RADIUS authentication group server if master server."                       4"The RADIUS authentication group server IP Address."                       5"The RADIUS authentication group server port number."                       -"The RADIUS authentication group server key."                       7"The RADIUS authentication group server encrypted key."                       s"This object allows entries to be created and deleted
                       in the zxr10RadiusAuthenServerTable."                       9"A table containing RADIUS accounting group information."                       ,"Information about RADIUS accounting group."                       %"The RADIUS accounting group number."                       )"The RADIUS accounting group alias name."                       &"The RADIUS accounting protocol type."                       *"The RADIUS accounting Group max retries."                       &"The RADIUS accounting Group timeout."                       @"A table containing RADIUS accounting group server information."                       3"Information about RADIUS accounting group server."                       %"The RADIUS accounting group number."                       ,"The RADIUS accounting group server number."                       6"The RADIUS accounting group server if master server."                       0"The RADIUS accounting group server IP Address."                       1"The RADIUS accounting group server port number."                       )"The RADIUS accounting group server key."                       3"The RADIUS accounting group server encrypted key."                       t"This object allows entries to be created and deleted
                       in the zxr10RadiusAccountServerTable."                       ="A table containing radius authentication group information."                       0"Information about radius authentication group."                       '"The RADIUS authentication group name."                       *"The RADIUS authentication protocol type."                       ."The RADIUS authentication Group max retries."                       *"The RADIUS authentication Group timeout."                       ,"The RADIUS authentication group algorithm."                       D"A table containing RADIUS authentication group server information."                       7"Information about RADIUS authentication group server."                       '"The RADIUS authentication group name."                       0"The RADIUS authentication group server number."                       :"The RADIUS authentication group server if master server."                       4"The RADIUS authentication group server IP Address."                       5"The RADIUS authentication group server port number."                       -"The RADIUS authentication group server key."                       7"The RADIUS authentication group server encrypted key."                       1"The RADIUS authentication group server longKey."                       ;"The RADIUS authentication group server encrypted longKey."                       g"This object allows entries to be created and deleted
              in the zxr10RadAuthenServerTable."                       9"A table containing RADIUS accounting group information."                       ,"Information about RADIUS accounting group."                       #"The RADIUS accounting group name."                       &"The RADIUS accounting protocol type."                       *"The RADIUS accounting Group max retries."                       &"The RADIUS accounting Group timeout."                       @"A table containing RADIUS accounting group server information."                       3"Information about RADIUS accounting group server."                       #"The RADIUS accounting group name."                       ,"The RADIUS accounting group server number."                       6"The RADIUS accounting group server if master server."                       0"The RADIUS accounting group server IP Address."                       1"The RADIUS accounting group server port number."                       )"The RADIUS accounting group server key."                       3"The RADIUS accounting group server encrypted key."                       -"The RADIUS accounting group server longKey."                       7"The RADIUS accounting group server encrypted longKey."                       h"This object allows entries to be created and deleted
              in the zxr10RadAccountServerTable."                       k"A table containing RADIUS authentication group 
                      server statistic data information."                       _"Information about RADIUS authentication group 
                       server statistic data."                       )"The RADIUS authentication group number."                       0"The RADIUS authentication group server number."                       3"The RADIUS authentication group server IP Adress."                       �"The number of RADIUS Access-Request packets sent
                       to this server.This does not include retransmissions."                       r"The number of RADIUS Access-Request packets 
                      retransmitted to this RADIUS authentication."                       q"The number of RADIUS Access-Accept packets
                      (valid or invalid) received from this server."                       q"The number of RADIUS Access-Reject packets
                      (valid or invalid) received from this server."                       t"The number of RADIUS Access-Challenge packets
                      (valid or invalid) received from this server."                      W"The number of malformed RADIUS Access-Response 
                      packets received from this server.Malformed packets
                      include packets with an invalid length. Bad 
                      authenticators or signature attributes or unknown 
                      types are not included as malformed access responses."                       �"The number of RADIUS Access-Response packets
                     containing invalid authenticators or Signature
                      attributes received from this server."                      �"The number of RADIUS Access-Request packets
                    destined for this server that have not yet timed out
                    or received a response. This variable is incremented
                    when an Access-Request is sent and decremented due to
                     receipt of an Acess-Accept, Access-Reject or
                    Access-Challenge, a timeout or retransmission."                      �"The number of authentication timeouts to this server.
                        After a timeout the client may retry to the same
                        server, send to a different server, or
                        give up. A retry to the same server is counted as a
                        retransmit as well as a timeout. A send to a different
                        server is counted as a Request as well as a timeout."                       �"The number of RADIUS packets of unknown type which
                      were received from this server on the authentication port."                       �"The number of RADIUS packets of which were
                      received from this server on the authentication port
                      and dropped for some other reason."                       g"A table containing RADIUS accounting group 
                      server statistic data information."                       Y"Information about RADIUS accounting group server
                      statistic data."                       %"The RADIUS accounting group number."                       ,"The RADIUS accounting group server number."                       3"The RADIUS authentication group server IP Adress."                       t"The number of RADIUS Accounting-Request packets
                     sent. This does not include retransmissions."                      E"The number of RADIUS Accounting-Request packets
                      retransmitted to this RADIUS accounting server.
                      Retransmissions include retries where the
                      Identifier and Acct-Delay have been updated, as
                      well as those in which they remain the same.."                       h"The number of RADIUS packets received on the
                       accounting port from this server."                      J"The number of malformed RADIUS Accounting-Response
                       packets received from this server. Malformed packets
                       include packets with an invalid length. Bad
                       authenticators and unknown types are not included as
                       malformed accounting responses."                       �"The number of RADIUS Accounting-Response
                       packets which contained invalid authenticators
                       received from this server."                      �"The number of RADIUS Accounting-Request packets
                       sent to this server that have not yet timed out or
                       received a response. This variable is incremented 
                       when an Accounting-Request is sent and decremented
                       due to receipt of an Accounting-Response, a timeout
                       or a retransmission."                      �"The number of accounting timeouts to this server.
                     After a timeout the client may retry to the same
                     server, send to a different server, or give up.
                     A retry to the same server is counted as a
                     retransmit as well as a timeout. A send to a different
                     server is counted as an Accounting-Request as well as
                     a timeout."                       �"The number of RADIUS packets of unknown type which
                      were received from this server on the accounting 
                      port.."                       �"The number of RADIUS packets which were received from
                    this server on the accounting port and dropped for some
                    other reason.."                       P"A table containing RADIUS authentication group nas-port-id-format information."                       C"Information about RADIUS authentication group nas-port-id-format."                       '"The RADIUS authentication group name."                       ,"The RADIUS authentication group NPIF type."                       ;"The RADIUS authentication group NPIF user-defined string."                       ,"The RADIUS authentication group NPIF slot."                       ,"The RADIUS authentication group NPIF port."                       0"The RADIUS authentication group NPIF sub-slot."                       ,"The RADIUS authentication group NPIF vlan."                       3"The RADIUS authentication group NPIF second-vlan."                       4"The RADIUS authentication group NPIF vlan-invalid."                       ;"The RADIUS authentication group NPIF second-vlan-invalid."                       L"A table containing RADIUS accounting group nas-port-id-format information."                       ?"Information about RADIUS accounting group nas-port-id-format."                       #"The RADIUS accounting group name."                       ("The RADIUS accounting group NPIF type."                       7"The RADIUS accounting group NPIF user-defined string."                       ("The RADIUS accounting group NPIF slot."                       ("The RADIUS accounting group NPIF port."                       ,"The RADIUS accounting group NPIF sub-slot."                       ("The RADIUS accounting group NPIF vlan."                       /"The RADIUS accounting group NPIF second-vlan."                       0"The RADIUS accounting group NPIF vlan-invalid."                       7"The RADIUS accounting group NPIF second-vlan-invalid."                      