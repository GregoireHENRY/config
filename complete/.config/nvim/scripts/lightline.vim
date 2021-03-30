function! LightlineVimfugitive()
  return %{exists('g:loaded_fugitive')?fugitive#statusline():''}
endfunction
set noshowmode
" warning: \uf071
" error: \uf05e
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\U1F620 "
let g:lightline#ale#indicator_errors = "\U1F92C "
let g:lightline#ale#indicator_ok = "\U1F60D"
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }
let g:lightline.component_expand = {
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_infos': 'lightline#ale#infos',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors': 'lightline#ale#errors',
    \ 'linter_ok': 'lightline#ale#ok',
    \ 'gitbranch': 'FugitiveHead'
    \ }
let g:lightline.component_type = {
    \ 'linter_checking': 'right',
    \ 'linter_infos': 'right',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'right',
    \ }
let g:lightline.active = {
    \ 'left': [
    \     [ 'mode', 'paste'],
    \     [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
    \ ],
    \ 'right' : [
    \     [ 'lineinfo' ],
    \     [ 'percent' ],
    \     [ 'fileformat', 'fileencoding', 'filetype'],
    \ ]
    \ }
let g:lightline.mode_map = {
    \ 'n' :     'NORMAL ',
    \ 'i' :     'INSERT ',
    \ 'R' :     'REPLACE',
    \ 'v' :     'VISUAL ',
    \ 'V' :     'V-LINE ',
    \ "\<C-v>": 'V-BLOCK',
    \ 'c' :     'COMMAND',
    \ 's' :     'S',
    \ 'S' :     'SL',
    \ "\<C-s>": 'SB',
    \ 't':      'T',
    \ }
