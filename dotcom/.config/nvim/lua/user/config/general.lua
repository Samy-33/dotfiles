-- [nfnl] Compiled from fnl/user/config/general.fnl by https://github.com/Olical/nfnl, do not edit.
vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = ""
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.cursorline = true
local function setup_yank_highlight()
  local yank_augroup = vim.api.nvim_create_augroup("YankHighlight", {clear = true})
  local function _1_()
    return vim.highlight.on_yank()
  end
  return vim.api.nvim_create_autocmd("TextYankPost", {callback = _1_, group = yank_augroup, pattern = "*"})
end
setup_yank_highlight()
local function _2_()
  vim.bo.filetype = "clojure"
  return nil
end
vim.api.nvim_create_autocmd("BufEnter", {callback = _2_, pattern = "*.cljd"})
return {}
