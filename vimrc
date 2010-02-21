
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 May 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.

" Set encoding to utf-8:
" set encoding=iso-8859-1
set encoding=utf-8
set termencoding=utf-8

let hs_highlight_boolean=1
let hs_highlight_types=1
let hs_highlight_debug=1

if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ic

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
" map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
set nowrap
set sidescroll=10
set whichwrap=b,s,h,l,<,>,[,]
set iskeyword+=-
set sessionoptions+=resize
set viminfo='1000,<50,s10,h
set path+=/usr/local/include/
set hidden
set shiftwidth=4
set tabstop=4
set expandtab

set backupdir=~/.vim_backup

let g:xterm16_brightness='default'
let g:xterm16_colormap='soft'
" colorscheme xterm16
colorscheme delek

set cinoptions+=l-1s,p0,t0,+2s
set cedit=<ESC>

source $VIMRUNTIME/ftplugin/man.vim

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  autocmd FileType pdc setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "autocmd BufRead *.lsp,*.lisp,*.linj so ~/src/VIlisp-2.2/VIlisp.vim

endif " has("autocmd")

" add global mappings:

" man page mapping for K
nnoremap <silent> K :Man <cword><CR>

nnoremap <silent> <C-N> :silent nohl<CR>	"press C-N do unhilte searches
nnoremap <C-O> i?<ESC>r	"inserts exaclty one char
nnoremap <C-P> a?<ESC>r	"appends exactly one char
nnoremap ,c xph		"xchg 2 letters

" nnoremap <F2> :emenu Puffer.<C-Z>	"show buffer menu

nnoremap <C-Tab> :bnext<CR>	"switch to next buffer
nnoremap <S-Tab> :bp<CR> 	"switch to previous buffer

" install java commenter
autocmd FileType java let b:jcommenter_class_author='' 
autocmd FileType java let b:jcommenter_file_author=''
autocmd FileType java source ~/.vim/macros/jcommenter.vim 
autocmd FileType java map <M-c> :call JCommentWriter()<CR>

" init omnicompletion  for c
autocmd FileType c set omnifunc=ccomplete#Complete
set cot=menu

" "let maplocalleader=','

map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>

map <leader>b :FuzzyFinderBuffer<CR>
map <leader>d :FuzzyFinderDir<CR>
map <leader>f :FuzzyFinderFile<CR>
map <leader>g :FuzzyFinderTag<CR>


" settings for javaImp
let g:JavaImpPaths= $HOME."/.vim/JavaImp/jmplist"
let g:JavaImpDataDir= $HOME."/.vim/JavaImp/"
let g:JavaImpDocPaths= "/usr/java/jsdk/docs/api"

"settings for JavaBrowser
let g:JavaBrowser_Ctags_Cmd=$HOME."/bin/ctags"

" java syntax options:
let java_allow_cpp_keywords=1

" mini buffer explorer
let g:miniBufExplMaxHeight = 4
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavArrows = 1

" tag list
let g:Tlist_Ctags_Cmd = $HOME."/bin/ctags"
let g:Tlist_Inc_Winwidth = 0

" tag browser
let g:TE_Ctags_Path= $HOME."/bin/ctags"
let g:TE_Adjust_Winwidth=0

" tag menu
let g:Tmenu_ctags_cmd=$HOME."/bin/ctags"

" explorer settings:
let g:explVertical = 1
let g:explDetailedHelp = 1

" EasyGrep Setup
let g:EasyGrepMode=1
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=0
let g:EasyGrepHidden=0
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=0
let g:EasyGrepOpenWindowOnMatch=0
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepFileAssociationsInExplorer=1
let g:EasyGrepNoDirectMappings=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepReplaceAllPerFile=0

map ,m :make<Enter><Enter><Enter>
map ,,m :make 
map ,lm :mak<Up><Enter><Enter><Enter>

" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
"sunmap w 
"sunmap b 
"sunmap e 

" configure supertab 
" let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabMappingTabLiteral = '<C-S-Tab>'
imap <S-Tab> <C-x><C-o>

" configure snipMate"
let g:snip_author = ''

" cscope options:
:set cst

nmap ,cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap ,cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap ,cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap ,ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap ,ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" turn of autoclose"
let g:autoclose_on = 0

" configure haskell mode
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:haddock_docdir = "/usr/share/doc/ghc/html/"
au Bufenter *.hs compiler ghc

nmap <TAB> <C-^>
