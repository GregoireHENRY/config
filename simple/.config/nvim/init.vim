" Plugins
call plug#begin()
Plug 'jebaum/vim-tmuxify'
Plug 'tpope/vim-fugitive'
Plug 'simeji/winresizer'
Plug 'itchyny/lightline.vim'
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
let g:tmuxify_custom_command = 'tmux split-window -dl 10'
let g:tmuxify_map_prefix = '<leader>m'
let g:tmuxify_run = {}
let g:tmuxify_global_maps = 1
let $TMUXIFY_COMMAND = stdpath('config') . "/tmuxify_command.vim"
source $TMUXIFY_COMMAND
nnoremap <silent> <leader>mx :TmuxifyCommand<CR>

" Final config
set cmdheight=1
