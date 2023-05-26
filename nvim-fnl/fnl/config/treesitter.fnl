(module config.treesitter
  {require {configs nvim-treesitter.configs
            : ts-rainbow}})

(def- ensure-installed ["c" "cpp" "clojure" "go" "lua" "python" "rust" "tsx" "typescript" "vimdoc" "vim"])

(def- textobject-keymaps {:aa "@parameter.outer"
                          :ia "@parameter.inner"
                          :af "@function.outer"
                          :if "@function.inner"
                          :ac "@class.outer"
                          :ic "@class.inner"})
(def- incremental-selection-keymaps {:init_selection "<c-space>"
                                     :node_incremental "<c-space>"
                                     :scope_incremental "<c-s>"
                                     :node_decremental "<M-space>"})

(configs.setup {:ensure_installed ensure-installed ;; Add languages to be installed here that you want installed for treesitter
                :auto_install false ;; Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
                :highlight { :enable true}
                :indent {:enable false
                         :disable ["python"]}
                :incremental_selection {:enable true
                                        :keymaps incremental-selection-keymaps}
                :rainbow {:enable true
                          :disable {} ;; languages to disable in
                          :query "rainbow-parens"
                          :strategy ts-rainbow.strategy.global}
                :textobjects {:select {:enable true
                                       :lookahead true
                                       :keymaps textobject-keymaps}
                              :move {:enable true
                                     :set_jumps true ;; whether to set jumps in the jumplist
                                     :goto_next_start {"]m" "@function.outer"
                                                       "]]" "@class.outer"}
                                     :goto_next_end {"]M" "@function.outer"
                                                     "][" "@class.outer"}
                                     :goto_previous_start {"[m" "@function.outer"
                                                           "[[" "@class.outer"}
                                     :goto_previous_end {"[M" "@function.outer"
                                                         "[]" "@class.outer"}}
                              :swap {:enable true
                                     :swap_next {:<leader>a "@parameter.inner"}
                                     :swap_previous {:<leader>A "@parameter.inner"}}}})