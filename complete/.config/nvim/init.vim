" Plugins
call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'jebaum/vim-tmuxify'
Plug 'vim-test/vim-test'
Plug 'w0rp/ale'
Plug 'jreybert/vimagit'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
" Plug 'tsony-tsonev/nerdtree-git-plugin'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'simeji/winresizer'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'maximbaz/lightline-ale'
Plug 'lervag/vimtex'
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
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071  "
let g:lightline#ale#indicator_errors = "\uf05e  "
let g:lightline#ale#indicator_ok = "\uf00c "
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

" Some plugins settings
let g:magit_default_show_all_files = 0
let g:mkdp_auto_start = 0
let g:rustfmt_autosave = 1
let g:vimtex_compiler_latexmk = {'build_dir' : 'etc'}
autocmd FileType qf setlocal wrap

" Ale settings
let g:ale_disable_lsp = 1
let g:ale_sign_error = '✘ '
let g:ale_sign_warning = '⚠ '
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {'rust': ['cargo', 'rls'], 'markdown': ['mdl'], 'cpp': ['gcc'], 'c': ['gcc'], 'matlab': ['mlint'], 'python': ['pylint', 'mypy'], 'tex':['chktex']}
let g:ale_fixers = {'rust': ['rustfmt'], 'python': ['black', 'isort']}
let g:ale_rust_rls_executable = 'rust-analyzer'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_cargo_check_tests = 1
let g:ale_c_gcc_options = '-Wall -Wextra std=c2a'
let g:ale_c_parse_makefile = 1
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'
let g:ale_python_mypy_options = '--ignore-missing-imports --follow-imports=silent --show-column-numbers --strict --cache-dir=/dev/null'
let g:ale_python_black_options = '--line-length 100'
let g:ale_python_isort_options = ''

" Some plugin remap
nnoremap <C-p>o :MarkdownPreview<CR>
nnoremap <C-p>k :MarkdownPreviewStop<CR>

" vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
let test#strategy = "tmuxify"
let test#neovim#term_position = "bel"
tmap <Esc> <C-\><C-n>

" tmuxify
let g:tmuxify_custom_command = 'tmux split-window -d'
let g:tmuxify_map_prefix = '<leader>m'
let g:tmuxify_run = {}
let g:tmuxify_global_maps = 1
nmap <leader>tq :TxKill!<CR>

" Coc settings
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"""""""""""set statusline+=\ \ %{coc#status()}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" NERDTree settings
nmap <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeGitStatusWithFlags = 1
" function! IsNERDTreeOpen()        
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction
" autocmd BufEnter * call SyncTree()
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeIgnore=['__pycache__']
"--------------------------------------------------------------
" Hide files from NERDTree with 'dd'
let g:MyNERDTreeIgnore=[] " List of ignored files
let ignoreSingleKeyMap = {
    \ 'key':           'dd',
    \ 'callback':      'MyNERDTreeIgnoreSingle',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Hide(ignore) the selected file' }
let unignoreAllKeyMap = {
    \ 'key':           'dua',
    \ 'callback':      'MyNERDTreeUnignoreAll',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Unhide all hidden(ignored) files' }
let unignoreSingleKeyMap = {
    \ 'key':           'dus',
    \ 'callback':      'MyNERDTreeUnignoreSingle',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Unhide a single hidden(ignored) file' }
augroup NERDTreeHide
  autocmd!
  autocmd VimEnter *  call NERDTreeAddKeyMap(ignoreSingleKeyMap) |
                    \ call NERDTreeAddKeyMap(unignoreAllKeyMap) |
                    \ call NERDTreeAddKeyMap(unignoreSingleKeyMap) |
                    \ call NERDTreeAddPathFilter('MyFilter') 
augroup END
function MyNERDTreeIgnoreSingle(node)
  let path = a:node['path'].str()
  if index(g:MyNERDTreeIgnore, path) != -1 |  return | endif " If exists, return
  call add(g:MyNERDTreeIgnore, path) | call NERDTreeRender()
endfunction
function MyNERDTreeUnignoreAll(node)
  let g:MyNERDTreeIgnore=[] | call NERDTreeRender()
endfunction
function MyNERDTreeUnignoreSingle(node)
  let promptlist = ['Select File to Unhide:', '-------------------------']
  let cntr = 1
  for i in g:MyNERDTreeIgnore
    call add(promptlist, cntr . '. ' . i) | let cntr += 1
  endfor
  call inputsave() | let fileindex = (inputlist(promptlist) - 1) | call inputrestore()
  if fileindex < 0
    echom "Invalid number (Too low)" | return
  elseif fileindex > (len(g:MyNERDTreeIgnore) - 1)
    echom "Invalid number (Too high)" | return
  endif
  call remove(g:MyNERDTreeIgnore, fileindex) | call NERDTreeRender()
endfunction
function! MyFilter(params)
  return (index(g:MyNERDTreeIgnore, a:params['path'].str()) != -1)
endfunction

" Final config
set cmdheight=1
