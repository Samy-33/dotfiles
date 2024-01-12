-- [nfnl] Compiled from fnl/user/config/oliv.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.core")
local some = _local_1_["some"]
local current_working_dir = vim.fn.getcwd()
local directories_to_check = {"/Documents/oliv/", "/Documents/projects/muni"}
local function _2_(dir)
  return (string.match(current_working_dir, dir) == dir)
end
if some(_2_, directories_to_check) then
  local oliv_augroup = vim.api.nvim_create_augroup("OlivConjureClientState", {clear = true})
  local function _3_()
    vim.api.nvim_command("ConjureClientState clj")
    vim.api.nvim_command("ConjureConnect 7000")
    vim.api.nvim_command("sleep 500m")
    vim.api.nvim_command("ConjureClientState cljs")
    return vim.api.nvim_command("ConjureConnect 7002")
  end
  vim.api.nvim_create_autocmd("VimEnter", {callback = _3_, group = oliv_augroup, pattern = {"*.clj", "*.cljs"}})
  local function _4_()
    return vim.api.nvim_command("ConjureClientState clj")
  end
  vim.api.nvim_create_autocmd("BufEnter", {callback = _4_, group = oliv_augroup, pattern = "*.clj"})
  local function _5_()
    return vim.api.nvim_command("ConjureClientState cljs")
  end
  return vim.api.nvim_create_autocmd("BufEnter", {callback = _5_, group = oliv_augroup, pattern = "*.cljs"})
else
  return nil
end
