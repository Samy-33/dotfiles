(local {: autoload} (require :nfnl.module))
(local rainbow-delimiters (autoload :rainbow-delimiters))

(set vim.g.rainbow_delimiters
     {:strategy {"" rainbow-delimiters.strategy.global}
      :query {"" :rainbow-delimiters}})
