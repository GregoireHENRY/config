let $TMUXIFY_COMMAND = stdpath('config') . "/tmuxify_command.sh"

command! -nargs=? TmuxifyCommand call s:TmuxifyCommand(<f-args>)

function! s:TmuxifyCommand(...)
    call tmuxify#pane_create(1)
    call tmuxify#pane_send(1, $TMUXIFY_COMMAND)
endfunction
