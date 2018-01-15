@ECHO OFF
setlocal enabledelayedexpansion

set f=../../gallery.md

echo --- > !f!
echo layout: page >> !f!
echo title: Gallery >> !f!
echo permalink: /gallery/ >> !f!
echo --- >> !f!

echo. >> !f!

echo ^<div style="float:right"^> >> !f!
echo  ^<a href="{{site.url}}/about/"^> ^<img style="border:none;" src="{{ site.url }}/assets/pics/reward.png" alt="Reward me"/^> ^</a^>  >> !f!
echo ^</div^> >> !f!
echo ### Welcome to Miss Jia's Online Gallery! >> !f!

echo. >> !f!

echo ^<div^> >> !f!
echo  ^<table border = "1"^> >> !f!
echo. >> !f!

for %%s in (*) do ( 
 if not "%%s"=="update.bat" (
  echo  ^<tr^> >> !f!
  echo   ^<td align="center"^> ^<b^>orchid^</b^> ^<br^> ^<span class="post-meta"^> 01-12-2018, Jia ^</span^> ^</td^> >> !f!
  echo  ^</tr^> >> !f!
  echo  ^<tr^> >> !f!
  echo   ^<td align="center"^> ^<img src="{{ site.url }}/assets/gallery/%%s" alt="orchid"/^> ^</td^> >> !f!
  echo  ^</tr^> >> !f!
  echo. >> !f!
 )
) 

echo. >> !f!
echo  ^</table^> >> !f!
echo ^</div^> >> !f!