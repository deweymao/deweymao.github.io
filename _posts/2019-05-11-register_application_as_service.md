--- 
layout: post 
title: "Register Application as Service" 
date: 2019-05-11 10:29:47 
author: Dewey Mao 
categories: Server 
--- 

### instsrv.exe install srvany.exe
```
cmd: C:\tools>instsrv.exe mk_xtpt_srv C:\\tools\srvany.exe
```

### Modify Registry
```
run：regedit
registry: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mk_xtpt_srv
Create: Parameters
			|--Application:		C:\apache-tomcat-6.0.36\bin\startup.bat
			|--AppDirectory: 	C:\apache-tomcat-6.0.36\bin
			|--AppParameters:	
```
			
### Modify Service
```
run: services.msc
attribute: allow service to interact with desktop
```

### Delete Service
```
cmd: C:\tools>instsrv.exe TeamViewer_srv remove
```
