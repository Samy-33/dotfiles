-- [nfnl] Compiled from fnl/user/core.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local plugins = autoload("user.plugins")
local function setup()
  plugins.setup()
  require("user.config.general")
  require("user.config.diagnostics")
  require("user.config.keymaps")
  require("user.config.treesitter")
  require("user.config.lsp")
  require("user.config.paredit")
  require("user.config.conjure")
  require("user.config.cmp")
  require("user.config.telescope")
  require("user.config.rainbow")
  require("user.config.wiki")
  require("user.config.neorg")
  require("user.config.oliv")
  require("user.config.project")
  require("user.config.cphelper")
  return nil
end
return {setup = setup}
