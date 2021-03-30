let g:tmuxify_custom_command = 'tmux split-window -dl 10'
let g:tmuxify_map_prefix = '<leader>t'
let g:tmuxify_run = {}
let g:tmuxify_global_maps = 1
let $TMUXIFY_COMMAND = stdpath('config') . "/scripts/tmuxify_command.vim"
source $TMUXIFY_COMMAND

nnoremap <silent> <leader>mx :TmuxifyCommand<CR>
