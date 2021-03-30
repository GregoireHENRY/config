call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'jebaum/vim-tmuxify'
Plug 'vim-test/vim-test'
Plug 'w0rp/ale'
Plug 'jreybert/vimagit'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'simeji/winresizer'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'maximbaz/lightline-ale'
Plug 'lervag/vimtex'
Plug 'yinflying/matlab.vim'
Plug 'yinflying/matlab-screen'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'zhimsel/vim-stay'
Plug 'ryanoasis/vim-devicons'
call plug#end()
