--- 
layout: post 
title: "References" 
date: 2018-01-10 10:16:19 
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

{% highlight c++ lineos %}
#include <iostream>  
using namespace std;  

struct Person  
{  
    char* Name;  
    short Age;  
};  

int main()  
{  
   // Declare a Person object.  
   Person myFriend;  

   // Declare a reference to the Person object.  
   Person& rFriend = myFriend;  

   // Set the fields of the Person object.  
   // Updating either variable changes the same object.  
   myFriend.Name = "Bill";  
   rFriend.Age = 40;  

   // Print the fields of the Person object to the console.  
   cout << rFriend.Name << " is " << myFriend.Age << endl;  
   //output: Bill is 40
}
{% endhighlight %}

### <a href="https://docs.microsoft.com/en-us/cpp/cpp/rvalue-reference-declarator-amp-amp" target="_blank"> Rvalue Reference Declarator && </a>
Holds a reference to an rvalue expression.
#### Move Semantics: <a href="https://docs.microsoft.com/en-us/cpp/standard-library/utility-functions#move" target="_blank">std::move()</a>
Rvalue references support the implementation of move semantics, which can significantly increase the performance of your applications. 
Move semantics enables you to write code that transfers resources (such as dynamically allocated memory) from one object to another.
Move semantics works because it enables resources to be transferred from temporary objects that cannot be referenced elsewhere in the program.   
To implement move semantics, you typically provide <a href="https://docs.microsoft.com/en-us/cpp/cpp/move-constructors-and-move-assignment-operators-cpp" target="_blank">a move constructor, and optionally a move assignment operator (operator=)</a>, to your class. 
Copy and assignment operations whose sources are rvalues then automatically take advantage of move semantics.
#### Perfect Forwarding: <a href="https://docs.microsoft.com/en-us/cpp/standard-library/utility-functions#forward" target="_blank">std::forward()</a>
Perfect forwarding reduces the need for overloaded functions and helps avoid the forwarding problem. 
The forwarding problem can occur when you write a generic function that takes references as its parameters and it passes (or forwards) these parameters to another function. 
For example, if the generic function takes a parameter of type const T&, then the called function cannot modify the value of that parameter. 
If the generic function takes a parameter of type T&, then the function cannot be called by using an rvalue (such as a temporary object or integer literal).
{% highlight c++ lineos %}
struct W  
{  
   W(int&, int&) {}  
};  

struct X  
{  
   X(const int&, int&) {}  
};  

struct Y  
{  
   Y(int&, const int&) {}  
};  

struct Z  
{  
   Z(const int&, const int&) {}  
};

template <typename T, typename A1, typename A2>  
T* factory(A1&& a1, A2&& a2)  
{  
   return new T(std::forward<A1>(a1), std::forward<A2>(a2));  
}  

int main()  
{  
   int a = 4, b = 5;  
   W* pw = factory<W>(a, b);  
   X* px = factory<X>(2, b);  
   Y* py = factory<Y>(a, 2);  
   Z* pz = factory<Z>(2, 2);  

   delete pw;  
   delete px;  
   delete py;  
   delete pz;  
}
{% endhighlight %}
- You can overload a function to take an lvalue reference and an rvalue reference.
- The compiler treats a named rvalue reference as an lvalue and an unnamed rvalue reference as an rvalue.
- You can cast an lvalue to an rvalue reference: std::move(lvalue) and static_cast<Type&&>(lvaue).

### <a href="https://docs.microsoft.com/en-us/cpp/cpp/reference-type-function-returns" target="_blank"> Reference-Type Function Returns </a>
Functions can be declared to return a reference type. There are two reasons to make such a declaration:
- The information being returned is a large enough object that returning a reference is more efficient than returning a copy.
- The type of the function must be an l-value.
- The referred-to object will not go out of scope when the function returns.

### Reference
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/references-cpp" target="_blank">reference(C++)</a>
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/lvalue-reference-declarator-amp" target="_blank">Lvalue Reference Declarator &</a>
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/rvalue-reference-declarator-amp-amp" target="_blank"> Rvalue Reference Declarator && </a>
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/reference-type-function-returns" target="_blank"> Reference-Type Function Returns </a>
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/move-constructors-and-move-assignment-operators-cpp" target="_blank">Move Constructors and Move Assignment Operators (C++)</a>
- <a href="https://docs.microsoft.com/en-us/cpp/standard-library/utility-functions#move" target="_blank">std::move()</a>
- <a href="https://docs.microsoft.com/en-us/cpp/standard-library/utility-functions#forward" target="_blank">std::forward()</a>
{% highlight c++ lineos %}

{% endhighlight %}