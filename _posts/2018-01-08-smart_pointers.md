--- 
layout: post 
title: "Smart Pointers" 
date: 2018-01-08 21:54:36 
author: Dewey Mao 
categories: C/C++ 
--- 

In modern C++ programming, the Standard Library includes smart pointers, 
which are used to help ensure that programs are free of memory and resource leaks and are exception-safe.

### 1 Uses for smart pointers
Smart pointers are defined in the std namespace in the <memory> header file. 
They are crucial to the <a href="https://docs.microsoft.com/en-us/cpp/cpp/objects-own-resources-raii" target="_blank">RAII</a> or Resource Acquisition Is Initialialization programming idiom. 
The main goal of this idiom is to ensure that resource acquisition occurs at the same time that the object is initialized, 
so that all resources for the object are created and made ready in one line of code.

{% highlight c++ lineos %}
class LargeObject
{
public:
    void DoSomething(){}
};

void ProcessLargeObject(const LargeObject& lo){}

void SmartPointerDemo()
{    
    // Create the object and pass it to a smart pointer
    std::unique_ptr<LargeObject> pLarge(new LargeObject());

    //Call a method on the object
    pLarge->DoSomething();

    // Pass a reference to a method.
    ProcessLargeObject(*pLarge);

    // Pass raw pointer to a legacy API
    LegacyLargeObjectFunction(pLarge.get()); 

    // Free the memory before we exit function block.
    pLarge.reset();

} //pLarge is deleted automatically when function block goes out of scope.
{% endhighlight %}

- Declare the smart pointer as an automatic (local) variable. (Do not use the 'new' or 'malloc' expression on the smart pointer itself.)
- In the type parameter, specify the pointed-to type of the encapsulated pointer.
- Pass a raw pointer to a new-ed object in the smart pointer constructor. 
- Use the overloaded -> and * operators to access the object.
- Let the smart pointer delete the object.
- Smart pointers have their own member functions, which are accessed by using 'dot' notation. 
- Smart pointers usually provide a way to access their raw pointer by get() member function directly.

### 2 <a href="https://docs.microsoft.com/en-us/cpp/standard-library/unique-ptr-class" target="_blank"> unique_ptr </a>
A unique_ptr does not share its pointer. It cannot be copied to another unique_ptr, passed by value to a function, or used in any C++ Standard Library algorithm that requires copies to be made. 
A unique_ptr can only be moved. This means that the ownership of the memory resource is transferred to another unique_ptr and the original unique_ptr no longer owns it. 

The following example shows how to create unique_ptr instances and pass them between functions.
{% highlight c++ lineos %}
unique_ptr<Song> SongFactory(const std::wstring& artist, const std::wstring& title)
{
    // Implicit move operation into the variable that stores the result.
    return make_unique<Song>(artist, title);
}

void MakeSongs()
{
    // Create a new unique_ptr with a new object.
    auto song = make_unique<Song>(L"Mr. Children", L"Namonaki Uta");

    // Use the unique_ptr.
    vector<wstring> titles = { song->title };

    // Move raw pointer from one unique_ptr to another.
    unique_ptr<Song> song2 = std::move(song);

    // Obtain unique_ptr from function that returns by value.
    auto song3 = SongFactory(L"Michael Jackson", L"Beat It");
}
{% endhighlight %}

The following example shows how to create unique_ptr instances and use them in a vector.
{% highlight c++ lineos %}
void SongVector()
{
    vector<unique_ptr<Song>> songs;

    // Create a few new unique_ptr<Song> instances
    // and add them to vector using implicit move semantics.
    songs.push_back(make_unique<Song>(L"B'z", L"Juice"));
    songs.push_back(make_unique<Song>(L"Namie Amuro", L"Funky Town"));
    songs.push_back(make_unique<Song>(L"Kome Kome Club", L"Kimi ga Iru Dake de"));
    songs.push_back(make_unique<Song>(L"Ayumi Hamasaki", L"Poker Face"));

    // Pass by const reference when possible to avoid copying.
    for (const auto& song : songs)
    {
        wcout << L"Artist: " << song->artist << L"   Title: " << song->title << endl; 
    }    
}
{% endhighlight %}

The following example shows how to initialize a unique_ptr that is a class member.
{% highlight c++ lineos %}
class MyClass
{
private:
    // MyClass owns the unique_ptr.
    unique_ptr<ClassFactory> factory;
public:

    // Initialize by using make_unique with ClassFactory default constructor.
    MyClass() : factory ( make_unique<ClassFactory>())
    {
    }

    void MakeClass()
    {
        factory->DoSomething();
    }
};
{% endhighlight %}

You can use make_unique to create a unique_ptr to an array, but you cannot use make_unique to initialize the array elements.
{% highlight c++ lineos %}
// Create a unique_ptr to an array of 5 integers.
auto p = make_unique<int[]>(5);

// Initialize the array.
for (int i = 0; i < 5; ++i)
{
	p[i] = i;
	wcout << p[i] << endl;
}
{% endhighlight %}

### 3 <a href="https://docs.microsoft.com/en-us/cpp/standard-library/shared-ptr-class" target="_blank"> shared_ptr </a>
The shared_ptr type is a smart pointer in the C++ standard library that is designed for scenarios in which more than one owner might have to manage the lifetime of the object in memory. 
After you initialize a shared_ptr you can copy it, pass it by value in function arguments, and assign it to other shared_ptr instances. 
All the instances point to the same object, and share access to one "control block" that increments and decrements the reference count 
whenever a new shared_ptr is added, goes out of scope, or is reset. When the reference count reaches zero, the control block deletes the memory resource and itself.

Whenever possible, use the make_shared function to create a shared_ptr when the memory resource is created for the first time. 
{% highlight c++ lineos %}
// Use make_shared function when possible.
auto sp1 = make_shared<Song>(L"The Beatles", L"Im Happy Just to Dance With You");

// Ok, but slightly less efficient. 
// Note: Using new expression as constructor argument
// creates no named variable for other code to access.
shared_ptr<Song> sp2(new Song(L"Lady Gaga", L"Just Dance"));

// When initialization must be separate from declaration, e.g. class members, 
// initialize with nullptr to make your programming intent explicit.
shared_ptr<Song> sp5(nullptr);
//Equivalent to: shared_ptr<Song> sp5;
//...
sp5 = make_shared<Song>(L"Elton John", L"I'm Still Standing");
{% endhighlight %}

The following example shows how to declare and initialize shared_ptr instances that take on shared ownership of an object that has already been allocated by another shared_ptr. 
Assume that sp2 is an initialized shared_ptr.
{% highlight c++ lineos %}
//Initialize with copy constructor. Increments ref count.
auto sp3(sp2);

//Initialize via assignment. Increments ref count.
auto sp4 = sp2;

//Initialize with nullptr. sp7 is empty.
shared_ptr<Song> sp7(nullptr);

// Initialize with another shared_ptr. sp1 and sp2
// swap pointers as well as ref counts.
sp1.swap(sp2);
{% endhighlight %}

shared_ptr is also helpful in C++ Standard Library containers when you are using algorithms that copy elements. 
You can wrap elements in a shared_ptr, and then copy it into other containers with the understanding that the underlying memory is valid as long as you need it, and no longer. 
The following example shows how to use the remove_copy_if algorithm on shared_ptr instances in a vector.
{% highlight c++ lineos %}
vector<shared_ptr<Song>> v;

v.push_back(make_shared<Song>(L"Bob Dylan", L"The Times They Are A Changing"));
v.push_back(make_shared<Song>(L"Aretha Franklin", L"Bridge Over Troubled Water"));
v.push_back(make_shared<Song>(L"Thal?a", L"Entre El Mar y Una Estrella"));

vector<shared_ptr<Song>> v2;
remove_copy_if(v.begin(), v.end(), back_inserter(v2), [] (shared_ptr<Song> s) 
{
    return s->artist.compare(L"Bob Dylan") == 0;		
});

for (const auto& s : v2)
{
    wcout << s->artist << L":" << s->title << endl;
}
{% endhighlight %}

You can use dynamic_pointer_cast, static_pointer_cast, and const_pointer_cast to cast a shared_ptr. 
These functions resemble the dynamic_cast, static_cast, and const_cast operators. 
The following example shows how to test the derived type of each element in a vector of shared_ptr of base classes, and then copy the elements and display information about them.
{% highlight c++ lineos %}
vector<shared_ptr<MediaAsset>> assets;

assets.push_back(shared_ptr<Song>(new Song(L"Himesh Reshammiya", L"Tera Surroor")));
assets.push_back(shared_ptr<Song>(new Song(L"Penaz Masani", L"Tu Dil De De")));
assets.push_back(shared_ptr<Photo>(new Photo(L"2011-04-06", L"Redmond, WA", L"Soccer field at Microsoft.")));

vector<shared_ptr<MediaAsset>> photos;

copy_if(assets.begin(), assets.end(), back_inserter(photos), [] (shared_ptr<MediaAsset> p) -> bool
{
    // Use dynamic_pointer_cast to test whether
    // element is a shared_ptr<Photo>.
    shared_ptr<Photo> temp = dynamic_pointer_cast<Photo>(p);		
    return temp.get() != nullptr;
});

for (const auto&  p : photos)
{
    // We know that the photos vector contains only 
    // shared_ptr<Photo> objects, so use static_cast.
    wcout << "Photo location: " << (static_pointer_cast<Photo>(p))->location_ << endl;
}
{% endhighlight %}

### 4 <a href="https://docs.microsoft.com/en-us/cpp/standard-library/weak-ptr-class" target="_blank"> weak_ptr </a>
Sometimes an object must store a way to access the underlying object of a shared_ptr without causing the reference count to be incremented. 
Typically, this situation occurs when you have cyclic references between shared_ptr instances.	
The best design is to avoid shared ownership of pointers whenever you can. 
However, if you must have shared ownership of shared_ptr instances, avoid cyclic references between them. 
When cyclic references are unavoidable, or even preferable for some reason, use weak_ptr to give one or more of the owners a weak reference to another shared_ptr. 

### 5 Reference
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/smart-pointers-modern-cpp" target="_blank"> Smart Pointers </a>   
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/how-to-create-and-use-unique-ptr-instances" target="_blank"> How to: Create and Use unique_ptr Instances </a>   
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/how-to-create-and-use-shared-ptr-instances" target="_blank"> How to: Create and Use shared_ptr Instances </a>   
- <a href="https://docs.microsoft.com/en-us/cpp/cpp/how-to-create-and-use-weak-ptr-instances" target="_blank"> How to: Create and Use weak_ptr Instances </a>   
{% highlight c++ lineos %}

{% endhighlight %}