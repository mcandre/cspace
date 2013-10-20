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
* [hlint](https://github.com/ndmitchell/hlint)
* `lacheck`

Install Guard:

    $ bundle

Install HLint:

    $ cabal install hlint

# DEVELOPMENT

## BUILD

    $ make

## CLEAN

    $ make clean

## LINT

    $ make lint

## GUARD

Guard can automatically recompile as you code.

    $ guard
    $ emacs .

Guard can automatically lint as you code.

    $ guard -G Guardfile-lint
    $ emacs .

# EXAMPLE

    $ cabal install graphviz quickcheck
    $ make
