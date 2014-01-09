---
layout: post
title: "Working with Unix Process in Ruby"
subtitle: 
cover_image: 
excerpt: ""
category: ""
tags: [book]
thumbnail: 
draft: true
---

## Reference of Ruby Process related methods

Ruby Library Method | Unix System Method | Description
- | - | -
`Process.pid` | `getpid` | get calling process identification
`Process.ppid` | `getppid` | get parent process identification
`IO#fileno` | | get file descriptor number 
`Process.getrlimit` | `getrlimit` | 
`Process.setrlimit` | `setrlimit` |
 - | `setenv` | set environment variable
 - | `getenv` | get environment variable value
 `Kernel#exit` | exit | exit program
 `Kernel#abort` | | exit, and message print to STDERR
 `Kernel#raise` | | like `raise` in ruby, look for exception handling. Exit if not found.
 

# Basic of Process

* Get process descriptor in shell: `$$`
* In Unix, everything is FILE. Every file gets a descriptor
* Get process name in ruby: `$PROGRAM_NAME`

#### About file descriptor

1. File descriptor number is resuable
2. STDIN, STDOUT, STDERR

{% highlight ruby %}
puts STDIN.fileno 	# => 0puts STDOUT.fileno 	# => 1puts STDERR.fileno 	# => 2
{% endhighlight %}

#### `IO` library in Ruby

`open`, `close`, `read`, `write`, `pipe`, `fsync`, `stat`

#### Resource Limitation of Process

Maximum file descriptor number: `p Process.getrlimit(:NOFILE) # => [2560, 9223372036854775807]`

2560 is __Soft limitation__. To change the sofr limitation, eg. `Process.setrlimit(:NOFILE, 4096)`. Third argument of this method can set hard limitation. It is not reversable.

#### Environment and arguments

* `ENV`: get environment argument into an array in Ruby
* `ARGV`: get arguments from the command line into an array in Ruby

A ruby library `optparse` is used for parsing command line options.

#### Exit code

`exit`, `abort`, `raise`

# Multiple processes: `fork`

Child process will inherit the whole memory of parent process. To improve performance, memory uses _copy-on-write_ strategy.

__IMPORTANT__: `fork` returns nil in child process, returns the pid of child process in parent process.

# Examples: 

{% highlight ruby %}
# IO#fileno
passwd = File.open('/etc/passwd' )puts passwd.fileno# Resource limitationsProcess.getrlimit(:NPROC )Process.getrlimit(:FSIZE )Process.getrlimit(:STACK )
{% endhighlight %}



