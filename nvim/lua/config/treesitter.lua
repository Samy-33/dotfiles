-- [nfnl] Compiled from fnl/config/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local configs = autoload("nvim-treesitter.configs")
local ensure_installed = {"c", "cpp", "clojure", "lua", "tsx", "typescript", "vimdoc", "vim", "fennel"}
local textobject_keymaps = {aa = "@parameter.outer", ia = "@parameter.inner", af = "@function.outer", ["if"] = "@function.inner", ac = "@class.outer", ic = "@class.inner"}
local incremental_selection_keymaps = {init_selection = "<c-space>", node_incremental = "<c-space>", scope_incremental = "<c-s>", node_decremental = "<M-space>"}
return configs.setup({ensure_installed = ensure_installed, highlight = {enable = true}, indent = {disable = {"python", "typescript", "javascript"}, enable = false}, incremental_selection = {enable = true, keymaps = incremental_selection_keymaps}, textobjects = {select = {enable = true, disable = {"clojure", "fennel"}, lookahead = true, keymaps = textobject_keymaps}, move = {enable = true, disable = {"clojure"}, set_jumps = true, goto_next_start = {["]m"] = "@function.outer", ["]]"] = "@class.outer"}, goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"}, goto_previous_start = {["[m"] = "@function.outer", ["[["] = "@class.outer"}, goto_previous_end = {["[M"] = "@function.outer", ["[]"] = "@class.outer"}}, swap = {enable = true, disable = {"clojure"}, swap_next = {["<leader>a"] = "@parameter.inner"}, swap_previous = {["<leader>A"] = "@parameter.inner"}}}, auto_install = false})
