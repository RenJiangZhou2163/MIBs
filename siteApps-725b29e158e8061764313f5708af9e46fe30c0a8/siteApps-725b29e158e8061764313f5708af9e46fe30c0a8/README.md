# RAON_SITEAPPS has the RAON specific IOC applications

## Requirements

Need to install EPICS_BASE, RAON_SITELIBS, and synApps, please see http://github.com/jeonghanlee/scripts_for_epics 

## IOC running with GNU SCREEN

1. source the RAON environment script via

   ```bash
   $ . ~/epics/R3.14.12.5/setEpicsEnv.sh
   ```

   or if one has the provided .bash_aliases, type

   ```bash
   $ epicsenv
   ```
  
2. run raon_ioc.bash with an app name, which one wants to execute. For example,

   ```bash
   jhlee@kaffee:~$ epicsenv 
   jhlee@kaffee:~$ raon_ioc.bash snmp2
   ```
   Note that *an app name* must be matched to the real application name. In the above example, **snmp2** is the application name.

## Why we DOES need it?

An EPICS IOC can be run by anyone who has the right permission to use a PC. And we usually, do not prefer to write any activity on a logbook, and do not prefer to read the logbook even if a person made a really good log entry on that. And it is quite to difficult to find where the terminal, which is used for a running IOC, is on a local PC, and almost impossible to see an IOC through a remote connection. In order to overcome these issues, the most cost-effective way is to use the GNU Screen. 

We are developing a script to overcome these drawbacks or failures, so by using this script, we can *attach* to a running EPICS IOC if the IOC is running, and we can *create* an IOC, if there is no same name IOC running on that machine. Moreover, we can access the running IOC through a remote connection. 

## Deep inside in that raon_ioc.bash script.

1. it creates the screen zero session with ${ioc_name} name. The ${ioc_name} must be the same as the Application name, and so on. For example, 

  ```bash raon_ioc.bash keithley6514``` 

  it will create the screen session with keithley6514 if there is no keithley6514 screen session. 

2. if there is the existent session, it will attach to that sesseion.


## Few commands for GNU Screen

### Inside GNU Screen

* Ctrl a c - Creates a new screen session so that you can use more than one screen session at once.
* Ctrl a n - Switches to the next screen session (if you use more than one).
* Ctrl a p - Switches to the previous screen session (if you use more than one).
* Ctrl a d - Detaches a screen session (without killing the processes in it - they continue).
* Ctrl a k - Kill the screen session

### In a terminal

* screen -ls
```
     Do not start `screen', but instead print a list of session
     identification strings (usually of the form PID.TTY.HOST; *note
     Session Name::).  Sessions marked `detached' can be resumed with
     `screen -r'.  Those marked `attached' are running and have a
     controlling terminal.  If the session runs in multiuser mode, it
     is marked `multi'.  Sessions marked as `unreachable' either live
     on a different host or are dead.  An unreachable session is
     considered dead, when its name matches either the name of the
     local host, or the specified parameter, if any.  See the `-r' flag
     for a description how to construct matches.  Sessions marked as
     `dead' should be thoroughly checked and removed.  
```

* screen -x "name"
```
     Attach to a session which is already attached elsewhere
     (multi-display mode).  `Screen' refuses to attach from within
     itself.  But when cascading multiple screens, loops are not
     detected; take care.
```
