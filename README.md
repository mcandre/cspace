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

* [ruby](https://www.ruby-lang.org/) 2.3+
* [hlint](https://github.com/ndmitchell/hlint)
* `lacheck`
* [aspelllint](https://github.com/mcandre/aspelllint)
* [pargs](https://github.com/mcandre/pargs)
* [editorconfig-tools](https://www.npmjs.com/package/editorconfig-tools)

# DEVELOPMENT

## Build

```
$ make
```

## Clean

```
$ make clean
```

## Linting

```
$ make lint
```

## Spell Check

```
$ aspelllint
...
```
