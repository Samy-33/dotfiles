(local {: some} (require :nfnl.core))

(local current-working-dir (vim.fn.getcwd))
(local directories-to-check [:/Documents/oliv/ :/Documents/projects/muni])

(if (some (fn [dir]
            (= (string.match current-working-dir dir) dir))
          directories-to-check)
    (do
      (let [oliv-augroup (vim.api.nvim_create_augroup :OlivConjureClientState
                                                      {:clear true})]
        (vim.api.nvim_create_autocmd :VimEnter
                                     {:callback (fn []
                                                  (vim.api.nvim_command "ConjureClientState clj")
                                                  (vim.api.nvim_command "ConjureConnect 7000")
                                                  (vim.api.nvim_command "sleep 500m")
                                                  (vim.api.nvim_command "ConjureClientState cljs")
                                                  (vim.api.nvim_command "ConjureConnect 7002"))
                                      :group oliv-augroup
                                      :pattern [:*.clj :*.cljs]})
        (vim.api.nvim_create_autocmd :BufEnter
                                     {:callback (fn []
                                                  (vim.api.nvim_command "ConjureClientState clj"))
                                      :group oliv-augroup
                                      :pattern :*.clj})
        (vim.api.nvim_create_autocmd :BufEnter
                                     {:callback (fn []
                                                  (vim.api.nvim_command "ConjureClientState cljs"))
                                      :group oliv-augroup
                                      :pattern :*.cljs}))))
