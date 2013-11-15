Function interface
---

## 1. `malloc` and `free`[](#1)

`malloc` is used to dynamiclly allocate memory by calling system call `brk`. After allocation, we should use `free` to release the memory, return the memory to `malloc`.

<pre lang="c">
#include <stdlib.h>
void *malloc(size_t size);
void free  (void *ptr)
</pre>

#### Example

<pre lang="c">
#include <stdio.h>

}	
</pre>

Several things to notice:

* `unit_t *p = malloc(sizeof(unit_t));`, `void *` can be implicit converted to any other pointer type.
* Although normally memory will not be exhausted, but after `malloc`, we should check whether it is successful, by checking whether the return value is `NULL`
* After `free( p )`, the memory space of `p` is returned, but the value of `p` is not changed. Now `p` is a __wild pointer__(pointing to somewhere not exist). We should set `p = NULL` after `free( p )`
* When calling `free( p )`, the program knows how large space has been allocated to `p` by `malloc`. It will free the part allocated to `p`.

## 2. pass-in parameter & pass-out parameter

<pre lang="c">
void func(unit_t *p);
</pre>

If `*p` points to somewhere exist, and `func()` will read data from the space, then `*p` is called __pass-in__ parameter.

If `*p` points to nowhere, and `func()` will assign `*p` the address, then `*p` is called __pass-out__ parameter.

If `*p` points to somewhere exist, and `func()` will read data and change data in that space, then `*p` is called __value-result__ parameter.

## 3. double pointer

#### Example

<pre lang="c">
/* redirect_ptr.h */

/* redirect_ptr.c */



gcc main1.c redirect_ptr.c -o main
./main
</pre>

## 4. Callback function

<pre lang="c">
void func(void (*f)(void *), void *p);
</pre>

The first parameter of `func` is a function pointer `f`. `f` should take one parameter of type `void *`, and return a `void *` value. The second parameter is just a `void *` value.

#### Example: comparison function

<pre lang="c">

/* generics.h */

/* generics.c */

/* main2.c */
#include "generics.h"
typedef struct { 
    const char *name;
    int score;
} student_t;

// Comparison function of two student
int cmp_student(void *a, void *b) {
    if(((student_t *)a)->score > ((student_t *)b)->score)
        return 1;
    else if(((student_t *)a)->score == ((student_t*)b)->score) 
        return 0;
    else
        return -1;
}

int main(void)
{
    student_t list[4] = {{"Tom", 68}, {"Jerry", 72}, {"Moby", 60}, {"Kirby", 89}};
    student_t *plist[4] = {&list[0], &list[1], &list[2], &list[3]};
    student_t *pmax = max((void **)plist, 4, cmp_student);
    printf("%s gets the highest score %d\n", pmax->name, pmax->score);
    return 0; 
}



#include <stdio.h>
#include <stdarg.h>
void myprintf(const char *format, ...)
{
    va_list ap;
    char c;
    va_start(ap, format); 
    while (c = *format++) {
        switch(c) {
            case 'c': {
                /* char is promoted to int when passed through '...' */
                char ch = va_arg(ap, int); putchar(ch);
                break;
            }
            case 's': {
                char *p = va_arg(ap, char *); fputs(p, stdout);
                break;
            } 
            default:
                putchar(c);
        }
    }
    va_end(ap);
}
int main(void)
{
    myprintf("c\ts\n", '1', "hello");
    return 0; 
}
￼</pre>

Variable length arguments requires `stdarg.h`, and `va_list` type and `va_start`, `va_atg`, `va_end` macro.

`va_list ap`: `ap` is a pointer

`va_start(ap, format)`: let `ap` points to the next memory position of `format`

`va_arg(ap, int)`: get next value in `ap` as `int`, and move ap to the next position

`va_end(ap)`: is a callback. Will be called at here.

