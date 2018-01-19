--- 
layout: post 
title: "Templates" 
date: 2018-01-11 22:40:55 
author: Dewey Mao 
categories: C/C++ 
--- 

### <a href="https://docs.microsoft.com/en-us/cpp/cpp/templates-cpp" target="_blank">Templates</a>
A template is a construct that generates an ordinary type or function at compile time based on arguments the user supplies for the template parameters.
- The primary restriction when using templates is that a type argument must support any operations that are applied to the type parameters.
- The basic requirements that vector and other standard library containers impose on elements of T is that T be copy-assignable and copy-constructible.

{% highlight c++ lineos %}
//function template
template <typename T>
T minimum(const T& lhs, const T& rhs){
	return lhs < rhs ? lhs : rhs;
}

//class template
template <typename T, typename U, typename V> class Foo{};

template<typename... Arguments> class vtclass;
vtclass< > vtinstance1;  
vtclass<int> vtinstance2;  
vtclass<float, bool> vtinstance3;

template<typename T, size_t L>  
class MyArray  
{  
    T arr[L];  
public:  
    MyArray() { ... }  
};
MyArray<MyClass*, 10> arr;

template<typename T, template<typename U, int I> class Arr>  
class MyClass2  
{  
    T t; //OK  
    Arr<T, 10> a;  
    U u; //Error. U not in scope  
};

template<typename A = int, typename B = double>  
class Bar  
{  
    //...  
};  
int main()  
{  
    Bar<> bar; // use all default type arguments  
}

template <typename K, typename V>  
class MyMap{/*...*/};  

// partial specialization for string keys  
template<typename V>  
class MyMap<string, V> {/*...*/};  
...  
MyMap<int, MyClass> classes; // uses original template  
MyMap<string, MyClass> classes2; // uses the partial specialization

{% endhighlight %}

### <a href="https://docs.microsoft.com/en-us/cpp/cpp/class-templates" target="_blank">Class Templates</a>
Member functions can be defined inside or outside of a class template. 
They are defined like function templates if defined outside the class template.
{% highlight c++ lineos %}
// member_function_templates1.cpp  
template<class T, int i> class MyStack  
{  
    T*  pStack;  
    T StackBuffer[i];  
    static const int cItems = i * sizeof(T);  
public:   
    MyStack( void );  
    void push( const T item );  
    T& pop( void );  
};  

template< class T, int i > MyStack< T, i >::MyStack( void )  
{  
};  

template< class T, int i > void MyStack< T, i >::push( const T item )  
{  
};  

template< class T, int i > T& MyStack< T, i >::pop( void )  
{  
};  

int main()  
{  
}
{% endhighlight %}

Member functions can themselves be function templates, specifying additional parameters, as in the following example.
{% highlight c++ lineos %}
// member_templates.cpp  
template<typename T>  
class X  
{  
public:  
   template<typename U>  
   void mf(const U &u);  
};  

template<typename T> template <typename U>  
void X<T>::mf(const U &u)  
{  
}  

int main()  
{  
}
{% endhighlight %}

### <a href="https://docs.microsoft.com/en-us/cpp/cpp/function-templates" target="_blank">Function Templates</a>
With function templates, you can specify a set of functions that are based on the same code but act on different types or classes.
{% highlight c++ lineos %}
// function_templates1.cpp  
template< class T > void MySwap( T& a, T& b ) {  
   T c(a);   
   a = b;   
   b = c;  
}  
int main() {  
}
{% endhighlight %}

### Reference
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/templates-cpp" target="_blank"> Templates(C++) </a>
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/class-templates" target="_blank">Class Templates</a>
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/function-templates" target="_blank">Function Templates</a>