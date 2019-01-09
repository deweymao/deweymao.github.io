--- 
layout: post 
title: "Memo Fix Errors" 
date: 2019-01-09 17:21:00 
author: Dewey Mao 
categories: Memo 
--- 
 
I am depressed to fix the same errors once by once, so I write down the key points of how to solve the problems which I have encountered.

### Error-1 Remote desktop connection: CredSSP encryption Oracle Fix
For Windows 10 Enterprise Edition: 
"win+R [gpedit.msc]" -> "computer configuration" -> "management template" -> "system" -> "credential distribution" -> "encryption Oracle fix"
protection level: vulnerrable
For Windows Home Edition: 
"Win+R [regedit]" -> "\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\"
new "\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSp\Parameters"
new AllowEncryptionOracle(DWORD 32) = 2
 
### Reference 
<!--
- <a href="" target="_blank">  </a> 
- <a href="" target="_blank">  </a> 
--!>