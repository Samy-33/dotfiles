(module config.lsp
  {require {core aniseed.core
            ts-builtin telescope.builtin
            cmp-nvim-lsp cmp_nvim_lsp
            mason-lspconfig mason-lspconfig
            : lspconfig
            : neodev}})


(defn- on-attach
  [_ bufnr]
  (let [nmap (fn [keys func desc] 
               (vim.keymap.set :n
                               keys
                               func
                               {:buffer bufnr
                                :desc (.. "LSP: " desc)}))]
    (nmap :<leader>rn vim.lsp.buf.rename "[R]e[n]ame")
    (nmap :<leader>ca vim.lsp.buf.code_action "[C]ode [A]ction")
    (nmap :gd vim.lsp.buf.definition "[G]oto [D]efinition")
    (nmap :gr ts-builtin.lsp_references "[G]oto [R]eferences")
    (nmap :gI vim.lsp.buf.implementation "[G]oto [I]mplementation")
    (nmap :<leader>D vim.lsp.buf.type_definition "Type [D]efinition")
    (nmap :<leader>ds ts-builtin.lsp_document_symbols "[D]ocument [S]ymbols")
    (nmap :<leader>ws ts-builtin.lsp_dynamic_workspace_symbols "[W]orkspace [S]ymbols")
    (nmap :K vim.lsp.buf.hover "Hover Documentation")
    (nmap :<C-k> vim.lsp.buf.signature_help "Signature Documentation")
    (nmap :gD vim.lsp.buf.declaration "[G]oto [D]eclaration")
    (nmap :<leader>wa vim.lsp.buf.add_workspace_folder "[W]orkspace [A]dd folder")
    (nmap :<leader>wr vim.lsp.buf.remove_workspace_folder "[W]orkspace [R]emove folder")
    (nmap :<leader>wl (fn []
                        (core.println (vim.inspect (vim.lsp.buf.list_workspace_folders)))) "[W]orkspace [L]ist folders")
    (nmap :<leader>fmt vim.lsp.buf.format "[F]or[m]a[t] the current buffer")))

(def- servers {:clojure_lsp {}
               :tsserver {}
               :lua_ls {:Lua {:workspace {:checkThirdParty false}
                              :telemetry {:enable false}}}})

(neodev.setup)

(def- capabilities (cmp-nvim-lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities)))

(mason-lspconfig.setup {:ensure_installed (core.keys servers)})

(mason-lspconfig.setup_handlers [(fn [server-name]
                                   ((. (. lspconfig server-name)
                                       :setup) {: capabilities
                                                :on_attach on-attach
                                                :settings (. servers
                                                             server-name)}))])
