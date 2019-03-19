--- 
layout: post 
title: "Windows Server 2012 Shared Folder Configuration" 
date: 2019-03-19 21:44:47 
author: Dewey Mao 
categories: IIS 
--- 

### Delete user credential
Control panel -> User account -> Credential manager

### Open Guest account
Control panel -> User account -> Manage other acccounts

### Manage password of Guest account
Control panel -> Computer management -> Local user and group -> User

### Set shared folder and access authority
Folder -> Attribute -> Share
Folder -> Attribute -> Safety

### Turn off password protection share
Control panel -> Network and Share Center -> Advanced Share Setting -> All networks -> turn off password protection share

