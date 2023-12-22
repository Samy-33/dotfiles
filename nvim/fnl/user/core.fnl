(local {: autoload} (require :nfnl.module))
(local plugins (autoload :user.plugins))

(fn setup []
  (plugins.setup)
  (require :user.config.general)
  (require :user.config.diagnostics)
  (require :user.config.keymaps)
  (require :user.config.treesitter)
  (require :user.config.lsp)
  (require :user.config.paredit)
  (require :user.config.conjure)
  (require :user.config.cmp)
  (require :user.config.telescope)
  (require :user.config.rainbow)
  (require :user.config.wiki)
  (require :user.config.neorg)
  (require :user.config.oliv)
  nil)

{: setup}
