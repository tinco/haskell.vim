" Opal syntax file
" Language:	Opal
"
" Written and Copyright by Siegfried Pohl <spohl@bert.in-berlin.de>
" with help from Klaus Didrich <kd@cs.tu-berlin.de>
"
" Last change:	2000 December 1

" Remove any old syntax stuff hanging around
syn clear


" Comments
syn region opalComment		 	start="/\*" end="\*/"
syn region oneLineOpalComment		start="--" end="$" keepend 
syn region opalPragmas			start="/\$" end="\$/"


" Imports
syn keyword opalImportKeyword		IMPORT COMPLETELY ONLY ASSERT ASSUME


" Sorts
syn keyword opalSorts			SORT


" FreeTypes
syn keyword opalFreeTypeKeyword		TYPE DATA


" Signature- and Implementation Keyword
syn keyword opalSigAndImpKeyword	IMPLEMENTATION SIGNATURE THEORY


" Functionstuff
syn keyword opalFunctions		FUN DEF LAW PROOF JUSTF


" Lambdas
syn match opalLambdaAbstraction		"\\\\"


" Case Dis and 
" LET And WHERE expressions
syn keyword opalCaseLetWhere		IF THEN OTHERWISE ELSE FI LET WHERE IN ANDIF ORIF AS

" denotation
syn region opalDenotation		start=+"+ end=+"+

" opal only has two builtin types
syn keyword opalBuiltinTypes		bool denotation real nat char int

syn cluster opalTop add=opalComment,opalDenotation,opalCaseLetWhere,opalLambdaAbstraction
syn cluster opalTop add=opalPragmas,oneLineOpalComment


" paren and that 
"
" TODO: make vim check wether
" open and closing parens dont match
"
" syn match opalParens			"[\(,\),\[,\]]" 
syn region opalParenT transparent matchgroup=opalParens start="(" end=")" contains=@opalTop,opalParenT1,line
syn region opalParenT1 transparent matchgroup=opalParens1 start="(" end=")" contains=@opalTop,opalParenT2 contained
syn region opalParenT2 transparent matchgroup=opalParens2 start="(" end=")" contains=@opalTop,opalParenT contained
syn match opalParensError 	")"

syn region opalParenTB transparent matchgroup=opalParens start="\[" end="\]" contains=@opalTop,opalParenTB1
syn region opalParenTB1 transparent matchgroup=opalParens1 start="\[" end="\]" contains=@opalTop,opalParenTB2 contained
syn region opalParenTB2 transparent matchgroup=opalParens2 start="\[" end="\]" contains=@opalTop,opalParenTB contained
syn match opalParensError 	"]"


" reserved words 
"
" TODO: opal does only have a very
" small size of reserved word, 
" according to be  a functional
" language; if problems arise because of
" the names of self-defined functions,
" comment these reserved words out
"
syn match opalreservedWord1			"\*\*"
syn match opalreservedWord2			"->"
syn match opalreservedWord3			":"
syn match opalreservedWord4			"=="



" For programming complex maths
" (complex means complicated, not in the field $\C$)
"
" FIXME: Anybody in the mood writing this on one line?
" Dont know, how to mix keywords and regexp's
"
syn keyword opalMath			ALL AND DFD EX NOT OR 
syn match opalMath1			"===" 
syn match opalMath2			"==>" 
syn match opalMath3			"<=>"


" Specifications
"
syn keyword opalSpecs			SPC PRE POST



 if !exists("did_opal_syntax_inits")
  let did_opal_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later


hi link	opalComment 		Comment
hi link oneLineOpalComment	Comment
hi link opalPragmas		String

hi link opalImportKeyword	Keyword

hi link opalSorts		Keyword

hi link opalFreeTypeKeyword	Keyword

hi link opalSigAndImpKeyword	Keyword

hi link opalFunctions		Function

hi link opalLambdaAbstraction	Function

hi link opalCaseLetWhere	Conditional

hi link opalDenotation		String

hi link opalBuiltinTypes	Type

hi link opalParens		Keyword
hi link opalParens1		Comment
hi link opalParens2		Function

hi link opalreservedWord1	Keyword
hi link opalreservedWord2	Keyword
hi link opalreservedWord3	Keyword
hi link opalreservedWord4	Keyword

hi link opalMath		Keyword
hi link opalMath1		Keyword
hi link opalMath2		Keyword
hi link opalMath3		Keyword

hi link opalSpecs		Keyword

hi link opalParensError 	Error

endif


let b:current_syntax = "opal"

" EOF """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
