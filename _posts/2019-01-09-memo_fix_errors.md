--- 
layout: post 
title: "Memo Fix Errors" 
date: 2019-01-09 17:21:00 
author: Dewey Mao 
categories: Memo 
--- 
 
I am depressed to fix the same errors once by once, so I write down the key points of how to solve the problems which I have encountered.

#### Error-1 Remote desktop connection: CredSSP encryption Oracle Fix  
For Windows 10 Enterprise Edition:  
```
"win+R [gpedit.msc]" -> "computer configuration" -> "management template" -> "system" -> "credential distribution" -> "encryption Oracle fix"  
protection level: vulnerrable  
```
For Windows Home Edition:  
```
"Win+R [regedit]" -> "\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\"  
new "\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSp\Parameters"  
new AllowEncryptionOracle(DWORD 32) = 2  
```

#### Error-2 FTP clinet: An error occurred opening a folder on the FTP server. Check if you have permission to access the folder.
```
Maybe need to modify "not using FTP passive mode": IE explorer -> Setting -> Internet option -> Advanced -> Unchecked "using passive FTP".   
```

#### Error-3 FTP server: 451 No mapping for unicode character exists in the target multi-byte code page.
```
IIS -> FTP setting -> Advanced setting -> Allow UTF-8 = false  
```

#### Error-4 Unable to access shared folder - net use \\\\IP return System error 1272. 
```  
gpedit.msc -> computer configuration -> management template -> network -> Lanman workstation:   
Enable unsafe Guest login - enabled. 
```
