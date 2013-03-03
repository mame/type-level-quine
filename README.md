Type-level-Quine
================

A type-level Quine in Haskell.

## How to run the proof-of-concept version

    $ ghc -fcontext-stack=2048 type-level-quine-poc.hs
    $ ./type-level-quine-poc

NOTE:

* `-fcontext-stack=2048` is required. (Otherwise, ghc will fail with stack overflow)
* The compilation may take a few minutes.
* The result is partially snipped; this is not a complete quine.

## How to run the full version

    $ ghc -fcontext-stack=2048 type-level-quine.hs
    $ ./type-level-quine

NOTE:

* **This may make your OS stuck** because of short of memory.
* Actually I has failed to confirm this.

## References

Both are written in Japanese.

* http://d.hatena.ne.jp/keigoi/20090418/1240060720
* http://d.hatena.ne.jp/ku-ma-me/20130303/p1
