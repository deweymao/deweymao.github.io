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

rem echo ^<div style="float:right"^> >> !f!
rem echo  ^<a href="{{site.url}}/about/"^> ^<img style="border:none;" src="{{ site.url }}/assets/pics/reward.png" alt="Reward me"/^> ^</a^>  >> !f!
rem echo ^</div^> >> !f!
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
  echo   ^<td align="center"^> ^<img src="{{ site.url }}/assets/gallery/%%s" alt="!title!" width="800px" /^> ^</td^> >> !f!
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