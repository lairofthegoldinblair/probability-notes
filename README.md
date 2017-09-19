Probability
=================

These are the notes that I have been taking as I try to learn (measure
theoretic) probability theory.  My main reference is Kallenberg's "Foundations
of Modern Probability" but I've been trying to incorporate some more basic
material as well as some applications (e.g. statistics).  The documents use
AMS-LaTeX but are otherwise pretty basic.  I use the TeX support that comes
builtin with Aquamacs and everything works fine without any modifications.

Compilation
-----------
Any recent LaTeX distribution will do (for example TeXLive-2017 or MacTeX-2017).

    $ make

will process the book three times to resolve all cross-references.
You can specify how many times run it through latex:

    $ make 1      # run once
    $ make 2      # run twice
    $ make 3      # run 3 times
    $ make 4      # run 4 times (maximum)
