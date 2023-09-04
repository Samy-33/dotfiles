;; This module sets some default keymaps. Plugin specific keymaps should not be a part of this module
(module config.keymaps)

(vim.keymap.set [:n :v] :<Space> :<Nop> {:silent true})

;; To deal with word wrap
(vim.keymap.set :n :k "v:count == 0 ? 'gk' : 'k'" {:expr true :silent true})
(vim.keymap.set :n :j "v:count == 0 ? 'gj' : 'j'" {:expr true :silent true})

;; Tabs
(vim.keymap.set [:n :v :i :x] :<C-h> #(vim.api.nvim_command "tabprevious") {:silent true})
(vim.keymap.set [:n :v :i :x] :<C-l> #(vim.api.nvim_command "tabnext") {:silent true})
(vim.keymap.set [:n :v :i :x] :<C-n> #(vim.api.nvim_command "tabnew") {:silent true})
