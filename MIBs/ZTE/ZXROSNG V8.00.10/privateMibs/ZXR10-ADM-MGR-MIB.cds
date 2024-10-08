     "All task name."                                                                                     W"The MIB module to describe the information for 
            administrator management" \"Chen wenbo
             Tel: +86-25-52870000 
             E-Mail: chen.wenbo@zte.com.cn" "201807230000Z" "201807170000Z" "201801310000Z" "201711250000Z" "201710171120Z" "201508170000Z" "201504280000Z" "201504200000Z" "201503030000Z" "201412020000Z" "201411180000Z" "201406240000Z" "201311290000Z" "201309180000Z" "201303051500Z" x"Add node zxr10AdmmgrAuthorWebAllowed,zxr10AdmmgrAuthorConsoleAllowed and
            zxr10AdmmgrAuthorOnlyTelnetAllow" )"Add node zxr10AdmmgrStrongPwdMinCharSet" ^"Add node zxr10AdmmgrPwdRelatedUsrSubstChk and 
            zxr10AdmmgrPwdRelatedUsrInverChk" $"Add node zxr10AdmmgrStrongPwdCheck" '"Add node zxr10AdmmgrIsPwdIrreversible" q"Add task l2protocoltunnel(2317),nhrp(2318) and 
             rpl(3084) in TEXTUAL-CONVENTION AdmmgrSysTaskName" g"Modify word spelling error,
             Add task fcoe(1286) in TEXTUAL-CONVENTION AdmmgrSysTaskName" ="Add task meap(3595) in TEXTUAL-CONVENTION AdmmgrSysTaskName" c"Change the description of zxr10AdmmgrFailuedUserIpv4
             and zxr10AdmmgrFailuedUserIpv6""Change the length range of zxr10AdmmgrAuthenAAATemplate,
             zxr10AdmmgrAuthorAAATemplate,zxr10AdmmgrCmdGroupName,
             zxr10AdmmgrUserGroupPassword,zxr10AdmmgrFailuedUser,
             zxr10AdmmgrOnlineUserIpaddr,zxr10admmgrOnlineUserOnlineTime,
             zxr10admmgrOnlineUserLoginTime,zxr10admmgrOnlineUserIdleTime,
             zxr10AdmmgrarRoleName,zxr10AdmmgrRoleDescription,
             zxr10AdmmgrriInheritRoleName,zxr10AdmmgrrtgTaskGroupName,
             zxr10AdmmgrTaskGrpDescription,zxr10AdmmgrtgiInheritGroupName.
             Change the description of zxr10AdmmgrStrongPwdNumber,
             zxr10AdmmgrStrongPwdCapital,zxr10AdmmgrStrongPwdLowercase,
             zxr10AdmmgrStrongPwdSpecial,zxr10AdmmgrUserLock,
             zxr10AdmmgrUserOncePwd" �"Change the default value of 
            zxr10AdmmgrAccountSwitch and zxr10AdmmgrRoleBasedModel,
            Change the length range of zxr10AdmmgrAuthorDescription"�"Add scalar node,zxr10AdmmgrRoleBasedModel,
             Add tables,zxr10AdmmgrRoleTable,zxr10AdmmgrRoleInheritTable,
             zxr10AdmmgrRoleTaskGroupTable,zxr10AdmmgrTaskGroupTable,
             zxr10AdmmgrtgInheritTable,zxr10AdmmgrTaskGroupTaskTable,
             zxr10AdmmgrAuthorRoleTable,zxr10AdmmgrUserPrivLocalTable,
             zxr10AdmmgrRolePrivCfgTable,zxr10AdmmgrRolePrivDefTable,
             zxr10AdmmgrOnlineUserInfoTable,
             Add TEXTUAL-CONVENTION AdmmgrSysTaskName" ~"Change the max length of 
            zxr10AdmmgrUserName,zxr10AdmmgrShowLockStateUser,
            zxr10AdmmgrFailuedUser"�"Change the range of 
                zxr10AdmmgrAccountSwitch, zxr10AdmmgrGlobalEnableTemplate
                zxr10AdmmgrAsciiAuthenTemplate, zxr10AdmmgrAsciiAuthorTemplate, 
                zxr10AdmmgrStrongPwdMinLength, zxr10AdmmgrAuthenFailTime, 
                zxr10AdmmgrAuthenLockMinute, zxr10AdmmgrDefaultAuthenTemplate,
                zxr10AdmmgrDefaultAuthorTemplate, zxr10AdmmgrLoginBlockSeconds, 
                zxr10AdmmgrLoginBlockAttempts,zxr10AdmmgrLoginBlockWatchSec,
                zxr10AdmmgrLoginBlockFailTimes, zxr10AdmmgrUserPassword, 
                zxr10AdmmgrUserAuthenTemplate,zxr10AdmmgrUserAuthorTemplate, 
                zxr10AdmmgrUserPwdQuestion, zxr10AdmmgrUserPwdAnswer, 
                zxr10AdmmgrUserEnableTemplate,
                zxr10AdmmgrAuthenAAATemplate, zxr10AdmmgrAuthenAclV4, 
                zxr10AdmmgrAuthenAclV6,
                zxr10AdmmgrAuthenDescription,zxr10AdmmgrAuthorAAATemplate,
                zxr10AdmmgrAuthorLoginMax, zxr10AdmmgrAuthorFtpTopdir,
                zxr10AdmmgrAuthorSFtpTopdir.
                Change the value of zxr10AdmmgrAccountSwitch.
                Add node zxr10AdmmgrLogFileNone, zxr10AdmmgrFailuedSeqNum.
                Change syntax of zxr10AdmmgrFailuedTime" &" Initial version of this MIB module."                   1"Global command account function (off(1) ,on(2))"                       @"Bind aaa account template(2001-2128),
        0 invalid value"                       !" Default privilege level(0..15)"                       7" Global enable authentication type (local(2), aaa(1))"                       W"Global enable aaa authentication bind template number(1-128),
       0 invalid value"                       L"ASCII authentication bind template number(1-128),
        0 invalid value"                       L"ASCII authortication bind template number(1-128),
        0 invalid value"                       H"The minimum length(6..32) of strong password,
        0 invalid value"                       7"If password must contain number, true(1), not must(2)"                       8"If password must contain capital, true(1), not must(2)"                       :"If password must contain lowercase, true(1), not must(2)"                       B"If password must contain special character, true(1), not must(2)"                       `"The user authentication restriction of continuous failure 
       times(3-16),0 invalid value"                       x"The  user lock minutes(1-1440),
        0 invalid value,
        if reaching continuous authentication failure times"                       M"Default authentication bind template number(1-128),
       0 invalid value"                       M"Default authortication bind template number(1-128),
       0 invalid value"                       :"Block period in second(1-65535),
       0 invalid value"                       T"The max number of continuous login failure times(1-65535),
       0 invalid value"                       :"Watch period in second(1-65535),
       0 invalid value"                       f"Create the log or trap once reaching continuous login failure 
       times(1..100),0 invalid value"                       *"IPv4 ACL for Filtering user connections."                       )"IPv6 ACL for Filtering user connections"                       R"Global command role-based model switch function 
       (enable(1) ,disable(2))"                       D"The status of strong password check
       (enable(1),disable(2))"                       _"Check the substring associated with username(case insensitive)
       (enable(1),disable(2))"                       U"Check the inverse substring associated with username
       (enable(1),disable(2))"                      "The number of character types that must be included in the password, 
        The character sets contains number, uppercase, lowercase and 
        sepcial characters. 
        The default value is 0.
        There is no limit on the number of character types by default."                               "User name table"                       "User name entry."                       "User name"                       
"Password"                       M"Authentication bind template number(1-128)for user,
       0 invalid value"                       L"Authorization bind template number(1-128)for user,
       0 invalid value"                       )"If user locked, (locked(1),unlocked(2))"                       k"If user need to modify password when the user first login on,
        oncepassword(1),nononcepassword(2)"                       %"User password duration days(0..360)"                       )"User password recover reminder question"                       '"User password recover reminder answer"                       4"User enable authentication type local(2) or aaa(1)"                       �"User enable authentication bind template number(1-128),
       0 invalid value
        if the enable authentication type is aaa"                       e"If the password is irreversible encryption,
       0 invalid value (irreversible(1),reversible(2))"                       "User authentication table"                       "User authentication entry."                       ("Authentication template number(1..128)"                       F"AAA authentication template number(1..2128),
       0 invalid value"                       )"IPv4 ACL of the authentication template"                       )"IPv6 ACL of the authentication template"                       ("Authentication method (chap(2),pap(1))"                       ,"The description of authentication template"                       "User authorization table"                       "User authorization entry."                       '"Authorization template number(1..128)"                       E"AAA authorization template number(1..2128),
       0 invalid value"                       V"Local privilege level:
        (0..15)  valid value
        255      invalid value"                       /"Set command group mode exclusive(1) or not(2)"                       O"Set the max times(1..60) user login in the same time,
       0 invalid value"                       +"The description of authorization template"                       "The ftp top directory name"                       E"If ftp top directory access read only configed, true(1) or false(2)"                       F"If ftp top directory access read write configed, true(1) or false(2)"                       @"If ftp top directory access copy configed, true(1) or false(2)"                       "The sftp top directory name"                       F"If sftp top directory access read only configed, true(1) or false(2)"                       G"If sftp top directory access read write configed, true(1) or false(2)"                       A"If sftp top directory access copy configed, true(1) or false(2)"                       V"Whether to allow users to login via telnet and console,
        true(1) or false(2)"                       >"Whether to allow users to login via SSH, true(1) or false(2)"                       >"Whether to allow users to login via FTP, true(1) or false(2)"                       >"Whether to allow users to login via web, true(1) or false(2)"                       B"Whether to allow users to login via console, true(1) or false(2)"                       A"Whether to allow users to login via telnet, true(1) or false(2)"                       "The command group table"                       "The command group entry."                       '"Authorization template number(1..128)"                       "The command group name"                       "The log file permission table"                        "The log file permission entry."                       '"Authorization template number(1..128)"                       Y"Logfile type, cmd log(1), alarm log(2), 
        nat log(3), li log(4), service log(5)"                       ;"If logfile access read only configed, true(1) or false(2)"                       <"If logfile access read write configed, true(1) or false(2)"                       6"If logfile access copy configed, true(1) or false(2)"                       6"If logfile access none configed, true(1) or false(2)"                       ("Roles of authorization templeate table"                       ("Roles of authorization templeate entry"                       '"Authorization template number(1..128)"                       "Role name"                           "User group table"                       "User group entry."                       "The user group name"                       "User in the group"                       "The password"                           "User lock state table"                       "User lock state entry."                       "The username "                       "The failed login times"                       $"The lock state locked(1) or not(2)"                       /"The remain minutes of a locked user to unlock"                       V"Login failure information table,
             recorded when login block function on"                       !"Login failure information entry"                       "The username "                        "The IPv4 address of the login "                        "The IPv6 address of the login "                       "The login type "                       "The login failure time"                       #"The login failure sequence number"                       "Login block state table"                       "Login block state entry"                       *"Login type, telnet(1), ssh(2), or ftp(3)"                       E"Router presently in Watch_Mode(1), Quiet_Mode(2), or Normal_Mode(3)"                       6"How many seconds remains in current login block mode"                       #"Login failure count in Watch-Mode"                       "Online user information table"                       "Online user information entry"                       "Username of online user"                       "Access type of online user"                       "Vtyno of online user"                       "IP address of online user"                       "Online time of online user"                       "Login time of online user"                       "Idle time of online user"                       "Local user privilege table"                       "Local user privilege entry"                       "Local user name(1..65)"                       "Task name"                       1"If task has read privilege, true(1) or false(2)"                       2"If task has write privilege, true(1) or false(2)"                       4"If task has execute privilege, true(1) or false(2)"                       2"If task has debug privilege, true(1) or false(2)"                       #"Configurated role privilege table"                       #"Configurated role privilege entry"                       "Configurated role name(1..48)"                       "Task name"                       1"If task has read privilege, true(1) or false(2)"                       2"If task has write privilege, true(1) or false(2)"                       4"If task has execute privilege, true(1) or false(2)"                       2"If task has debug privilege, true(1) or false(2)"                       "Default role privilege table"                       "Default role privilege entry"                       "Default role name(1..48)"                       "Task name"                       1"If task has read privilege, true(1) or false(2)"                       2"If task has write privilege, true(1) or false(2)"                       4"If task has execute privilege, true(1) or false(2)"                       2"If task has debug privilege, true(1) or false(2)"                           "Role table"                       "Role entry"                       "Role name"                       "The description of role"                       "Role inherit table"                       "Role inherit entry"                       "Role name"                       "Inherit role name"                       "Role-related taskgroups table"                        "Role-related taskgroups entry."                       "Role name"                       "Taskgroup name"                           "Taskgroup table"                       "Taskgroup entry"                       "Taskgroup name"                       "The description of taskgroup"                       "Taskgroup inherit table"                       "Taskgroup inherit entry"                       "Taskgroup name"                       "Inherit taskgroup name"                       "Taskgroup task table"                       "taskgroup task entry."                       "Taskgroup name"                       "Task class name,
             advancedsysmanagement(1),
             sysmanagement(2),
             basicservice(3),
             flowmonitoring(4),
             idc(5),
             ipservice(6),
             lawfulinterception(7), 
             multicast(8),
             vpn(9),
             reliability(10),
             qos(11),
             routemanage(12),
             aaa(13),
             security(14),
             pppoeclient(15),
             accesslist(16),
             bras(17)"                       "Task name"                       7"If task permission read configed, true(1) or false(2)"                       8"If task permission write configed, true(1) or false(2)"                       :"If task permission execute configed, true(1) or false(2)"                       8"If task permission debug configed, true(1) or false(2)"                                  