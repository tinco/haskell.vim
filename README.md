
This README gives an overview of some of (to me most valuable) configuration
files, so that if you wanna steal some ideas for your own dot files you know
where to watch. All top-level file and directory names match their 'dotted'
counterpart. 

Overview
========

1. Exuberant Ctags (http://ctags.sourceforge.net/)
2. ZSH configuration
3. VIM

Ctags
=====
- add regular expressions for:
     - JavaScript
     - Scala

- install by copying ctags to $HOME/.ctags or use symbolic link

ZSH
===
configuration consists of directory 'zsh' and the files zshenv and zshrc and
all these are in a way interdependent.
Install by copying directory zsh to $HOME/.zsh, zshenv to $HOME/.zshenv and
zshrc to $HOME/.zshrc or create symbolic links.

- directory zsh:
    - bash_completion: copy bash completion files into here if there is no one
                       for zsh and still enjoy full power of auto completion
    - functions: put your own "functions" in here. Those that start with
                 underscore are used for auto completion
    - homes: instead of polluting your zshenv or zshrc files with PATH
             configurations and other environment settings put a file for each
             environment you want to describe in here. The other configuration
             files will automatically load them on start up for you.
- zshenv:
    - set EDITOR=vim
    - create setenv function for csh compatibility
    - load all sources from $HOME/.zsh/homes
    - add $HOME/bin to global $PATH
    - adjust umask
    - configure auto completion
    - set some zsh options

- zshrc:
    - set prompt to: "[\<username\>]\<current directory\> $"
    - set vi style key bindings
    - loads bashcompletions from $HOME/.zsh/bash_completion
    - defines bash like Ctrl-R and Ctrl-S for incremental history search
    - loads of aliases and functions, but see yourself

VIM
===

## Color schemes ##
- some different color schemes for light and dark terminals... Unfortunately
  there is no perfect color scheme at all...

- modified github (http://www.vim.org/scripts/script.php?script_id=2855) color
  scheme to support terminals too (not available from vim.org)

## Additional support for languages ##

- applescript
- c
- haskell (syntax file mostly rewritten by myself)
- haxe
- html
- java
- javascript 
- lisp 
- markdown (mkd)
- objective-c(cocoa)
- opal
- pandoc  (pdc)
- python
- scala 

## Plugins ##

- supertab (http://www.vim.org/scripts/script.php?script_id=1643):
    - Version 1.0
    - the best plugin ever :)

- snipMate (http://github.com/msanders/snipmate.vim):
    - from github
    - textmate like snippets

- cocoa (http://www.vim.org/scripts/script.php?script_id=2674): 
    - Version 0.3
    - eases cocoa development in vim

- Align (http://www.vim.org/scripts/script.php?script_id=294):
    - Verson 35/41
    - simplify alignment of statements

- Nerd tree (http://www.vim.org/scripts/script.php?script_id=1658):
    - Version 4.1.0
    - filesystem navigation plugin

- a.vim (http://www.vim.org/scripts/script.php?script_id=31):
    - Version 2.18
    - switch between source and header files quickly

- cctree (http://www.vim.org/scripts/script.php?script_id=2368):
    - Version 0.65
    - C Call-Tree Explorer - Source-code analysis, real-time display of code
      flow
    - needs cscope

- fuzzyfinder (http://www.vim.org/scripts/script.php?script_id=1984):
    - Version 2.22.3
    - FuzzyFinder provides convenient ways to quickly reach the
      buffer/file/command/bookmark/tag you wan

- haskellmode (http://projects.haskell.org/haskellmode-vim/):
    - Version from 20090430

- surround (http://www.vim.org/scripts/script.php?script_id=1697):
    - Version 1.34
    - Delete/change/add parentheses/quotes/XML-tags/much more with ease

- tcomment (http://www.vim.org/scripts/script.php?script_id=1173):
    - Version 1.10
    - An extensible & universal comment plugin

- yankring (http://www.vim.org/scripts/script.php?script_id=1234):
    - Version 10.0
    - Maintains a history of previous yanks, changes and deletes

- taglist (http://www.vim.org/scripts/script.php?script_id=273):
    - Version 4.5
    - Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)

- repeat (http://www.vim.org/scripts/script.php?script_id=2136):
    - Version 1.0
    - Use the repeat command (.) with supported plugins

- Better Javascript Indentation (http://www.vim.org/scripts/script.php?script_id=2765):
    - Version 1.0.0

- minibufexpl (http://www.vim.org/scripts/script.php?script_id=159):
    - Version 6.3.2
    - Elegant buffer explorer - takes very little screen space

- autoclose (http://www.vim.org/scripts/script.php?script_id=1849):
     - Version 1.2
     (- disabled by default. type \a in normal mode to enable/disable)
     - Inserts matching bracket, paren, brace or quote 

- bclose (http://vim.wikia.com/wiki/Deleting_a_buffer_without_closing_the_window)

