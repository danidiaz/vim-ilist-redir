" https://vi.stackexchange.com/questions/27381/making-custom-command-behave-like-echo-with-respect-to-quotes
command! -complete=command -nargs=1 Qf call ilist#redir#CmdToQuickfix('<args>')
command! -complete=command -nargs=1 LL call ilist#redir#CmdToLocation('<args>')
command! -complete=expression -nargs=1 Qfe call ilist#redir#ExpToQuickfix(<args>)
command! -complete=expression -nargs=1 LLe call ilist#redir#ExpToLocation(<args>)

function Arguments()
    return argc()->range()->map('argv(v:val)')     
endfunction
