(local {: autoload} (require :nfnl.module))
(local paredit (autoload :nvim-paredit))
(local paredit-fnl (autoload :nvim-paredit-fennel))

(fn setup []
  (paredit.setup {:indent {:enabled true}}) ;; :indentor vim.lsp.buf.format is better but it reindents whole buffer.
  (paredit-fnl.setup))

(setup)

{}
