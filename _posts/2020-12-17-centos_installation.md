--- 
layout: post 
title: "CentOS Installation" 
date: 2020-12-17 10:28:36 
author: Dewey Mao 
categories: Server 
--- 
### Download CentOS 7
<a href="http://isoredirect.centos.org/centos/7/isos/x86_64/" target="_blank"> CentOS Mirrors List</a>

### Boot U Disk
<a href="https://cn.ultraiso.net/" target="_blank"> UltraISO </a>
<a href="https://cn.ultraiso.net/jiaocheng/zhi-zuo-cd-iso.html" target="_blank"> How to make disk image </a>

### BIOS U Disk Boot
modify system boot order.

### Install CentOS 7
- "Tab" key to modify configuration: vmlinuz initrd=initrd.img dd linux quiet
- Find your U disk name
- "reboot" to install
- "Tab" key to modify configuration: vmlinuz initrd=initrd.img inst.stage2=hd:/dev/sdb4 quiet
- disk partition:
```
/: root directory，100GB
/boot: system file, 1GB
/biosboot: bios file, 2MB
SWAP：extended memory，32GB（2 times memory）
/home: user data,120GB
/var: log data, 20GB
```
       
### Network Configuration
```
//look up network card
nmcli d 
//go to network configuration file directory
cd /etc/sysconfig/network-scripts
//edit config file
vi ifcfg-xxxx
//restart network
systemctl restart network
// test network
ping www.baidu.com 

```
### Remote Access Server by Xshell
<a href="https://www.netsarang.com/zh/xshell/" target="_blank"> Xshell and Xftp </a>

