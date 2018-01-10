--- 
layout: post 
title: "References" 
date: 2018-01-09 10:16:19 
author: Dewey Mao 
categories: C/C++ 
--- 

### <a href="https://docs.microsoft.com/en-us/cpp/cpp/references-cpp" target="_blank">Reference(C++)</a>
A reference, like a pointer, stores the address of an object that is located elsewhere in memory. 
Unlike a pointer, a reference after it is initialized cannot be made to refer to a different object or set to null. 
There are two kinds of references: lvalue references which refer to a named variable and rvalue references which refer to a temporary object. 
The & operator signifies an lvalue reference and the && operator signifies either an rvalue reference, or a universal reference (either rvalue or lvalue) depending on the context.

### <a href="https://docs.microsoft.com/en-us/cpp/cpp/lvalue-reference-declarator-amp" target="_blank">Lvalue Reference Declarator &</a>
Holds the address of an object but behaves syntactically like an object.

- You can think of an lvalue reference as another name for an object. 
An lvalue reference declaration consists of an optional list of specifiers followed by a reference declarator. 
A reference must be initialized and cannot be changed.

- Any object whose address can be converted to a given pointer type can also be converted to the similar reference type. 
For example, any object whose address can be converted to type char * can also be converted to type char &.

- Do not confuse reference declarations with use of the address-of operator. 
When the &identifier is preceded by a type, such as int or char, identifier is declared as a reference to the type. 
When &identifier is not preceded by a type, the usage is that of the address-of operator.

### Rvalue Reference Declarator &&



### Reference
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/references-cpp" target="_blank">reference(C++)</a>
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/lvalue-reference-declarator-amp" target="_blank">Lvalue Reference Declarator &</a>