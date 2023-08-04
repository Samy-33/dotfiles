(module config.rainbow
  {require {utils common.utils
            : rainbow-delimiters}})

(set vim.g.rainbow_delimiters {:strategy {"" rainbow-delimiters.strategy.local}
                               :query {"" :rainbow-delimiters}})
