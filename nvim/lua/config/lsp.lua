-- [nfnl] Compiled from fnl/config/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nfnl_c = autoload("nfnl.core")
local ts_builtin = autoload("telescope.builtin")
local cmp_nvim_lsp = autoload("cmp_nvim_lsp")
local mason_lspconfig = autoload("mason-lspconfig")
local lspconfig = autoload("lspconfig")
local neodev = autoload("neodev")
local function on_attach(_, bufnr)
  local nmap
  local function _2_(keys, func, desc)
    return vim.keymap.set("n", keys, func, {buffer = bufnr, desc = ("LSP: " .. desc)})
  end
  nmap = _2_
  local nvxmap
  local function _3_(keys, func, desc)
    return vim.keymap.set({"n", "v", "x"}, keys, func, {buffer = bufnr, desc = ("LSP: " .. desc)})
  end
  nvxmap = _3_
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  local function _4_()
    return ts_builtin.lsp_references({fname_width = 60})
  end
  nmap("gr", _4_, "[G]oto [R]eferences")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", ts_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
  local function _5_()
    return ts_builtin.lsp_dynamic_workspace_symbols({fname_width = 60})
  end
  nmap("<leader>ws", _5_, "[W]orkspace [S]ymbols")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove folder")
  local function _6_()
    return nfnl_c.println(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  nmap("<leader>wl", _6_, "[W]orkspace [L]ist folders")
  return nvxmap("<leader>fmt", vim.lsp.buf.format, "[F]or[m]a[t] the current buffer or range")
end
local servers = {clojure_lsp = {["paths-ignore-regex"] = "conjure-log-*.cljc"}, tsserver = {}, lua_ls = {Lua = {workspace = {checkThirdParty = false}, telemetry = {enable = false}}}, fennel_language_server = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}}
neodev.setup()
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
mason_lspconfig.setup({ensure_installed = nfnl_c.keys(servers)})
local function _7_(server_name)
  return lspconfig[server_name].setup({capabilities = capabilities, on_attach = on_attach, settings = servers[server_name]})
end
return mason_lspconfig.setup_handlers({_7_})
