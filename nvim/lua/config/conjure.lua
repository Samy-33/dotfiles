-- [nfnl] Compiled from fnl/config/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(evt)
  return vim.diagnostic.disable(evt.buf)
end
return vim.api.nvim_create_autocmd({"BufRead"}, {group = vim.api.nvim_create_augroup("conjure-config", {clear = true}), pattern = "conjure-log-*.cljc", callback = _1_})