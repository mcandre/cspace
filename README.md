# cspace - Poster visualization of the Collatz Conjecture / Hailstone Sequence

# HOMEPAGE

[http://www.yellosoft.us/cspace](http://www.yellosoft.us/cspace)

# REQUIREMENTS

 - [GraphViz](http://www.graphviz.org/)
 - [LaTeX](http://latex.org/)
 - [Haskell](http://haskell.org/)
 - [graphviz](http://hackage.haskell.org/packages/archive/graphviz/latest/doc/html/Data-GraphViz.html)
 - [quickcheck](http://hackage.haskell.org/package/QuickCheck)

## Optional

* [Ruby](https://www.ruby-lang.org/) 1.9+
* [Guard](http://guardgem.org/) 1.8.2+

Use `bundle` to install Guard.

# DEVELOPMENT

## Guard

Start Guard in a shell, and it will automatically run unit tests when the source code changes:

    $ guard
        ...

## Lint

Keep the code tidy:

    $ make lint

# EXAMPLE

    $ cabal install graphviz quickcheck
    $ make
