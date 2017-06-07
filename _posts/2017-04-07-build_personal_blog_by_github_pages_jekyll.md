---
layout: post
title:  "Build Personal Blog: GitHub Pages + Jekyll"
date:   2017-04-07 23:36:51
author: Dewey Mao
categories: Jekyll
---

## 1 Install Development Tools
### 1.1 Install <a href="https://git-scm.com/about" target="_blank">Git</a> for Windows: 
- <a href="https://git-scm.com/downloads" target="_blank">Download Git</a>
- <a href="https://git-scm.com/docs" target="_blank">Git Reference</a>
  
### 1.2 Install <a href="http://www.ruby-lang.org/zh_cn/" target="_blank">Ruby</a> for Windows:
- <a href="http://rubyinstaller.org/downloads/" target="_blank">Download Ruby 2.0 and above</a>
- <a href="http://rubyinstaller.org/downloads/" target="_blank">Download DevKit</a>

{% highlight bash linenos %}
#check ruby installation
ruby -v 
#go to DevKit installation directory
ruby dk.rb init
#generate config.yml file, add the installation path of ruby at the end of line, for example: 
- D:\Jekyll\Ruby22-x64
#then
ruby dk.rb install 
{% endhighlight %}
  
### 1.3 Install <a href="http://jekyll.com.cn/" target="_blank">Jekyll</a> for Windows:
{% highlight bash linenos %}
gem install bundler
gem install jekyll
{% endhighlight %}

## 2 Create a Blog by Jekyll
{% highlight bash linenos %}
jekyll new my-awesome-site 
cd my-awesome-site 
jekyll serve 
# => Now browse to http://localhost:4000 
#display default theme: minima
bundle show minima
{% endhighlight %}

- <a href="http://jekyllthemes.org/" target="_blank">Jekyll Themes</a>
- <a href="https://liquid.bootcss.com/" target="_blank">Liquid Template Language</a>

## 3 Create GitHub repository for your blog
Reference: <a href="https://pages.github.com/" target="_blank">GitHub Pages</a>

## 4 Write Blogs by Markdown
<a href="http://www.appinn.com/markdown/" target="_blank">Markdown Gammar</a>

## 5 Commit to GitHub Repository
{% highlight bash linenos %}
#clone to local
git clone https://github.com/username/username.github.io
#check files status
git status
#add files modified
git add --all
#commit with comment
git commit -m "comment"
#push to master branch
git push -u origin master
{% endhighlight %}

## 6 Source Of My Website
You can find the source code for this website at
{% include icon-github.html username="deweymao" %} /
[deweymao.github.io](https://github.com/deweymao/deweymao.github.io)


