-- [nfnl] Compiled from fnl/user/config/project.fnl by https://github.com/Olical/nfnl, do not edit.
local project_dir = vim.fn.getcwd()
local home_dir = vim.fn.expand("$HOME")
while (1 == string.find(project_dir, home_dir)) do
  do
    local config_file = (project_dir .. "/.nvim/init.lua")
    if vim.uv.fs_stat(config_file) then
      print(string.format("Found config file: `%s`!", config_file))
      vim.cmd({cmd = "source", args = {string.format("%s", config_file)}})
    else
    end
  end
  project_dir = vim.fn.fnamemodify(project_dir, ":h")
end
return nil
