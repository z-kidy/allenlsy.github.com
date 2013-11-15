## 1. Pointer Review

`int *p` makes compiler confused where `p` points to. We should always initialise with `int *p = NULL;`.

`NULL` is defined in `stddef.h`, `#define NULL ((void *)0)`

Pointer in function prototype can also be written as array. `void func(int a[10])` equals `void func(int *a)` equals `void func(int a[])`.

### 1.1 Pointer and `const`

* `const int *a`: pointer of a const int. Therefore, the value cannot be changed, but a can point to else where.
* `int const *a`: same as above
* `int * const a`: a constant pointer points to a int. `*a` can be changed, but `a` cannot point to else where.
* `int const * const a`: combination of the two above. Both the address and the value cannot be changed.

### 1.2 Pointer of pointer & pointer array

Look at an example

<pre lang="c">
int i;
int *pi = &i;
int **ppi = &pi;
</pre>

