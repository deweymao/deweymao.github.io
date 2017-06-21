--- 
layout: post 
title: "Socket, A simple Echo program" 
date: 2017-05-21 15:35:55 
author: Dewey Mao 
categories: C/C++ 
--- 

A network socket is an internal endpoint for sending or receiving data at a single node in a computer network.
I write a Echo Program Demo that will send what it receives.   

## Code of server

{% highlight c++ linenos %}
#include "stdafx.h"
#include "ws2tcpip.h"
#include "winsock2.h"
#pragma comment (lib,"ws2_32.lib") //load ws2_32.dll

#define BUF_SIZE 100

int _tmain(int argc, _TCHAR* argv[])
{
	//initialize struct WSADATA
	WSADATA wsaData;
	WSAStartup(MAKEWORD(2, 2), &wsaData); //version:2.2

	//create server socket
	SOCKET serverSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP); //IPv4 address, TCP protocol

	//bind socket
	sockaddr_in sockAddr;
	memset(&sockAddr, 0, sizeof(sockAddr));
	sockAddr.sin_family = AF_INET; //IPv4 address
	inet_pton(AF_INET, "127.0.0.1", &sockAddr.sin_addr); //LOCALHOST IP address
	sockAddr.sin_port = htons(1234); //port number
	bind(serverSock, (SOCKADDR*)&sockAddr, sizeof(SOCKADDR));

	//listen
	listen(serverSock, 20); //20: length of request queue

	//receive request from client
	SOCKADDR clientAddr;
	int nSize = sizeof(SOCKADDR);
	char buffer[BUF_SIZE] = { 0 };
	while (1) {
		SOCKET clientSock = accept(serverSock, &clientAddr, &nSize); //accept request from client
		int strLen = recv(clientSock, buffer, BUF_SIZE, 0); //receive data from client
		printf("string from client: %s\n", buffer);
		send(clientSock, buffer, strLen, 0); //send data to client
		closesocket(clientSock); //close client socket
		memset(buffer, 0, BUF_SIZE);
	}

	//close server socket
	closesocket(serverSock);

	//terminate use of ws2_32.dll
	WSACleanup();

	return 0;
}
{% endhighlight %}   

## Code of client

{% highlight c++ linenos %}
#include "stdafx.h"
#include "ws2tcpip.h"
#include "winsock2.h"
#pragma comment (lib,"ws2_32.lib") //load ws2_32.dll

#define BUF_SIZE 100

int _tmain(int argc, _TCHAR* argv[])
{
	//initialize struct WSADATA
	WSADATA wsaData;
	WSAStartup(MAKEWORD(2, 2), &wsaData); //version:2.2

	//send request to server
	sockaddr_in sockAddr;
	memset(&sockAddr, 0, sizeof(sockAddr));
	sockAddr.sin_family = AF_INET; //IPv4 address
	inet_pton(AF_INET, "127.0.0.1", &sockAddr.sin_addr); //LOCALHOST IP address
	sockAddr.sin_port = htons(1234); //port number
	
	char bufferSend[BUF_SIZE] = { 0 };
	char bufferRecv[BUF_SIZE] = { 0 };
	
	while (1) {
		//create server socket
		SOCKET clientSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP); //IPv4 address, TCP protocol
		connect(clientSock, (SOCKADDR*)&sockAddr, sizeof(SOCKADDR));

		printf("Input s string: ");
		gets_s(bufferSend);
		send(clientSock, bufferSend, strlen(bufferSend), 0); //send data to server

		recv(clientSock, bufferRecv, BUF_SIZE, 0); //receive data from server
		printf("string from server: %s\n", bufferRecv);

		closesocket(clientSock); //close client socket
		memset(bufferSend, 0, BUF_SIZE);
		memset(bufferRecv, 0, BUF_SIZE);
	}

	//terminate use of ws2_32.dll
	WSACleanup();

	return 0;
}
{% endhighlight %}

## Reference
- <a href="http://c.biancheng.net/cpp/html/3029.html" target="_blank">C language Chinese network</a>
- <a href="https://msdn.microsoft.com/en-us/library/ms740506(v=vs.85).aspx" target="_blank">socket function</a>