" Opal abbrevations file
" Language:	Opal
"

if exists("b:opal_done") 
    finish
endif
let b:opal_done = 1

func! Opal_EatChar(pat)
	let c=nr2char(getchar())
	return (c =~ a:pat) ? '' : c
endfunc

func! Opal_insert_p()
    let modeVal=synIDattr( synIDtrans( synID(line("."), col("."), 0)), "name")
    return modeVal!=?"Constant"
endfunc

func! Opal_replace(name, repl)
     if Opal_insert_p()
	 exec a:repl
	 return ""
     else
	return a:name
     endif
endfunc


" Imports
ia <silent> <buffer> import  <C-R>=Opal_replace("import", "normal \eiIMPORT ")<ENTER>
ia <silent> <buffer> completely <C-R>=Opal_replace("completely ", "normal \eiCOMPLETELY ")<ENTER>
ia <silent> <buffer> only ONLY
ia <silent> <buffer> assert <C-R>=Opal_replace("assert ", "normal \eiASSERT ")<ENTER>
ia <silent> <buffer> assume <C-R>=Opal_replace("assume ", "normal \eiASSUME ")<ENTER>


" Sorts
ia <silent> <buffer> sort <C-R>=Opal_replace("sort ", "normal \eiSORT ")<ENTER>


" FreeTypes
ia <silent> <buffer> type <C-R>=Opal_replace("type ", "normal \eiTYPE ")<ENTER>
ia <silent> <buffer> data <C-R>=Opal_replace("data ", "normal \eiDATA ")<ENTER>


" Signature- and Implementation Keyword
ia <silent> <buffer> implementation <C-R>=Opal_replace("implementation ", "normal \eiIMPLEMENTATION ")<ENTER>
ia <silent> <buffer> signature <C-R>=Opal_replace("signature ", "normal \eiSIGNATURE ")<ENTER>
ia <silent> <buffer> theory <C-R>=Opal_replace("theory ", "normal \eiTHEORY ")<ENTER>


" Functionstuff
ia <silent> <buffer> fun <C-R>=Opal_replace("fun ", "normal \eiFUN ")<ENTER>
ia <silent> <buffer> def <C-R>=Opal_replace("def ", "normal \eiDEF ")<ENTER>
ia <silent> <buffer> law <C-R>=Opal_replace("law ", "normal \eiLAW ")<ENTER>
ia <silent> <buffer> proof <C-R>=Opal_replace("proof ", "normal \eiPROOF ")<ENTER>
ia <silent> <buffer> justf <C-R>=Opal_replace("justf ", "normal \eiJUSTF ")<ENTER>


ia <silent> <buffer> if <C-R>=Opal_replace("if ", "normal \eiIF ")<ENTER>
ia <silent> <buffer> then <C-R>=Opal_replace("then ", "normal \eiTHEN ")<ENTER>
ia <silent> <buffer> otherwise <C-R>=Opal_replace("otherwise ", "normal \eiOTHERWISE ")<ENTER>
ia <silent> <buffer> else <C-R>=Opal_replace("else ", "normal \eiELSE ")<ENTER>
ia <silent> <buffer> fi <C-R>=Opal_replace("fi ", "normal \eiFI ")<ENTER>
ia <silent> <buffer> let <C-R>=Opal_replace("let ", "normal \eiLET ")<ENTER>
ia <silent> <buffer> where <C-R>=Opal_replace("where ", "normal \eiWHERE ")<ENTER>
ia <silent> <buffer> in <C-R>=Opal_replace("in ", "normal \eiIN ")<ENTER>
ia <silent> <buffer> andif <C-R>=Opal_replace("andif ", "normal \eiANDIF ")<ENTER>
ia <silent> <buffer> orif <C-R>=Opal_replace("orif ", "normal \eiORIF ")<ENTER>
ia <silent> <buffer> as <C-R>=Opal_replace("as ", "normal \eiAS ")<ENTER>
