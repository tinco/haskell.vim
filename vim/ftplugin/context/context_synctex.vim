
if exists("b:did_context_synctex_plugin")
    finish
endif
let b:did_context_synctex_plugin = 1

function! SynctexShow()
    let synctex = glob("*.synctex.gz")
    if strlen(synctex) == 0
        echo "no synctex file found"
    else
        let pdffile = substitute(synctex,"synctex.gz","pdf","")
        let execline = printf(":!/Applications/Skim.app/Contents/SharedSupport/displayline -b %d %s %s", line("."),shellescape(pdffile),shellescape(bufname("%")))
        exec execline
    end
endfunction

map <buffer> <localleader>f :call SynctexShow()<Enter><Enter>

