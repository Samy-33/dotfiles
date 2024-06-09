-- [nfnl] Compiled from fnl/user/config/neorg.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local neorg = autoload("neorg")
local modules
local function _4_(_2_)
  local _arg_3_ = _2_
  local leader = _arg_3_["leader"]
  local map = _arg_3_["map"]
  return map("norg", "n", (leader .. "njt"), "<cmd>Neorg journal today<cr>")
end
modules = {["core.defaults"] = {}, ["core.keybinds"] = {config = {hook = _4_}}, ["core.dirman"] = {config = {workspaces = {oliv = "~/neorg/oliv", personal = "~/neorg/personal", ticombo = "~/neorg/ticombo"}, index = "index.norg"}}, ["core.concealer"] = {}, ["core.export"] = {}}
return neorg.setup({load = modules})
