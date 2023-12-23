; Disable diagnostic on Conjure log buffers
(vim.api.nvim_create_autocmd [:BufRead]
                             {:group (vim.api.nvim_create_augroup :conjure-config
                                                                  {:clear true})
                              :pattern :conjure-log-*.cljc
                              :callback (fn [evt]
                                          (vim.diagnostic.disable (. evt :buf)))})
