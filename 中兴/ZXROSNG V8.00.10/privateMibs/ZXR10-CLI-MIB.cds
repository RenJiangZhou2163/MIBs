?--  ************************************************
--  $Id: zxr10ping.mib 8 2005-07-28 12:17:08Z zhanglh $
--
--  zxr10ping.mib: ZXR10 Ping MIB file
--
--  Mar. 2008, Cailei 153843
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
  �"The reason of a saving configuration operation failed.
                 The description of each reason is given below:
                 noError:      this status signifies that saving 
                               configuration operation is never done, or 
                               the reason data has been aging.
                 commonError:  this status signifies that the common error 
                               happened during saving configuration operation.
                 openFileFailed:   opening configuration file failed.
                 writeFileFailed:  writing configuration file failed.
                 queryConflict:    the configuration is changed during saving.
                 invalidFileName:  the saving configuration file name 
                                   is invalid.
                 pathForbidden:    the path of saving configuration file 
                                   is forbidden for write.
                 invalidPathLevel: the path is deeper than 10 levels.
                 createDirectoryFailed: creating destination directory failed.
                 moduleUnloaded:   the module has been unloaded 
                                   during the execution. "              �"The CLISaveConfigStatus textual convention is 
                       used to save configuration, and is used as 
                       the status of a saving configuration operation.
                       After saving configuration finished for five minutes, 
                       status data will be aging.
 
                 The description of each status is given below:
                 doWrite:     this value is supplied to save configuration.
                              This value may be written, but is never be read.
                 idle:        this status signifies that saving 
                              configuration operation is never done, or 
                              the status data has been aging.
                              This value may be read, but is never be written.
                 running:     this status signifies that the saving 
                              configuration operation is running.
                              This value may be read, but is never be written.
                 success:     the status signifies that the saving 
                              configuration operation is successfully completed.
                              This value may be read, but is never be written.
                 failed:      the saving configuration operation is failed.
                              This value may be read, but is never be written.
                "                                                                                                     "" q"Chen Wenbo
               Tel: 675166      
               E-Mail: chen.wenbo@zte.com.cn    
               " "201808270010Z" "201707070000Z" "201706220000Z" "201501150000Z" "201405070000Z" k"Add startrun download file operation.
                Users can download files using FTP or SFTP server." �"Add automatic save configuration strategy.
                Change description, node name, syntax and OID for 
                save configuration operation and status query node" 3"Add save configuration operation and status query" 0"Change MAX-ACCESS from read-write to read-only" "CLI"                   �"True indicates multiple CLI users are permitted to enter 
            configuration mode. False indicates they are prohibited."                           �"The node is used to save configuration, and is used as 
             the status of a saving configuration operation.
             After saving configuration finished for five minutes, 
             status data will be idle."                       �"The starting time of saving configuration.
             After saving configuration operation finished for five minutes, 
             starting time will be empty string."                       �"The ending time of saving configuration.
             After saving configuration finished for five minutes, 
             ending time will be empty string."                       �"The saving configuration operation failed reason.
             After saving configuration finished for five minutes,  
             the reason will be noError."                       �"The progress of the saving configuration operation.
             After saving configuration finished for five minutes, 
             the progress will be zero."                          "The delay interval of automatic saving 
             configuration when configuration data is changed. 
             Another strategy is to save regularly every day.
             These two strategies are mutually exclusive.
             0 indicates that the policy is closed."                      �"The time of automatic saving configuration time everyday. 
             To convert a time HH:MM:SS into a value in units of
             seconds, the following algorithm should be used:
             value = HH * 3600 + MM * 60 + SS
             Another strategy is to save when configuration data is changed.
             These two strategies are mutually exclusive.
             86400 indicates that the policy is closed."                      �"The CPU usage threshold of automatic saving configuration.
             Configuration will be saved immediately when CPU utilization 
             not reach the threshold. Configuration will be not saved when the 
             threshold is exceeded.
             After the interval, Check CPU utilization again.
             0 indicates that it is not restricted by CPU utilization."                      +"The time interval of automatic saving configuration 
             when CPU utilization reaches to upper limit.
             If the interval is not configured, configuration is not saved
             when exceeds CPU utilization.
             0 indicates that the interval does not take effect."                           z"VPN routing/forwarding instance (VRF). This node and zxr10DownloadDcn cannot
            be configured at the same time"                       k"A special VRF name. This node and zxr10DownloadVrfName cannot
            be configured at the same time"                       �"The mode to download files. Three modes: local, FTP or SFTP.
             Users can choose one mode to download file one time."                      1"The IPv4 address of the FTP/STFP server from 
                which to copy the configuration file. This object
                can not be used with zxr10DownloadServerIPv6Addr at the 
                same time. Values of 0.0.0.0 or FF.FF.FF.FF for
                copyServerAddress are not allowed."                       �"The IPv6 address of the FTP/STFP server from 
                which to copy the configuration file. This object
                can not be used with zxr10DownloadServerIPv4Addr at the 
                same time."                       "Listen port number of server."                       �"User name for downloading via FTP or SFTP protocol.
            This object must be created when the zxr10DownloadType
            is FTP or SFTP."                       �"User password for downloading via FTP or SFTP protocol.
            This object must be created when the zxr10DownloadType
            is FTP or SFTP."                       �"The destination file name (including the path, if applicable)
                of the file. This node must be created regardless of which way to download."                      $"The status of file download. The description of each status is given below:
            idle: there is no downloading request.
            running: files is downloading.
            success: file downloading is completed and successful.
            failure: download request is failure."                      7"The cause of file download failure.
            The description of each failure is given below:
            noError: file is downloading or download successfully.
            invalidFile: file name is invalid.
            directError: the operation to the directory/file is forbidden or directory/file is error.
            ftpNoResponse: can not recieve response from FTP.
            sftpNoResponse: can not recieve response from SFTP.
            noSuchFileOrDirect: no such file(s) or directory(s).
            ftpTransmitFail: fail to transmit file by FTP server.
            directCreateFail: fail to create directory.
            otherTerminalRunning: copy-config is running in other terminal.
            batchCommandRunning: batch command is running in other terminal.
            copyFileFail: fail to copy file.
            disconnect: can not connect FTP/SFTP server.
            ftpServerDown: FTP server can not provide services.
            sftpServerDown: SFTP server can not provide services.
            parameterError: parameter is incorrect."                       �"Specifies the time the download last transitioned
            to running, or 0 if the state has never transitioned to
            running."                       "End time of downloading file."                          