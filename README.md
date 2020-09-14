vim-ilist-redir
===============

A variant of the [vim-qlist](https://github.com/romainl/vim-qlist) plugin (from
which code has been liberally stolen).

Added `Qf` and `LL` command modifiers that put the results of `ilist` and
`dlist` commands into the quifix and location lists, respectively. For example:

> :Qf ilist /fleurs/

> :LL ilist /fleurs/

It  can also serve as an alternative to `:browse oldfiles`.

> :Qf oldfiles

> :LL oldfiles

The commands try distinguish between the output formats of `ilist`/`dlist` and
`oldfiles`, in order to handle both types of output. They don't work by
inspecting the commands themselves.
