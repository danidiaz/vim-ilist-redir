vim-ilist-redir
===============

A variant of the [vim-qlist](https://github.com/romainl/vim-qlist) plugin (from
which code has been liberally stolen).

`:Qf` and `:LL` command modifiers that put the results of `:ilist`, `:dlist` and
`:oldfiles` commands into the quifix and location lists, respectively. For
example:

> :Qf ilist /fleurs/

> :LL ilist /fleurs/

> :Qf oldfiles

> :LL oldfiles

Notice that you can use `:filter` in combination with `:oldfiles`:

> :Qf filter /txt/ oldfiles

> :LL filter /txt/ oldfiles

`:Qfe` and `:LLe` that evaluate an expression that returns a list of files and
put the results into the quifix and location lists, respectively. 

> :Qfe v:oldfiles

> :LLe v:oldfiles

