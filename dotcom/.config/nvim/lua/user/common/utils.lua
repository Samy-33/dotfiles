-- [nfnl] Compiled from fnl/user/common/utils.fnl by https://github.com/Olical/nfnl, do not edit.
local config_path = vim.fn.stdpath("config")
local data_path = vim.fn.stdpath("data")
local function get_color_column()
  return vim.o.colorcolumn
end
return {["config-path"] = config_path, ["data-path"] = data_path, ["get-color-column"] = get_color_column}
