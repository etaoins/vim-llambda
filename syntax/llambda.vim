if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

" Fascist highlighting: everything that doesn't fit the rules is an error...

syn match	llambdaError	![^ \t(){}\[\]";]*!
syn match	llambdaError	")"

" Quoted and backquoted stuff

syn region llambdaQuoted matchgroup=Delimiter start="['`]" end=![ \t(){}\[\]";]!me=e-1 contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc

syn region llambdaQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc
syn region llambdaQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc

syn region llambdaStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc
syn region llambdaStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc

syn region llambdaStrucRestricted matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc
syn region llambdaStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc
syn region llambdaStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc

syn region llambdaUnquote matchgroup=Delimiter start="," end=![ \t\[\](){}";]!me=e-1 contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc
syn region llambdaUnquote matchgroup=Delimiter start=",@" end=![ \t\[\](){}";]!me=e-1 contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc

syn region llambdaUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region llambdaUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

syn region llambdaUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc
syn region llambdaUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc

syn region llambdaUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region llambdaUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL

syn region llambdaUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc
syn region llambdaUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,llambdaStruc,llambdaSyntax,llambdaFunc

" Scheme Functions and Syntax:

setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_

" (scheme base)
syn keyword llambdaSyntax ... => and begin case cond cond-expand define define-library define-record-type
syn keyword llambdaSyntax define-syntax define-values do else except export import import-ci include include-ci
syn keyword llambdaSyntax include-library-declarations lambda let let* let*-values let-syntax let-values letrec
syn keyword llambdaSyntax letrec* letrec-syntax only or prefix quasiquote quote rename rename set! syntax-rules
syn keyword llambdaSyntax unless unquote unquote-splicing when
syn keyword llambdaFunc   * + - / < <= = > >= _ abs append apply assoc assq assv binary-port? boolean=? boolean?
syn keyword llambdaFunc   bytevector bytevector-append bytevector-copy bytevector-copy! bytevector-length
syn keyword llambdaFunc   bytevector-u8-ref bytevector-u8-set! bytevector? caar cadr call-with-current-continuation
syn keyword llambdaFunc   call-with-port call-with-values call/cc car cdar cddr cdr ceiling char->integer
syn keyword llambdaFunc   char-ready? char<=? char<? char=? char>=? char>? char? close-input-port close-output-port
syn keyword llambdaFunc   close-port complex? cons current-error-port current-input-port current-output-port
syn keyword llambdaFunc   denominator dynamic-wind eof-object eof-object? eq? equal? eqv? error
syn keyword llambdaFunc   error-object-irritants error-object-message error-object? even? exact exact-integer-sqrt
syn keyword llambdaFunc   exact-integer? exact? expt features file-error? floor floor-quotient floor-remainder
syn keyword llambdaFunc   floor/ flush-output-port for-each gcd get-output-bytevector get-output-string guard if
syn keyword llambdaFunc   inexact inexact? input-port-open? input-port? integer->char integer? lcm length list
syn keyword llambdaFunc   list->string list->vector list-copy list-ref list-tail list? make-bytevector make-list
syn keyword llambdaFunc   make-parameter make-string make-vector map max member memq memv min modulo negative?
syn keyword llambdaFunc   newline not null? number->string number? numerator odd? open-input-bytevector
syn keyword llambdaFunc   open-input-string open-output-bytevector open-output-string output-port-open? output-port?
syn keyword llambdaFunc   pair? parameterize peek-char peek-u8 port? positive? procedure? quotient raise
syn keyword llambdaFunc   raise-continuable rational? rationalize read-bytevector read-bytevector! read-char
syn keyword llambdaFunc   read-error? read-line read-string read-u8 real? remainder reverse round square string
syn keyword llambdaFunc   string->list string->number string->symbol string->utf8 string->vector string-append
syn keyword llambdaFunc   string-copy string-copy! string-fill! string-for-each string-length string-map string-ref
syn keyword llambdaFunc   string-set! string<=? string<? string=? string>=? string>? string? substring
syn keyword llambdaFunc   symbol->string symbol=? symbol? syntax-error textual-port? truncate truncate-quotient
syn keyword llambdaFunc   truncate-remainder truncate/ u8-ready? utf8->string values vector vector->list
syn keyword llambdaFunc   vector->string vector-append vector-copy vector-copy! vector-fill! vector-for-each
syn keyword llambdaFunc   vector-length vector-map vector-ref vector-set! vector? with-exception-handler
syn keyword llambdaFunc   write-bytevector write-char write-string write-u8 zero?

" (scheme case-lambda)
syn keyword llambdaFunc   case-lambda

" (scheme char)
syn keyword llambdaFunc   char-alphabetic? char-ci<=? char-ci<? char-ci=? char-ci>=? char-ci>? char-downcase
syn keyword llambdaFunc   char-foldcase char-lower-case? char-numeric? char-upcase char-upper-case? char-whitespace?
syn keyword llambdaFunc   digit-value string-ci<=? string-ci<? string-ci=? string-ci>=? string-ci>? string-downcase
syn keyword llambdaFunc   string-foldcase string-upcase

" (scheme cxr)
syn keyword llambdaFunc   caaaar caaadr caaar caadar caaddr caadr cadaar cadadr cadar caddar cadddr caddr cdaaar
syn keyword llambdaFunc   cdaadr cdaar cdadar cdaddr cdadr cddaar cddadr cddar cdddar cddddr cdddr

" (scheme file)
syn keyword llambdaFunc   delete-file file-exists? call-with-input-file open-binary-output-file open-output-file
syn keyword llambdaFunc   call-with-output-file open-binary-input-file with-output-to-file with-input-from-file
syn keyword llambdaFunc   open-input-file

" (scheme inexact)
syn keyword llambdaFunc   acos asin atan cos exp finite? infinite? log nan? sin sqrt tan

" (scheme lazy)
syn keyword llambdaFunc   delay delay-force force make-promise promise?

" (scheme process-context)
syn keyword llambdaFunc   command-line emergency-exit exit get-environment-variable get-environment-variables

" (scheme read)
syn keyword llambdaFunc   read

" (scheme time)
syn keyword llambdaFunc   current-jiffy current-second jiffies-per-second

" (scheme write)
syn keyword llambdaFunc   display write

" (llambda typed)
syn keyword llambdaSyntax define-type cast ann :
syn keyword llambdaFunc   make-predicate U Rec Listof Pairof List Values -> case-> All


" ... so that a single + or -, inside a quoted context, would not be
" interpreted as a number (outside such contexts, it's a llambdaFunc)

syn match	llambdaDelimiter	!\.[ \t\[\](){}";]!me=e-1
syn match	llambdaDelimiter	!\.$!
" ... and a single dot is not a number but a delimiter

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:

syn match	llambdaOther	,[a-zA-Z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	llambdaError	,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\](){}";]\+[^ \t\[\](){}";]*,

syn match	llambdaOther	"\.\.\."
syn match	llambdaError	!\.\.\.[^ \t\[\](){}";]\+!
" ... a special identifier

syn match	llambdaConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*[ \t\[\](){}";],me=e-1
syn match	llambdaConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*$,
syn match	llambdaError	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\](){}";]\+[^ \t\[\](){}";]*,

syn match	llambdaConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\](){}";],me=e-1
syn match	llambdaConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match	llambdaError	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\](){}";]\+[^ \t\[\](){}";]*,

" Non-quoted lists, and strings:

syn region llambdaStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region llambdaStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL
syn region llambdaStruc matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=ALL

syn region llambdaStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region llambdaStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" Simple literals:
syn region llambdaString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+ contains=@Spell

" Comments:

syn match	llambdaComment	";.*$" contains=@Spell


" Writing out the complete description of Scheme numerals without
" using variables is a day's work for a trained secretary...

syn match	llambdaOther	![+-][ \t\[\](){}";]!me=e-1
syn match	llambdaOther	![+-]$!
"
" This is a useful lax approximation:
syn match	llambdaNumber	"[-#+.]\=[0-9][-#+/0-9a-f@i.boxesfdl]*"
syn match	llambdaError	![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\](){}";][^ \t\[\](){}";]*!

syn match	llambdaBoolean	"#[tf]"
syn match	llambdaError	!#[tf][^ \t\[\](){}";]\+!
syn match	llambdaBoolean	"#true"
syn match	llambdaBoolean	"#false"

syn match	llambdaCharacter	"#\\"
syn match	llambdaCharacter	"#\\."
syn match       llambdaError	!#\\.[^ \t\[\](){}";]\+!
syn match	llambdaCharacter	"#\\space"
syn match	llambdaError	!#\\space[^ \t\[\](){}";]\+!
syn match	llambdaCharacter	"#\\newline"
syn match	llambdaError	!#\\newline[^ \t\[\](){}";]\+!
syn match   llambdaCharacter "#\\x[0-9a-fA-F]\+"

syn match   llambdaConstant "#!unit"

" Multi-line comments
syn region  llambdaMultilineComment start=/#|/ end=/|#/ contains=@Spell,llambdaMultilineComment

" Synchronization and the wrapping up...

syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
command -nargs=+ HiLink hi def link <args>

HiLink llambdaSyntax		Statement
HiLink llambdaFunc		Function

HiLink llambdaString		String
HiLink llambdaCharacter	Character
HiLink llambdaNumber		Number
HiLink llambdaBoolean		Boolean

HiLink llambdaDelimiter	Delimiter
HiLink llambdaConstant		Constant

HiLink llambdaComment		Comment
HiLink llambdaMultilineComment	Comment
HiLink llambdaError		Error

delcommand HiLink

let b:current_syntax = "llambda"

let &cpo = s:cpo_save
unlet s:cpo_save
