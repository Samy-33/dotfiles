-- Set <,> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local aniseedpath = vim.fn.stdpath 'data' .. '/lazy/aniseed'

if not vim.loop.fs_stat(aniseedpath) then
  print("Could not find aniseed, cloning new copy to", aniseedpath)
  vim.fn.system({'git', 'clone', 'https://github.com/Olical/aniseed', aniseedpath})
  vim.cmd('helptags ' .. aniseedpath .. '/doc')
end

vim.opt.rtp:prepend(aniseedpath)

require('aniseed.env').init()

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.lsp.set_log_level("debug")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
