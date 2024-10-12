-- [nfnl] Compiled from fnl/user/config/nonels.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local null_ls = autoload("null-ls")
return null_ls.setup({sources = {null_ls.builtins.formatting.fnlfmt}})
