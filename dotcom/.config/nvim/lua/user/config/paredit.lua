-- [nfnl] Compiled from fnl/user/config/paredit.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local paredit = autoload("nvim-paredit")
local function setup()
  return paredit.setup({indent = {enabled = true}})
end
setup()
return {}
