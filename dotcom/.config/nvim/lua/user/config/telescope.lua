-- [nfnl] Compiled from fnl/user/config/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local telescope = autoload("telescope")
local builtin = autoload("telescope.builtin")
local actions = autoload("telescope.actions")
local themes = autoload("telescope.themes")
local lga_actions = autoload("telescope-live-grep-args.actions")
local utils = autoload("user.common.utils")
telescope.setup({defaults = {mappings = {i = {["<C-d>"] = false, ["<C-u>"] = false}}}, extensions = {live_grep_args = {auto_quoting = true, mappings = {i = {["<C-k>"] = lga_actions.quote_prompt(), ["<C-i>"] = lga_actions.quote_prompt({postfix = " --iglob "}), ["<C-space>"] = actions.to_fuzzy_refine}}}}})
telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
vim.keymap.set("n", "<leader>?", builtin.oldfiles, {desc = "[?] Find recently opened files"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "[F]ind open [B]uffers"})
local function _2_()
  return builtin.current_buffer_fuzzy_find(themes.get_dropdown({winblend = 10, previewer = false}))
end
vim.keymap.set("n", "<leader>/", _2_, {desc = "[/] Fuzzily search in current buffer"})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "[F]ind [F]iles"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "[F]ind [H]elp"})
vim.keymap.set("n", "<leader>fw", builtin.grep_string, {desc = "[F]ind current [W]ord"})
vim.keymap.set("n", "<leader>fg", telescope.extensions.live_grep_args.live_grep_args, {desc = "[F]ind by [G]rep"})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {desc = "[F]ind [D]iagnostics"})
local function _3_()
  return builtin.find_files({cwd = utils["config-path"]})
end
vim.keymap.set("n", "<leader>fcf", _3_, {desc = "[F]ind [C]onfing [F]iles"})
vim.keymap.set("n", "<leader>fch", builtin.command_history, {desc = "[F]ind in [C]ommands [H]istory"})
return vim.keymap.set("n", "<leader>fm", builtin.marks, {desc = "[F]ind in [M]arks"})
