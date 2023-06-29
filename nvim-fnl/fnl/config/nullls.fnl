(module config.nullls
  {require {: null-ls}})

(null-ls.setup
  {:sources [null-ls.builtins.formatting.fnlfmt]})

