	int runchild( const string command, const string arglist )
	{
		int svcchk = checksvc(command);
		if (svcchk>0)	 return -1;

		pid_t pid = fork();
		if (pid == -1) return -1;
		if (pid == 0) 
		{
			string strcmd;
			if (command.compare("ntpd")== 0){
				strcmd = "service ntpd start";
			} else if (command.compare("sysMonitor")== 0){
				chdir("/usr/local/epics/siteApp/iocBoot/iocsysMonitor");
				strcmd = "screen -d -m ./st.cmd";
			} else if (command.compare("tmsengine")== 0){
				chdir("/SNFS1/TMSArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("vmsengine")== 0){
				chdir("/SNFS1/VMSArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("clsengine")== 0){
				chdir("/SNFS1/CLSArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("hrsengine")== 0){
				chdir("/SNFS1/HRSArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("hdsengine")== 0){
				chdir("/SNFS1/SHDSArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("qdsengine")== 0){
				chdir("/SNFS1/QDSArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("icrfengine")== 0){
				chdir("/SNFS1/ICRFArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("echengine")== 0){
				chdir("/SNFS1/ECHArchiveData");
				strcmd = "./arch.cmd";
			} else if (command.compare("fuelengine")== 0){
				chdir("/SNFS1/FUELArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("ccsengine")== 0){
				chdir("/SNFS1/PF1Test");
				strcmd = "./arch.cmd";
			} else if (command.compare("mpsengine")== 0){
				chdir("/SNFS1/MPSArchivedData");
				strcmd = "./arch.cmd";
			} else if (command.compare("mdsip")== 0){
				strcmd = "mdsip";
			} else if (command.compare("httpd")== 0){
				strcmd = "apachectl start";
			} else if (command.compare("nsrd")== 0){
				strcmd = "nsrd";
			} else if (command.compare("tomcat")== 0){
				chdir("/usr/local/tomcat5/bin");
				strcmd = "./startup.sh";
			}
			execl( "/bin/bash", "sh", "-c", strcmd.c_str(), NULL);
			exit (-1);
		};
		return 1;
	}
