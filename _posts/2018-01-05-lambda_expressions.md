--- 
layout: post 
title: "Lambda Expressions" 
date: 2018-01-05 17:10:36 
author: Dewey Mao 
categories: C/C++ 
--- 

In C++11 and later, a lambda expression often called a lambda, 
is a convenient way of defining an anonymous function object (a closure) right at the location where it is invoked or passed as an argument to a function. 
Typically lambdas are used to encapsulate a few lines of code that are passed to algorithms or asynchronous methods. 

### Illustration of lambda
[=] () mutable throw() ->int {} 

{% highlight c++ lineos %}
#include <algorithm>  
#include <cmath>  

void abssort(float* x, unsigned n) {  
    std::sort(x, x + n,  
        // Lambda expression begins  
        [](float a, float b) {  
            return (std::abs(a) < std::abs(b));  
        } // end of lambda expression  
    );  
}
{% endhighlight %}

### 1 Capture Clause
[&] means all variables that you refer to are captured by reference, and [=] means they are captured by value. 
For example, if a lambda body accesses the external variable 'total' by reference and the external variable 'factor' by value, 
then the following capture clauses are equivalent:
{% highlight c++ lineos %}
[&total, factor]  
[factor, &total]  
[&, factor]  
[factor, &]  
[=, &total]  
[&total, =]  
{% endhighlight %}
Visual Studio 2017 version 15.3 and later (available with /std:c++17): 
The 'this' pointer may be captured by value by specifying  *this  in the capture clause.

### 2 Parameter List (optional)
In addition to capturing variables, a lambda can accept input parameters. 
{% highlight c++ lineos %}
auto y = [] (int first, int second)  
{  
    return first + second;  
};
{% endhighlight %}

### 3 Mutable Specification (optional)
Typically, a lambda's function call operator is const-by-value, but use of the mutable keyword cancels this out. 
It does not produce mutable data members. 
The mutable specification enables the body of a lambda expression to modify variables that are captured by value. 
{% highlight c++ lineos %} 
#include <iostream>  
using namespace std;  

int main()  
{  
   int m = 0;  
   int n = 0;  
   [&, n] (int a) mutable { m = ++n + a; }(4);  
   cout << m << endl << n << endl;  //5,0
}
{% endhighlight %}
Because the variable n is captured by value, its value remains 0 after the call to the lambda expression. 
The mutable specification allows n to be modified within the lambda.

### 4 Exception Specification (optional)
You can use the 'noexcept' exception specification to indicate that the lambda expression does not throw any exceptions. 

### 5 Return Type (optional)
The return type of a lambda expression is automatically deduced. 

### 6 Lambda Body
The lambda body (compound-statement in the Standard syntax) of a lambda expression can contain anything that 
the body of an ordinary method or function can contain.

### 7 Reference
<a href="https://docs.microsoft.com/en-us/cpp/cpp/lambda-expressions-in-cpp" target="_blank"> Lambda Expressions in C++ </a>