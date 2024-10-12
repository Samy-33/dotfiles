(local {: autoload} (require :nfnl.module))
(local paredit (autoload :nvim-paredit))
(local paredit-fnl (autoload :nvim-paredit-fennel))

(fn setup []
  ;; :indentor vim.lsp.buf.format is better but it reindents whole buffer.
  (paredit.setup {:indent {:enabled true}})
  (paredit-fnl.setup))

(setup)

{}
