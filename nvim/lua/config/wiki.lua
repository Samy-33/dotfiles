-- [nfnl] Compiled from fnl/config/wiki.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local tbuiltin = autoload("telescope.builtin")
local wiki_root = "~/wiki"
vim.g.wiki_root = wiki_root
vim.g.wiki_tag_scan_num_lines = -2
local function _2_()
  return tbuiltin.find_files({cwd = wiki_root})
end
vim.keymap.set("n", "<leader>w<leader>ff", _2_, {desc = "[W]iki [F]ind [F]iles"})
local function _3_()
  return tbuiltin.live_grep({cwd = wiki_root})
end
return vim.keymap.set("n", "<leader>w<leader>fg", _3_, {desc = "[W]iki [F]ind by [G]rep"})
