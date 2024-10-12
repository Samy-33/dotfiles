(local {: autoload} (require :nfnl.module))
(local null-ls (autoload :null-ls))

(null-ls.setup {:sources [null-ls.builtins.formatting.fnlfmt]})
