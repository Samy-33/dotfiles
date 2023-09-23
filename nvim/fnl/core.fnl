(local {: autoload} (require :nfnl.module))
(local plugins (autoload :plugins))

(fn setup []
  (plugins.setup)
  (require :config.general)
  (require :config.diagnostics)
  (require :config.keymaps)
  (require :config.treesitter)
  (require :config.lsp)
  (require :config.conjure)
  (require :config.cmp)
  (require :config.telescope)
  (require :config.rainbow)
  (require :config.wiki)
  (require :config.oliv)
  nil)

{: setup}
