set showtabline=0

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

set sessionoptions+=folds
set viewoptions=cursor,folds,slash,unix

" if executable('rg')
"     let g:CtrlSpaceGlobCommand = 'rg --color=never --files'
" elseif executable('fd')
"     let g:CtrlSpaceGlobCommand = 'fd --type=file --color=never'
" elseif executable('ag')
"     let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
" endif
