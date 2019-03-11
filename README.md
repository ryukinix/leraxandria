# LERAXANDRIA

A collection

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

# Why this is useful?

The main utilities are:

* primep
* factors
* common-divisors
* bits-to-integer
* list-of-bits
* memoize
* transduce
* range
* partial
* comp
* filter
* find-substring
* staircase
* compress-string

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
