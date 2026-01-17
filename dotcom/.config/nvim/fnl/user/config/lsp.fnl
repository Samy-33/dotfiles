(local {: autoload} (require :nfnl.module))
(local nfnl-c (autoload :nfnl.core))
(local ts-builtin (autoload :telescope.builtin))
(local cmp-nvim-lsp (autoload :cmp_nvim_lsp))
(local mason-lspconfig (autoload :mason-lspconfig))
(local neodev (autoload :neodev))
; (local java (autoload :java))

(fn on-attach [_ bufnr]
  (let [nmap (fn [keys func desc]
               (vim.keymap.set :n keys func
                               {:buffer bufnr :desc (.. "LSP: " desc)}))
        nvxmap (fn [keys func desc]
                 (vim.keymap.set [:n :v :x] keys func
                                 {:buffer bufnr :desc (.. "LSP: " desc)}))]
    (nmap :<leader>rn vim.lsp.buf.rename "[R]e[n]ame")
    (nmap :<leader>ca vim.lsp.buf.code_action "[C]ode [A]ction")
    (nmap :gd vim.lsp.buf.definition "[G]oto [D]efinition")
    (nmap :gr (fn [] (ts-builtin.lsp_references {:fname_width 60}))
          "[G]oto [R]eferences")
    (nmap :gI ts-builtin.lsp_implementations "[G]oto [I]mplementation")
    (nmap :<leader>D vim.lsp.buf.type_definition "Type [D]efinition")
    (nmap :<leader>ds ts-builtin.lsp_document_symbols "[D]ocument [S]ymbols")
    (nmap :<leader>ws
          (fn [] (ts-builtin.lsp_dynamic_workspace_symbols {:fname_width 60}))
          "[W]orkspace [S]ymbols")
    (nmap :K vim.lsp.buf.hover "Hover Documentation")
    (nmap :<C-k> vim.lsp.buf.signature_help "Signature Documentation")
    (nmap :gD vim.lsp.buf.declaration "[G]oto [D]eclaration")
    (nmap :<leader>wa vim.lsp.buf.add_workspace_folder
          "[W]orkspace [A]dd folder")
    (nmap :<leader>wr vim.lsp.buf.remove_workspace_folder
          "[W]orkspace [R]emove folder")
    (nmap :<leader>wl
          (fn []
            (nfnl-c.println (vim.inspect (vim.lsp.buf.list_workspace_folders))))
          "[W]orkspace [L]ist folders")
    (nvxmap :<leader>fmt vim.lsp.buf.format
            "[F]or[m]a[t] the current buffer or range")))

(local server-config
       {:clangd {}
        :zls {}
        :clojure_lsp {}
        :ts_ls {}
        ; :jdtls {}
        :lua_ls {:Lua {:workspace {:checkThirdParty false}
                       :telemetry {:enable false}}}
        :emmet_language_server {}
        :fennel_language_server {:fennel {:diagnostics {:globals [:vim]}
                                          :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})

; (java.setup)

(neodev.setup)

(local capabilities
       (cmp-nvim-lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities)))

(mason-lspconfig.setup {:ensure_installed (nfnl-c.keys server-config)})

(each [server-name config (pairs server-config)]
  (let [opts {:capabilities capabilities
              :on_attach on-attach
              :settings config
              :before_init (fn [params _]
                             (set params.workDoneToken :work-done-token))}]
    ;; 1. Register configuration (merges with nvim-lspconfig defaults)
    (vim.lsp.config server-name opts)
    ;; 2. Enable the server (creates filetype autocommands)
    (vim.lsp.enable server-name)))

; (mason-lspconfig.setup_handlers [(fn [server-name]
;                                    (let [server (. lspconfig server-name)]
;                                      (server.setup {: capabilities
;                                                     :on_attach on-attach
;                                                     :settings (. server-config
;                                                                  server-name)
;                                                     :before_init (fn [params _]
;                                                                    (set params.workDoneToken
;                                                                         :work-done-token))})))])
