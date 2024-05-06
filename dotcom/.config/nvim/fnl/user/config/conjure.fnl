(tset vim.g :conjure#client_on_load false)
; Disable diagnostic on Conjure log buffers
(vim.api.nvim_create_autocmd [:BufNewFile]
                             {:group (vim.api.nvim_create_augroup :conjure-config
                                                                  {:clear true})
                              :pattern :conjure-log-*.cljc
                              :callback (fn [_]
                                          (vim.diagnostic.disable 0))})
