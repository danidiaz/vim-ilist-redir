function ilist#redir#ExpToLocation(cmd)
    let l:entries = eval(a:cmd)
    let l:qf_entries = s:BuildEntries(l:entries)
    " Build the quickfix list from our results.
    call setloclist(0,l:qf_entries)
    " Open the quickfix window if there is something to show.
    lclose
    execute min([ 10, len(getloclist(0)) ]) 'lwindow'
endfunction

function ilist#redir#CmdToLocation(cmd)
    let l:lines = split(execute(a:cmd), "\n")
    let l:qf_entries = s:IlistOutputBuildEntries(l:lines)
    " Build the quickfix list from our results.
    call setloclist(0,l:qf_entries)
    " Open the quickfix window if there is something to show.
    lclose
    execute min([ 10, len(getloclist(0)) ]) 'lwindow'
endfunction

function ilist#redir#ExpToQuickfix(cmd)
    let l:entries = eval(a:cmd)
    let l:qf_entries = s:BuildEntries(l:entries)
    " Build the quickfix list from our results.
    call setqflist(l:qf_entries)
    " Open the quickfix window if there is something to show.
    cclose
    execute min([ 10, len(getqflist()) ]) 'cwindow'
endfunction

function ilist#redir#CmdToQuickfix(cmd)
    let l:lines = split(execute(a:cmd), "\n")
    let l:qf_entries = s:BuildIlistEntries(l:lines)
    " Build the quickfix list from our results.
    call setqflist(l:qf_entries)
    " Open the quickfix window if there is something to show.
    cclose
    execute min([ 10, len(getqflist()) ]) 'cwindow'
endfunction

" copied from https://github.com/romainl/vim-qlist
function s:IlistOutputBuildEntries(lines)
    " Our results may span multiple files so we need to build a relatively complex list based on filenames.
    let filename   = ""
    let qf_entries = []
    for l:line in a:lines
        if l:line !~ '^\s*\d\+:'
            let filename = fnamemodify(l:line, ':p:.')
        else
            let lnum = split(l:line)[1]
            let text = substitute(l:line, '^\s*.\{-}:\s*\S\{-}\s', "", "")
            " let col  = match(text, a:selection ? search_pattern : expand("<cword>")) + 1
            call add(l:qf_entries, {"filename" : l:filename, "lnum" : l:lnum, "col" : 1, "vcol" : 1, "text" : l:text})
        endif
    endfor
    return qf_entries
endfunction

function s:BuildEntries(entries)
    " Our results may span multiple files so we need to build a relatively complex list based on filenames.
    let qf_entries = []
    for l:entry in a:entries
        let l:filename = fnamemodify(l:entry, ':p:.')
        call add(l:qf_entries, {"filename" : l:filename, "lnum" : 1, "col" : 1, "vcol" : 1, "text" : "exp"})
    endfor
    return qf_entries
endfunction

