--- 
layout: post 
title: "NAT Network Address Translation" 
date: 2019-08-23 22:09:25 
author: Dewey Mao 
categories: Network 
--- 

### NAT
NAT:在计算机网络中是一种在IP数据包通过路由器或防火墙时重写来源IP地址或目的IP地址的技术。
这种技术被普遍使用在有多台主机但只通过一个公有IP地址访问因特网的私有网络中。
它是一个方便且得到了广泛应用的技术。
当然，NAT也让主机之间的通信变得复杂，导致了通信效率的降低。

### Basic NAT
这一种也可称作NAT或“静态NAT”，在RFC 2663中提供了信息。
它在技术上比较简单，仅支持地址转换，不支持端口映射。
- 内网IP:192.168.1.55 外网IP:219.152.168.222
- 内网IP:192.168.1.59 外网IP:219.152.168.223

### NAPT
这种方式支持端口的映射，并允许多台主机共享一个公网IP地址。
- 内网IP:192.168.1.55:5566 外网IP:219.152.168.222:9200
- 内网IP:192.168.1.59:80 外网IP:219.152.168.222:9201
 
### Reference 
- <a href="https://zh.wikipedia.org/wiki/%E7%BD%91%E7%BB%9C%E5%9C%B0%E5%9D%80%E8%BD%AC%E6%8D%A2" target="_blank"> NAT wiki </a> 
