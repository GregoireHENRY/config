if !exists('g:vscode')

" General configurations.
source $HOME/.config/nvim/scripts/plugins.vim
source $HOME/.config/nvim/scripts/settings.vim
source $HOME/.config/nvim/scripts/kmap.vim

" Plugin configurations.
source $HOME/.config/nvim/scripts/lightline.vim
source $HOME/.config/nvim/scripts/magit.vim
source $HOME/.config/nvim/scripts/markdown.vim
source $HOME/.config/nvim/scripts/rust.vim
source $HOME/.config/nvim/scripts/vimtex.vim
source $HOME/.config/nvim/scripts/ale.vim
source $HOME/.config/nvim/scripts/test.vim
source $HOME/.config/nvim/scripts/tmuxify.vim
source $HOME/.config/nvim/scripts/coc.vim
source $HOME/.config/nvim/scripts/nerdtree.vim
source $HOME/.config/nvim/scripts/nerdtree-git.vim
source $HOME/.config/nvim/scripts/rnvimr.vim
source $HOME/.config/nvim/scripts/ctrlspace.vim

" Final configurations.
source $HOME/.config/nvim/scripts/final.vim

endif
