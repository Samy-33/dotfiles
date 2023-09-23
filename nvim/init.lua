-- Set <,> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local nfnl_path = vim.fn.stdpath 'data' .. '/lazy/nfnl'

if not vim.loop.fs_stat(nfnl_path) then
  print("Could not find nfnl, cloning new copy to", nfnl_path)
  vim.fn.system({'git', 'clone', 'https://github.com/Olical/nfnl', nfnl_path})
  vim.cmd('helptags ' .. nfnl_path .. '/docs')
end

vim.opt.rtp:prepend(nfnl_path)

require('nfnl').setup()
require('core').setup()

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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
