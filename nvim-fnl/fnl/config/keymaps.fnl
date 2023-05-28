;; This module sets some default keymaps. Plugin specific keymaps should not be a part of this module
(module config.keymaps)

(vim.keymap.set [:n :v] :<Space> :<Nop> {:silent true})

;; To deal with word wrap
(vim.keymap.set :n :k "v:count == 0 ? 'gk' : 'k'" {:expr true :silent true})
(vim.keymap.set :n :j "v:count == 0 ? 'gj' : 'j'" {:expr true :silent true})

;; To go to normal mode from insert mode without reaching out to esc key
(vim.keymap.set :i :jk :<esc> {:silent true})
