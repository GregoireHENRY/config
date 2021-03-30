:command Gs :Gstatus | :only

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <C-a> <Nop>
noremap <c-z> <nop>
noremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
noremap <F3> :set nu!<CR>:set rnu!<CR>
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
nnoremap <silent> <leader>cd :lcd %:p:h<CR>
tnoremap <ESC><ESC> <C-\><C-N>
noremap gs :Gs<CR>
