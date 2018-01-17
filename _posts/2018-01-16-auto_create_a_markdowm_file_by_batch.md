--- 
layout: post 
title: "Auto create a markdowm file by batch" 
date: 2018-01-16 11:17:14 
author: Dewey Mao 
categories: Batch 
--- 

When I want to commit a new painting to the online <a href="https://deweymao.github.io/gallery/" target="_blank">Gallery</a>, I have to modify the code of gallery.md.
Today I find a way to Auto modify the code by Batch.

{% highlight batch lineos %}
@ECHO OFF
setlocal enabledelayedexpansion

set f=../../gallery.md
set author=Jia

echo --- > !f!
echo layout: page >> !f!
echo title: Gallery >> !f!
echo permalink: /gallery/ >> !f!
echo --- >> !f!
echo. >> !f!

echo ^<div style="float:right"^> >> !f!
echo  ^<a href="{{site.url}}/about/"^> ^<img style="border:none;" src="{{ site.url }}/assets/pics/reward.png" alt="Reward me"/^> ^</a^>  >> !f!
echo ^</div^> >> !f!
echo ### Welcome to Miss Jia's Online Gallery. >> !f!
echo. >> !f!

echo ^<div^> >> !f!
echo  ^<table align="center" border = "1"^> >> !f!
echo. >> !f!

for %%s in (*.jpg) do ( 
  set d=%%s
  set year=!d:~0,4!
  set month=!d:~5,2!
  set day=!d:~8,2!
  set title=!d:~11,-4!
  set title=!title:_= !
 
  echo  ^<tr^> >> !f!
  echo   ^<td align="center"^> ^<b^>!title!^</b^> ^<br^> ^<span class="post-meta"^> !month!-!day!-!year!, !author! ^</span^> ^</td^> >> !f!
  echo  ^</tr^> >> !f!
  echo  ^<tr^> >> !f!
  echo   ^<td align="center"^> ^<img src="{{ site.url }}/assets/gallery/%%s" alt="!title!"/^> ^</td^> >> !f!
  echo  ^</tr^> >> !f!
  echo. >> !f!
) 

echo. >> !f!
echo  ^</table^> >> !f!
echo ^</div^> >> !f!

rem echo. >> !f! : blank line
rem echo ^<div^> : ^ escaped character
rem set year=!d:~0,4! : extract 4 characters from the first character
rem set title=!title:_= ! : replace '_' with ' ' 
{% endhighlight %}

### Reference 
<a href="https://en.wikipedia.org/wiki/Batch_file" target="_blank">Wiki Batch file</a>