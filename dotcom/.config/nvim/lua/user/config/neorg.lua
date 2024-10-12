-- [nfnl] Compiled from fnl/user/config/neorg.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local neorg = autoload("neorg")
local modules = {["core.defaults"] = {}, ["core.dirman"] = {config = {workspaces = {oliv = "~/neorg/oliv", personal = "~/neorg/personal", ticombo = "~/neorg/ticombo"}, index = "index.norg"}}, ["core.concealer"] = {}, ["core.export"] = {}}
return neorg.setup({load = modules})
