-- [nfnl] Compiled from fnl/core.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local plugins = autoload("plugins")
local function setup()
  plugins.setup()
  require("config.general")
  require("config.diagnostics")
  require("config.keymaps")
  require("config.treesitter")
  require("config.lsp")
  require("config.conjure")
  require("config.cmp")
  require("config.telescope")
  require("config.rainbow")
  require("config.wiki")
  require("config.oliv")
  return nil
end
return {setup = setup}
