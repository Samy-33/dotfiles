(local config-path (vim.fn.stdpath :config))
(local data-path (vim.fn.stdpath :data))

; (local get-color-column
;        (fn []
;          (. vim.o :colorcolumn)))

(fn get-color-column []
  (. vim.o :colorcolumn))

{: config-path
 : data-path
 : get-color-column}
