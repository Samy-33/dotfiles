-- [nfnl] fnl/user/config/keymaps.fnl
local utils = require("user.common.utils")
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
local function _1_()
  return vim.api.nvim_command("tabprevious")
end
vim.keymap.set({"n", "v", "i", "x", "t"}, "<C-h>", _1_, {silent = true})
local function _2_()
  return vim.api.nvim_command("tabnext")
end
vim.keymap.set({"n", "v", "i", "x", "t"}, "<C-l>", _2_, {silent = true})
local function _3_()
  return vim.api.nvim_command("tabnew")
end
vim.keymap.set({"n", "v", "i", "x"}, "<C-n>", _3_, {silent = true})
local function toggle_color_column()
  local curr_color_col = utils["get-color-column"]()
  local new_val
  if (curr_color_col == "") then
    new_val = "80"
  else
    new_val = ""
  end
  vim.o.colorcolumn = new_val
  return nil
end
vim.keymap.set("n", "<leader>vocc", toggle_color_column, {silent = true})
local function _5_()
  return vim.cmd("Oil")
end
return vim.keymap.set("n", "-", _5_, {silent = true})
