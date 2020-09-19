vim-ilist-redir
===============

A variant of the [vim-qlist](https://github.com/romainl/vim-qlist) plugin (from
which code has been liberally stolen).

The `:Qf` and `:LL` command modifiers that put the results of `:ilist`, `:dlist` and
`:oldfiles` commands into the quickfix and location lists, respectively. For
example:

> :Qf ilist /fleurs/

> :LL ilist /fleurs/

> :Qf oldfiles

> :LL oldfiles

Notice that you can use `:filter` in combination with `:oldfiles`:

> :Qf filter /txt/ oldfiles

> :LL filter /txt/ oldfiles

The `:Qfe` and `:LLe` commands evaluate an expression that returns a list of files and
put the results into the quifix and location lists, respectively. 

> :Qfe v:oldfiles

> :LLe v:oldfiles

Also provided is an `Arguments()` function that returns the argument list.
Useful with `:Qfe` and `:LLe`:

> :Qfe Arguments()

> :LLe Arguments()

