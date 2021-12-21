--*****************************************************************
-- ZXR10-AAA-MIB
-- OAM
-- 2013-10-24 16:30  zhuhuaxing
-- Copyright (c) 1985-2013 by ZTE Corp.
-- All rights reserved. 
--*****************************************************************
   +"The true value of AAA authoritarian type."               ("The true value of AAA accounting type."               ,"The true value of AAA authentication type."                                             "M6000 60 AAA config MIB" d"       Zang Liang
            Tel:    +86-25-52870000
            E-Mail: zang.liang@zte.com.cn " "201510081000Z" "201408071000Z" "201401061000Z" "201310241000Z" "201012250000Z" �"1.add new type for zxr10AAAauthenType.
             2.add new type for zxr10AAAauthorType.
             3.add new type for zxr10AAAacctType" s"1.Change STATUS of leaf zxr10AAAauthenDiameterGroup to obsolete.
             2.Add leaf zxr10AAAauthenDimGroup." �"1.modify zxr10AAAauthenTable description.
             2.modify zxr10AAAauthenEntry description.
             3.modify zxr10AAAauthorEntry description."�"1.leaf zxr10AAAauthenRadiusGroup obsolete
             2.leaf zxr10AAAauthenRadGroup add
             3.leaf zxr10AAAauthorRadiusGroup obsolete
             4.leaf zxr10AAAauthorRadGroup add
             5.leaf zxr10AAAacctFirstRadiusGroup obsolete
             6.leaf zxr10AAAacctFirstRadGroup add
             7.leaf zxr10AAAacctSecondRadiusGroup obsolete
             8.leaf zxr10AAAacctSecondRadGroup add" 9"This mib defines management information objects for AAA"               1"A table containing aaa authen temp information."                       $"Information about aaa authen temp."                       "The AAA authen temp number."                       ""The AAA authen temp description."                       "The AAA authen type."                       "The AAA authen radius Group."                       "The AAA authen tacacs Group."                        "The AAA authen diameter Group."                       "The AAA authen radius Group."                        "The AAA authen diameter Group."                       1"A table containing aaa author temp information."                       $"Information about aaa author temp."                       "The AAA author temp number."                       ""The AAA author temp description."                       "The AAA author type."                       "The AAA author tacacs Group."                       "The AAA author radius Group."                       "The AAA author radius Group."                       /"A table containing aaa acct temp information."                       ""Information about aaa acct temp."                       "The AAA acct temp number."                        "The AAA acct temp description."                       "The AAA acct type."                       ""The AAA acct first radius Group."                       #"The AAA acct second radius Group."                       "The AAA acct tacacs Group."                       ""The AAA acct first radius Group."                       #"The AAA acct second radius Group."                      