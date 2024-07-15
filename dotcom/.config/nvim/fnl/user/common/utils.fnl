(local config-path (vim.fn.stdpath :config))
(local data-path (vim.fn.stdpath :data))

(fn get-color-column []
  (. vim.o :colorcolumn))

{: config-path
 : data-path
 : get-color-column}
