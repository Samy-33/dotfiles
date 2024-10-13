(local {: autoload} (require :nfnl.module))
(local paredit (autoload :nvim-paredit))

(fn setup []
  ;; :indentor vim.lsp.buf.format is better but it reindents whole buffer.
  (paredit.setup {:indent {:enabled true}}))

(setup)

{}
