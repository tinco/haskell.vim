" setlocal foldmethod=syntax
" setlocal foldlevel=1
" setlocal foldcolumn=4

setlocal shiftwidth=4
setlocal tabstop=4

setlocal autoindent
setlocal smartindent

let java_highlight_java_lang_ids=1
let java_allow_cpp_keywords=1

compiler ant

func! JAVA_EatChar(pat)
	let c=nr2char(getchar())
	return (c =~ a:pat) ? '' : c
endfunc

func! JAVA_insert_p()
    exec "normal i \e"
    let modeVal=synIDattr( synIDtrans( synID(line("."), col("."), 0)), "name")
    return modeVal!=?"Constant" && modeVal!=?"Comment"
endfunc

func! JAVA_replace(name, repl)
    if JAVA_insert_p()
	exec a:repl
	return ""
    else
	exec a:name
	return " "
    endif
endfunc

" iabbrev <silent> <buffer> for for<C-R>=JAVA_replace("", "normal i (){\n}\ekf(\el")<Enter><C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> if if<C-R>=JAVA_replace("", "normal i (){\n}\ekf(\el")<Enter><C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> elif <C-R>=JAVA_replace("elif", "normal ielse if\el")<Enter><C-R>=JAVA_EatChar('\s')<CR>
" iabbrev <silent> <buffer> for <C-R>=JAVA_insert_p()<Enter><C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> fori for (int i=0; ; i++){<ENTER>}<ESC>k^f;la<C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> forint for (int){<ENTER>}<ESC>kf)i
"abbrev <silent> <buffer> foriti for (Iterator i=; i.hasNext();){<Enter>}<ESC>kf=a<C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> forit for (Iterator){<ENTER>}<ESC>kf)i
"abbrev <silent> <buffer> while while<C-R>=JAVA_replace("", "normal i (){\n}\ekf(\el")<ENTER><C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> sysout <C-R>=JAVA_replace("normal isysout", "normal iSystem.out.println();\eF)")<CR><C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> syserr <C-R>=JAVA_replace("normal isyserr", "normal iSystem.err.println();\eF)")<CR><C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> privfun private(){<Enter>}<ESC>kf(i
"abbrev <silent> <buffer> pubfun public(){<Enter>}<ESC>kf(i
"abbrev <silent> <buffer> profun protected(){<Enter>}<ESC>kf(i
"abbrev <silent> <buffer> tryc try{<ENTER>}catch(){}<ESC>F)i<C-R>=JAVA_EatChar('\s')<CR>
"abbrev <silent> <buffer> trya try{<ENTER>}catch(Exception e){}<ESC>O<C-R>=JAVA_EatChar('\s')<CR>
