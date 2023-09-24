(local {: autoload} (require :nfnl.module))
(local utils (autoload :common.utils))
(local rainbow-delimiters (autoload :rainbow-delimiters))

(set vim.g.rainbow_delimiters
     {:strategy {"" rainbow-delimiters.strategy.local}
      :query {"" :rainbow-delimiters}})
