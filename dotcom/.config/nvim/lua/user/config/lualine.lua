-- [nfnl] Compiled from fnl/user/config/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.core")
local concat = _local_1_["concat"]
local lualine = require("lualine")
local conjure_client = require("conjure.client")
local current_config = lualine.get_config()
return lualine.setup({options = {theme = "tokyonight", component_separators = "|", section_separators = "", icons_enabled = false}, sections = {lualine_c = {{"filename", file_status = true, path = 1}}, lualine_x = concat(current_config.sections.lualine_x, {conjure_client["state-key"]})}})
