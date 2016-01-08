# cspace - Poster visualization of the Collatz Conjecture / Hailstone Sequence

# HOMEPAGE

[http://www.yellosoft.us/cspace](http://www.yellosoft.us/cspace)

# EXAMPLE

    $ cabal install graphviz quickcheck
    $ make

# REQUIREMENTS

* [GraphViz](http://www.graphviz.org/)
* [LaTeX](http://latex.org/)
* [ImageMagick](http://www.imagemagick.org/)
* [Haskell](http://haskell.org/)
* [graphviz](http://hackage.haskell.org/packages/archive/graphviz/latest/doc/html/Data-GraphViz.html)
* [quickcheck](http://hackage.haskell.org/package/QuickCheck)

## Optional

* [Ruby](https://www.ruby-lang.org/) 2.3+
* [Guard](http://guardgem.org/) 1.8.2+
* [hlint](https://github.com/ndmitchell/hlint)
* `lacheck`
* [aspelllint](https://github.com/mcandre/aspelllint)

Install Guard and aspelllint with:

    $ bundle

Install HLint:

    $ cabal install hlint

# DEVELOPMENT

## Build

    $ make

## Clean

    $ make clean

## Linting

    $ make lint

## Spell Check

    $ aspelllint
    ...

## Local CI

Guard can automatically recompile as you code.

    $ guard
    $ emacs .

Guard can automatically lint as you code.

    $ guard -G Guardfile-lint
    $ emacs .
