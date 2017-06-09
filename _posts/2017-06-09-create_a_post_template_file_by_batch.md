--- 
layout: post 
title: "Create a post template file by batch" 
date: 2017-06-09 11:23:28 
author: Dewey Mao 
categories: Batch 
--- 

When I want to write a blog, I always get frustrated with the header of POST. 
Today, I solved this problem by BATCH. 
Just need you to enter title, subtitle and category of the post, the new_post.bat will automatically create a file for you. 

source of the new_post.bat:   
{% highlight batch linenos %}
@ECHO OFF
setlocal enabledelayedexpansion

echo ----------NEW POST----------
set /p post_title=Please input the title of post: 
set /p post_subtitle=Please input the subtitle of post: 
set /p post_category=Please input the category of post: 
set post_date=%date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%
set post_author=Dewey Mao
set post_layout=post
set post_title_=!post_title: =_!
set file_name=%date:~0,4%-%date:~5,2%-%date:~8,2%-!post_title_!.md

::to lowcase
set "code=a b c d e f g h i j k l n m o p q r s t u v w x y z" 
for %%i in (%code%) do call,set "file_name=%%file_name:%%i=%%i%%" 

echo --- > !file_name!
echo layout: !post_layout! >> !file_name!
echo title: "!post_title!" >> !file_name!
IF NOT "!post_subtitle!"=="" (echo subtitle: "!post_subtitle!" >> !file_name!)
echo date: !post_date! >> !file_name!
echo author: !post_author! >> !file_name!
echo categories: !post_category! >> !file_name!
echo --- >> !file_name!

echo ----------SUCCESS----------
pause
{% endhighlight %}

file name of the new post: 2017-06-09-create_a_post_template_file_by_batch.md   
contents of the new post:   
{% highlight md linenos %}
--- 
layout: post 
title: "Create a post template file by batch" 
date: 2017-06-09 11:23:28 
author: Dewey Mao 
categories: Batch 
---
{% endhighlight %}