-- [nfnl] Compiled from fnl/user/config/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
local function _1_()
  return vim.api.nvim_command("tabprevious")
end
vim.keymap.set({"n", "v", "i", "x"}, "<C-h>", _1_, {silent = true})
local function _2_()
  return vim.api.nvim_command("tabnext")
end
vim.keymap.set({"n", "v", "i", "x"}, "<C-l>", _2_, {silent = true})
local function _3_()
  return vim.api.nvim_command("tabnew")
end
return vim.keymap.set({"n", "v", "i", "x"}, "<C-n>", _3_, {silent = true})
