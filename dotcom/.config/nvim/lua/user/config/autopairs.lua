-- [nfnl] Compiled from fnl/user/config/autopairs.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local _local_2_ = require("nfnl.core")
local first = _local_2_["first"]
local auto_pairs = autoload("nvim-autopairs")
local quote_rules = first(auto_pairs.get_rules("'"))
quote_rules.not_filetypes = {"clojure", "fennel"}
local quote_rules0 = first(auto_pairs.get_rules("`"))
quote_rules0.not_filetypes = {"clojure", "fennel"}
return {}
