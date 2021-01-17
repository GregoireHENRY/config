let g:colors_name = "pixel-dark"

" Define more syntax
syntax match potionOperator "\v\+"
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\-"
syntax match potionOperator "\v\:"
syntax match potionOperator "\v\="
syntax match MoreScope "\v\(|\)"
syntax match MoreScope "\v\[|\]"
syntax match MoreScope "\v\{|\}"
syntax match MoreScope "\v\<|\>"
syntax match MoreScope "\v\-\>"
syntax match MoreScope "\v\,"
syntax match typeHint "\v\: \zs\w\+\ze"
syn keyword pythonBuiltinObj True False None super self __init__ __name__ __file__
syn keyword pythonType float int str bool slice len abs range enumerate zip

" General UI highlights
set background=dark
hi StatusLine ctermbg=none cterm=bold
hi clear SignColumn
hi LineNr ctermfg=15

" Code code highlighs
hi Normal ctermbg=none ctermfg=246

hi Comment ctermbg=none ctermfg=196

hi Constant ctermbg=none ctermfg=246
hi String ctermbg=none ctermfg=93
hi Number ctermbg=none ctermfg=93
hi Boolean ctermbg=none ctermfg=15

hi Identifier ctermbg=none ctermfg=246
hi Function ctermbg=none ctermfg=246

hi Statement ctermbg=none ctermfg=15

hi PreProc ctermbg=none ctermfg=15

hi Type ctermbg=none ctermfg=15

hi Special ctermbg=none ctermfg=13

" Others
hi potionOperator ctermbg=none ctermfg=123
hi MoreScope ctermbg=none ctermfg=76

" Python highlights
hi link pythonDocstring Comment
hi clear SpellBad
hi clear SpellCap " SpellBad, SpellCap, SpellRare, SpellLocal
hi typeHint ctermbg=none ctermfg=15
hi pythonBuiltinObj ctermbg=none ctermfg=15
hi pythonType ctermbg=none ctermfg=15
