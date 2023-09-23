-- [nfnl] Compiled from fnl/config/oliv.fnl by https://github.com/Olical/nfnl, do not edit.
local current_working_dir = vim.fn.getcwd()
local oliv_dir_substr = "/Documents/oliv/"
if (string.match(current_working_dir, oliv_dir_substr) == oliv_dir_substr) then
  local oliv_augroup = vim.api.nvim_create_augroup("OlivConjureClientState", {clear = true})
  local function _1_()
    vim.api.nvim_command("ConjureClientState clj")
    vim.api.nvim_command("ConjureConnect 7000")
    vim.api.nvim_command("sleep 500m")
    vim.api.nvim_command("ConjureClientState cljs")
    return vim.api.nvim_command("ConjureConnect 7002")
  end
  vim.api.nvim_create_autocmd("VimEnter", {callback = _1_, group = oliv_augroup, pattern = "*.clj"})
  local function _2_()
    return vim.api.nvim_command("ConjureClientState clj")
  end
  vim.api.nvim_create_autocmd("BufEnter", {callback = _2_, group = oliv_augroup, pattern = "*.clj"})
  local function _3_()
    return vim.api.nvim_command("ConjureClientState cljs")
  end
  return vim.api.nvim_create_autocmd("BufEnter", {callback = _3_, group = oliv_augroup, pattern = "*.cljs"})
else
  return nil
end
