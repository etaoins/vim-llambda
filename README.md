Introduction
============

This is a fork of VIm's builtin Scheme syntax highlighting with a number of changes:

* Recognition of syntax and procedures supplied by R7RS and `(llambda typed)`

* Support for multi-line comments are enabled by default

* Curly infix lists are highlighted as a normal proper lists

* `#true`, `#false` and `#!unit` are considered constants

Usage
=====

By default this will not register with any file types.
To have all files with the `.scm` extension use Llambda highlighting add the following to your `.vimrc`:

```vim
au BufNewFile,BufRead *.scm set filetype=llambda
```
