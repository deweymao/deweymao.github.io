--- 
layout: post 
title: "Windows Commands" 
date: 2017-08-09 16:40:35 
author: Dewey Mao 
categories: Batch 
--- 
List of useful Windows commands:

{% highlight batch linenos %}
Clean up the disk: cleanmgr /sageset:99, cleanmgr /sagerun:99
Repair the disk: chkdsk /f/r C:
Remote desktop connection: mstsc
Open the notepad: notepad
Open the registry editor: regedit/regedt32
Open control panel: control
Open service window: services.msc
Open calculator: calc
Enable the hidden administrator account(open a command prompt in administrator mode): net user administrator /active:yes
Open task manager: taskmgr
Open computer management: compmgmt.msc
Displays a list of directory's files and subdirectories: dir
Displays the name of or changes the current directory: cd, for example: cd .. :return to the parent directory
{% endhighlight %}

### Reference
<a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#BKMK_d" target="_blank"> Windows Commands </a>