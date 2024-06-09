(local {: autoload} (require :nfnl.module))
(local cmp (autoload :cmp))

(cmp.setup {:snippet {:expand (fn [args]
                                (luasnip.lsp_expand (. args :body)))}
            :mapping (cmp.mapping.preset.insert {:<C-d> (cmp.mapping.scroll_docs -4)
                                                 :<C-f> (cmp.mapping.scroll_docs 4)
                                                 :<C-Space> (cmp.mapping.complete {})
                                                 :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Replace
                                                                             :select false})
                                                 :<Tab> (cmp.mapping (fn [fallback]
                                                                       (if (cmp.visible)
                                                                           (cmp.select_next_item)
                                                                           (fallback))))
                                                 :<S-Tab> (cmp.mapping (fn [fallback]
                                                                         (if (cmp.visible)
                                                                             (cmp.select_prev_item)
                                                                             (fallback))))}
                                                [:i :s])
            :sources [{:name :conjure}
                      {:name :nvim_lsp}
                      {:name :luasnip}]})
