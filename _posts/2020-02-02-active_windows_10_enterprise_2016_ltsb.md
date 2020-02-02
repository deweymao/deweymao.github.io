--- 
layout: post 
title: "Active Windows 10 Enterprise 2016 LTSB" 
date: 2020-02-02 15:41:42 
author: Dewey Mao 
categories: Solution 
--- 
### How to Active Windows 10 Enterprise 2016 LTSB
1. Start CMD as system administrator.
2. Check system activation status: slmgr.vbs -xpr
3. Uninstall key: slmgr.vbs /upk
4. Install key: slmgr /ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
5. Set key computer name: slmgr /skms xykz.f3322.org
6. Active: slmgr /ato

### Tips
Try to replace KEY(DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ) and NAME(xykz.f3322.org) to active your system.   
For example:   
- slmgr /skms 110.noip.me
- slmgr /skms kms.lotro.cc
- slmgr /skms mhd.kmdns.net
- slmgr /skms xykz.f3322.org
- slmgr /skms 106.186.25.239
- slmgr /skms 3rss.vicp.net:20439
- slmgr /skms 45.78.3.223
- slmgr /skms kms.chinancce.com
- slmgr /skms kms.didichuxing.com
- slmgr /skms skms.ddns.net
- slmgr /skms franklv.ddns.net
- slmgr /skms 192.168.2.8