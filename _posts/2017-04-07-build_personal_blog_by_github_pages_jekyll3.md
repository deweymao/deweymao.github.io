---
layout: post
title:  "Build Personal Blog: GitHub Pages + Jekyll"
date:   2017-04-07 23:36:51 +0800
author: Dewey Mao
categories: Jekyll3
---

## 1 安装开发工具
  
### 1.1 Install <a href="https://git-scm.com/about" target="_blank">Git</a> for Windows: 
- <a href="https://git-scm.com/downloads" target="_blank">Download Git</a>
- <a href="https://git-scm.com/docs" target="_blank">Git Reference</a>
  
### 1.2 Install <a href="http://www.ruby-lang.org/zh_cn/" target="_blank">Ruby</a> for Windows:
- <a href="http://rubyinstaller.org/downloads/" target="_blank">Download Ruby 2.0 and above</a>
- <a href="http://rubyinstaller.org/downloads/" target="_blank">Download DevKit</a>

```
#验证Ruby安装是否正确
ruby -v 
#进入DevKit的安装目录
ruby dk.rb init
#运行后生成config.yml文件，行末添加ruby的安装路径，例如：
- D:\Jekyll\Ruby22-x64
#接着
ruby dk.rb install 
```
  
### 1.3 Install <a href="http://jekyll.com.cn/" target="_blank">Jekyll</a> for Windows:

```
#翻墙
gem install bundler
gem install jekyll
```

## 2 使用Jekyll创建Blog

```
jekyll new my-awesome-site 
cd my-awesome-site 
jekyll serve 
# => Now browse to http://localhost:4000 
#显示默认安装主题minima
bundle show minima
```

<a href="http://jekyllthemes.org/" target="_blank">Jekyll Themes</a>

## 3 Create GitHub repository for your blog
参考: <a href="https://pages.github.com/" target="_blank">GitHub Pages</a>

## 4 使用Markdown书写blog
<a href="http://www.appinn.com/markdown/" target="_blank">Markdown语法</a>

## 5 提交到GitHub Repository

```
#克隆到本地
git clone https://github.com/username/username.github.io
#查看文件修改状态
git status
#添加文件
git add --all
#提交并写注释
git commit -m "注释"
#push到master分支
git push -u origin master
```




