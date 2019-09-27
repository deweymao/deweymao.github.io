--- 
layout: post 
title: "Start Desktop Application From Web" 
date: 2019-09-27 11:35:39 
author: Dewey Mao 
categories: Solution 
--- 
#### Add Register Table Record
```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\test]
@="test"
"URL Protocol"=""

[HKEY_CLASSES_ROOT\test\shell]

[HKEY_CLASSES_ROOT\test\shell\open]

[HKEY_CLASSES_ROOT\test\shell\open\command]
@="\"C:\\Users\\dimine\\Desktop\\start_test\\TestFrameworkProgram\\Debug\\TestFrameworkProgram.exe\" \"%1\""
```

#### Open From Web
```
<!DOCTYPE html>
<html>
<body>
<a href="test://your_parameter"> OPEN TEST </a>
</body>
</html>
```

#### Process Parameter
```
// 分析标准 shell 命令、DDE、打开文件操作的命令行
	CCommandLineInfo cmdInfo;
	ParseCommandLine(cmdInfo);

	//CString strParameter=cmdInfo.m_strFileName;
	cmdInfo.m_strFileName="";
	cmdInfo.m_nShellCommand=CCommandLineInfo::FileNew;

	// 调度在命令行中指定的命令。如果
	// 用 /RegServer、/Register、/Unregserver 或 /Unregister 启动应用程序，则返回 FALSE。
	if (!ProcessShellCommand(cmdInfo))
		return FALSE;
	// 主窗口已初始化，因此显示它并对其进行更新

	//CString strCommandLine=GetCommandLine();
	CString strArgument=m_lpCmdLine;

	if (!strArgument.IsEmpty()) {
		strArgument.Format("启动时传入参数：%s",m_lpCmdLine);
		AfxMessageBox(strArgument);
	}	
```
