" Plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'jebaum/vim-tmuxify'
Plug 'simeji/winresizer'
call plug#end()

" Default settings
set nu
set rnu
syntax enable
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set scrolloff=5
set ttyfast
set clipboard=unnamedplus
set termguicolors
colorscheme iceberg

" Default remap
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <C-a> <Nop>
noremap <c-z> <nop>
noremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
noremap <F3> :set invnumber<CR>
nnoremap <F4> :ls<CR>:b<Space>
nnoremap <F5> :enew<CR>:E<CR>
nnoremap <F6> :b#<CR>
nnoremap <F9> :e ~/.config/nvim/init.vim<CR>
nnoremap <F10> :source ~/.config/nvim/init.vim<CR>
nnoremap <C-t> :tabnew<CR>
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
nnoremap <Char-60> :execute "tabmove" tabpagenr() - 2 <CR>
nnoremap <Char-62> :execute "tabmove" tabpagenr() + 1 <CR>
" nnoremap <C-s> :%s/<C-r><C-w>//g<Left><Left>
" vnoremap <c-f> "hy/<C-r>h<CR>:%s/\<<C-r>h\>/<C-r>h/gc<left><left><left>
nnoremap <c-s> :%s///gc<left><left><left>
vnoremap <c-s> :s///gc<left><left><left>
vnoremap / <Esc>/\%V
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" Vim lightline
function! LightlineVimfugitive()
  return %{exists('g:loaded_fugitive')?fugitive#statusline():''}
endfunction
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }
let g:lightline.component_expand = {
    \ 'gitbranch': 'FugitiveHead'
    \ }
let g:lightline.active = {
    \ 'left': [
    \     [ 'mode', 'paste'],
    \     [ 'gitbranch', 'readonly', 'filename', 'modified' ],
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

" tmuxify
let g:tmuxify_custom_command = 'tmux split-window -d'
let g:tmuxify_map_prefix = '<leader>m'
let g:tmuxify_run = {}
let g:tmuxify_global_maps = 1
nmap <leader>tq :TxKill!<CR>

" Final config
set cmdheight=1
