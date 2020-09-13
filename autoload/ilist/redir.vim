function ilist#redir#ToLocation(cmd)
    let l:lines = split(execute(a:cmd), "\n")
    let l:qf_entries = s:BuildQEntries(l:lines)
    " Build the quickfix list from our results.
    call setloclist(0,l:qf_entries)
    " Open the quickfix window if there is something to show.
    lclose
    execute min([ 10, len(getloclist(0)) ]) 'lwindow'
endfunction

function ilist#redir#ToQuickfix(cmd)
    let l:lines = split(execute(a:cmd), "\n")
    let l:qf_entries = s:BuildQEntries(l:lines)
    " Build the quickfix list from our results.
    call setqflist(l:qf_entries)
    " Open the quickfix window if there is something to show.
    cclose
    execute min([ 10, len(getqflist()) ]) 'cwindow'
endfunction

" copied from https://github.com/romainl/vim-qlist
function s:BuildQEntries(lines)
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
            call add(qf_entries, {"filename" : filename, "lnum" : lnum, "col" : 1, "vcol" : 1, "text" : text})
        endif
    endfor
    return qf_entries
endfunction

