--- 
layout: post 
title: "Simple Implementation of Factory Pattern" 
date: 2017-06-26 16:16:57 
author: Dewey Mao 
categories: C/C++ 
--- 

Factory Pattern provides a best method that hides the implementation logic to create an object.

{% highlight c++ linenos %}
//FactoryPattern.h
#pragma once
#include <memory>

enum ShapeType { CIRCLE, RECTANGLE };

class Shape {
public:
	Shape();
	virtual ~Shape();
	virtual void Draw() = 0;
	const ShapeType& getType() { return type; };

protected:
	ShapeType type;
};

class Circle : public Shape {
public:
	Circle();
	virtual ~Circle();
	virtual void Draw();

	static std::shared_ptr<Circle> SafeDownCast(std::shared_ptr<Shape> pShape);

private:
	double radius;
};

class Rectangle : public Shape {
public:
	Rectangle();
	virtual ~Rectangle();
	virtual void Draw();

	static std::shared_ptr<Rectangle> SafeDownCast(std::shared_ptr<Shape> pShape);

private:
	double length;
	double width;
};

class ShapeFactory {
public:
	ShapeFactory();
	~ShapeFactory();

	static std::shared_ptr<Shape> CreateShape(const ShapeType& type);
};
{% endhighlight %}

{% highlight c++ linenos %}
//FactoryPattern.cpp
#include "stdafx.h"
#include "FactoryPattern.h"
using namespace std;

Shape::Shape() {}
Shape::~Shape() {}

Circle::Circle() : radius(0) { type = ShapeType::CIRCLE; }
Circle::~Circle() {}
void Circle::Draw() {	printf("Circle\n"); }
shared_ptr<Circle> Circle::SafeDownCast(shared_ptr<Shape> pShape) {
	if (pShape == nullptr) { return nullptr; }
	if (pShape->getType() == ShapeType::CIRCLE) {
		return static_pointer_cast<Circle>(pShape);
	} else {
		return nullptr;
	}
}

Rectangle::Rectangle() : length(0), width(0) { type = ShapeType::RECTANGLE; }
Rectangle::~Rectangle() {}
void Rectangle::Draw() { printf("Rectangle\n"); }
std::shared_ptr<Rectangle> Rectangle::SafeDownCast(shared_ptr<Shape> pShape) {
	if (pShape == nullptr) { return nullptr; }
	if (pShape->getType() == ShapeType::RECTANGLE) {
		return static_pointer_cast<Rectangle>(pShape);
	} else {
		return nullptr;
	}
}

std::shared_ptr<Shape> ShapeFactory::CreateShape(const ShapeType& type) {
	switch (type){
	case ShapeType::CIRCLE:
		return shared_ptr<Shape>(new Circle());
	case ShapeType::RECTANGLE:
		return shared_ptr<Shape>(new Rectangle());
	default:
		break;
	}

	return nullptr;
}

{% endhighlight %}

{% highlight c++ linenos %}
//test
#include "stdafx.h"
#include "FactoryPattern.h"

int _tmain(int argc, _TCHAR* argv[])
{
	auto pShape = ShapeFactory::CreateShape(ShapeType::CIRCLE);
	auto pCircle = Circle::SafeDownCast(pShape);
	if (pCircle) {
		pCircle->Draw();
	}

	auto pShape1 = ShapeFactory::CreateShape(ShapeType::RECTANGLE);
	auto pRectangle = Rectangle::SafeDownCast(pShape1);
	if (pRectangle) {
		pRectangle->Draw();
	}

	getchar();

	return 0;
}
{% endhighlight %}

## Reference
- <a href="http://www.runoob.com/design-pattern/factory-pattern.html" target="_blank">Factory Pattern</a>
- <a href="http://www.cnblogs.com/lanxuezaipiao/p/4132096.html" target="_blank">Simple Analysis of Smart Pointers</a>