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
set undofile
set undodir=~/.config/nvim/undodir
autocmd FileType qf setlocal wrap
set guioptions-=e
set nocompatible
set hidden
au BufRead,BufNewFile *.h set filetype=c
