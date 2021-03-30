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

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

let g:webdevicons_conceal_nerdtree_brackets = 1
let g:NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1

" This map is defined previously with nnoremap in scripts/kmap.vim to change
" vim path to buffer path. Here we upgrade the command by also changing
" NERDTree path.
" nmap <silent> <leader>cd :NERDTree %<CR>

autocmd FileType nerdtree syntax clear NERDTreeFlags
autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
autocmd FileType nerdtree setlocal conceallevel=3
autocmd FileType nerdtree setlocal concealcursor=nvic
