-- [nfnl] fnl/user/config/neorg.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local neorg = autoload("neorg")
local modules = {["core.defaults"] = {}, ["core.dirman"] = {config = {workspaces = {oliv = "~/neorg/oliv", personal = "~/neorg/personal", ticombo = "~/neorg/ticombo"}, index = "index.norg"}}, ["core.concealer"] = {}, ["core.export"] = {}, ["core.export.markdown"] = {config = {extensions = "all"}}}
return neorg.setup({load = modules})
