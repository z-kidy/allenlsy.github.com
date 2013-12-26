---
layout: post
title: Effective Java 7 - General Programming
excerpt:
tags: [java]

---

![](http://www.crazysmoove.com/memjug/javabooks-slides/images/Effective_Java.jpg)
<br />

* [45. Minimize the scope of local variables](#i45)
* [46. Prefer for-each loops to traditional `for` loops](#i46)
* [47. Know and use the libraries ](#i47)
* [48. Avoid `float` and `double` of exact answers are required](#i48)
* [49. Prefer primitive types to boxed primitives](#i49)
* [50. Avoid strings where other types are more appropriate](#i50)
* [51. Beware the performance of string concatenation](#i51)
* [52. Refer to objects by their interfaces](#i52)
* [53. Prefer interfaces to reflection](#i53)
* [54. Use native methods judiciously](#i54)
* [55. Optimize judiciously](#i55)
* [56. Adhere to generally accepted naming conventins](#i56)

* * *

## 45. Minimize the scope of local variables {#i45}

* Declare a variable when first using it.
* Declare a local variable with a initial expression
* Prefer for loop to while loop, since while loop may need a extra looping variable

## 46. Prefer for-each loops to traditional `for` loops {#i46}

## 47. Know and use the libraries {#i47}

#### Example: random number generator

{% highlight java %}
private static final Random rnd = new Random();

static int random(int n) {
	return Math.abs(rnd.nextInt()) % n;
}
{% endhighlight %}

There are three flaws.

1. If `n` is a small power of 2, the sequence of random numbers it generates will repeat itself after a fairly short period.
2. If `n` is not a power of 2, some numbers will be returned more frequently than others. If `n` is large, this effect can be quite pronouned.
3. It can fail catastrophically, returning a number outside the specified range.

The easiest way to solve the problem is to use `Random.nextInt(int)`. 

__Use libraries, take advantage of other ones' research, focus on your logic implementation, improve the readability of your code__

Read _java5-feat_, _java6-feat_ page on official website.

## 48. Avoid `float` and `double` of exact answers are required {#i48}

`float` and `double` are not suitable for currency computation.

Use `BigDecimal`, `int` or `long` instead. But `BigDecimal` is slow and not convenient. `int` and `long` is preferred.

## 49. Prefer primitive types to boxed primitives {#i49}

Java 1.5 added new feature of __autoboxing__ and __auto-unboxing__.

__Pay attention__, use `==` on boxed primitive type always make wrong result.

In some circumstances, you have to use boxed primitives:

1. Put element into `Collection`, since `Collection` only accept boxed primitives
2. Generic type doesn't allow primitives either.

## 50. Avoid strings where other types are more appropriate {#i50}

* Strings are poor substitues for other value types
* Strings are poor substitutes for enum types
* Strings are poor substitues for aggregate types. eg. `String compoundKey = className + "#" + i.next();`
* Strings are poor substitues for _capabilities_

## 51. Beware the performance of string concatenation {#i51}

String concatenation is not suitable for concatenate a lot of Strings. 

__Using the string concatenation operator repeatedly to concatenate__ _n_ __strings requires time quadratic in__ _n_.

Use `StringBuilder`.

## 52. Refer to objects by their interfaces {#i52}

## 53. Prefer interfaces to reflection {#i53}

The trade-off of reflection:

* Losing all the benefits of compile-time type checking
* The code required to perform reflective access is clumsy and verbose.
* Performance loss

The core reflection facility was originally designed for component-based application builder tools. It is a design time technique.

#### Example: a program that can be transformed into a type checking program

{% highlight java %}
public static void main(String args[])
{
	Class< ? > cl = null;
	try {
		cl = Class.forName(args[0]);
	} catch (ClassNotFoundException e) {
		System.err.println("Class not found.");
		System.exit(1);
	}

	Set< String > s = null;
	try {
		s = (Set< String >) cl.newInstance();
	} catch (IllegalAccessException e) {
		System.err.println("Class not accessible.");
		System.exit(1);
	} catch (InstantiationException e) {
		System.err.println("Class not instantiable.");
		System.exit(1);
	}

	s.addAll(Arrays.asList(args).subList(1, args.length));
	System.out.println(s);
}
{% endhighlight %}

## 54. Use native methods judiciously {#i54}

__JNI__ is used to call native method, such as C/C++ programs. It is mainly used to accessible platform specific stuff, such as registry and file lock.

It is rarely advisable to use native methods for improved performance.

## 55. Optimize judiciously {#i55}

> We should forget about small efficiencies, say about 97% of the timeL premature optimization is the root of all evil.
> -- Donald Knuth

> Do not optimize until you have a perfectly clear and unoptimized solution.
> -- M.A.Jackson

## 56. Adhere to generally accepted naming conventins {#i56}
