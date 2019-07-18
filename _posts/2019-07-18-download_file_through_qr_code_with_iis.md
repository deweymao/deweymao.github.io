--- 
layout: post 
title: "Download file through QR code with IIS" 
date: 2019-07-18 20:22:39 
author: Dewey Mao 
categories: Server 
--- 
In order to release a APP, I create a web application with IIS and a QR code to download apk file.

### Create a web application with IIS
- IIS -> Add web site
- MIME type -> Add {.apk,application/vnd.android.package-archive}
- Firewall -> Add a access rule for the web site port

### Create a QR code to download apk file
- Copy apk file download link
- Generate a QR code with link

### Reference 
- <a href="https://cli.im/" target="_blank"> QR code generator </a> 
