---
layout: post
title: Effective Java 8 - Exception
excerpt: 
tags: [java]

---

![](http://www.crazysmoove.com/memjug/javabooks-slides/images/Effective_Java.jpg)
<br />

* [57. Use exceptions only for exceptional conditions](#i57)
* [58. Use checked exceptions for recoverable conditions and runtime exceptions for programming errors](#i58)
* [59. Avoid unnecessary use of checked exceptions](#i59)
* [60. Favor the use of standard exceptions](#i60)
* [61. Throw exceptions appropriate to the abstraction](#i61)
* [62. Document all exceptions thrown by each method](#i62)
* [63. Include failure-capture information in detail messages](#i63)
* [64. Strive for failure atomicity](#i64)
* [65. Do not ignore exceptions ](#i65)

* * *


## 57. Use exceptions only for exceptional conditions {#i57}

Do not use `catch` block to implement regular control flow.

Actually, executing `catch` block is 100 times slower than normal block.

A well-designed API must not force its clients to use exceptions for ordinary control flow.

## 58. Use checked exceptions for recoverable conditions and runtime exceptions for programming errors {#i58}

Java provides three throwables:

#### Checked exception

Use `try..catch` to implement it. If the caller want to recover after failed in the method, then we should use checked exception. It forces programmer to deal with exceptions. 

#### Unchecked exception: run-time exception

__Unchecked exception should not be catched inside the method. It always means a unrecoverable condition.__

If program runs to __precondition violation__, we can throw runtime exception. eg. `ArrayIndexOutofBoundsException`

You'd better extends from `RuntimeException` if you have a custom exception class.

#### Unchecked exception: Error

Uncatched throwable.

## 59. Avoid unnecessary use of checked exceptions {#i59}

Checked exception will make program more complicated.

{% highlight java %}
// Invocation with state-testing method and unchecked exception
if (obj. actionPermitted(args)) {
	obj.action(args);
} else {
	// Handle exceptional condition
}
{% endhighlight %}

## 60. Favor the use of standard exceptions {#i60}

* `IllegalArgumentException`
* `IllegalStateException`
* `NullPointerException`
* `ConcurrentModificationException`
* `UnsupportedOperationException`

## 61. Throw exceptions appropriate to the abstraction {#i61}

If the throwing exception has no obvious relation with the executing job, higher level implementation should catch the exception, and throw an exception with good explanation. This is called __exception translation__.

#### Example from `List<E>`

{% highlight java %}
public E get(int index) {
	ListIterator<E> i = listIterator(index);
	try {
		return i.next();
	} catch (NoSuchElementException e) {
		throw new IndexOutOfBoundsException("Index: " + index);
	}
}
{% endhighlight %}

#### Exception chaining

Pass lower level exception to the constructor of a higher level exception, for the purpose of better debugging. 

The custom exception should be like:

{% highlight java %}
class HigherLevelException extends Exception {
	HigherLevelException(Throwable cause) {
		super(cause);
	}
}
{% endhighlight %}

`Throwable` has `initCause()` to set cause, and `getCause()` to access cause.

## 62. Document all exceptions thrown by each method {#i62}

Use `@throws` to note down the condition that method may throw exception, describe the precondition.

Use `@throws` to note down the unchecked exception, but do not use `throws` keyword to declare them in the method prototype.

## 63. Include failure-capture information in detail messages {#i63}

Set good exception message.

## 64. Strive for failure atomicity {#i64}

__Failure atomic__: A failed method invocation should leave the object in the state that it was in prior to the invocation.

There are several approaches to implement failure atomicity.

* Validate parameters before computation.
* Compute the result first, to see whether there is an exception. If result is valid, then set it to the object.
* Create recovery code, like rollback operation. It is not very recommended.
* Create a copy of the object and compute. If valid, replace the original one with the copy.

## 65. Do not ignore exceptions {#i65}

Do not write empty catch block. At least comment why the exception can be ignored.

