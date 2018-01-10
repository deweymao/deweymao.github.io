--- 
layout: post 
title: "Use NMAKE to build code on the command line" 
date: 2018-01-10 10:48:49 
author: Dewey Mao 
categories: C/C++ 
--- 

### <a href="https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line" target="_blank"> Build C/C++ code on the command line </a>
The command prompt shortcuts are installed in a version-specific Visual Studio folder in your Start menu. 
Here's a list of the base command prompt shortcuts and the build architectures they support:
- Developer Command Prompt Sets the environment to use 32-bit, x86-native tools to build 32-bit, x86-native code.
- x86 Native Tools Command Prompt Sets the environment to use 32-bit, x86-native tools to build 32-bit, x86-native code.
- x64 Native Tools Command Prompt Sets the environment to use 64-bit, x64-native tools to build 64-bit, x64-native code.
- x86_x64 Cross Tools Command Prompt Sets the environment to use 32-bit, x86-native tools to build 64-bit, x64-native code.
- x64_x86 Cross Tools Command Prompt Sets the environment to use 64-bit, x64-native tools to build 32-bit, x86-native code.

### <a href="https://docs.microsoft.com/en-us/cpp/build/nmake-reference" target="_blank"> NMAKE </a>
- To use NMAKE, you must run it in a Developer Command Prompt window. 
- To write MakeFile file about your project
- To command: nmake /f makefile.vc 

### Rerference
- <a href="https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line" target="_blank"> Build C/C++ code on the command line </a>
- <a href="https://docs.microsoft.com/en-us/cpp/build/nmake-reference" target="_blank"> NMAKE Reference </a>