-- [nfnl] Compiled from fnl/config/rainbow.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local utils = autoload("common.utils")
local rainbow_delimiters = autoload("rainbow-delimiters")
vim.g.rainbow_delimiters = {strategy = {[""] = rainbow_delimiters.strategy["local"]}, query = {[""] = "rainbow-delimiters"}}
return nil
