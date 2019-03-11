# LERAXANDRIA

A personal collection of functions, macros and programs written in
Common Lisp. Since 2014 I've been trying to learn Common Lisp
properly. This scripts are the side effects of my learning journey.

Maybe some functions can be useful for someone, because that I'm
providing now in 2019 this collection as a proper ASDF system which
will be available on [ultralisp].

[ultralisp]: http://ultralisp.org

# How to use

Install [quicksys] via [roswell] as:

``` bash
ros install commonlispbr/quicksys
```

Install ultralisp dist:

``` bash
ros run -s quicksys -e "(qs:install-dist :ultralisp)" -q
```

Load leraxandria via `ros run`:

``` bash
(ql:quickload :leraxandria)
```

[quicksys]: https://github.com/commonlispbr/quicksys
[roswell]: https://github.com/roswell/roswell

# Why this is useful?

The main utilities are:

* `primep`
* `factors`
* `common-divisors`
* `bits-to-integer`
* `list-of-bits`
* `memoize`
* `transduce`
* `range`
* `partial`
* `comp`
* `filter`
* `find-substring`
* `staircase`
* `compress-string`

# Apps

You can find more stuff as self-contained system apps at
`leraxandria/apps` and `leraxandria/gui` systems. The main
packages are:

* leraxandria/brainfuck
* leraxandria/game-of-life
* leraxandria/game-of-life/lain¹
* leraxandria/gui


All the main packages entrypints are the `main` function.

¹: _same version of the Serial Experiments Lain anime!_
