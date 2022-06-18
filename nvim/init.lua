vim.g.mapleader = ','
vim.wo.number = true
vim.wo.relativenumber = true
vim.cmd('filetype indent plugin on')

require('plugins')

require('telescope')
require('nerdtree')
require('autocomplete')
require('autopairs')
require('keymaps')

-- Theme Config
vim.g.airline_theme = 'one'
vim.g.one_allow_italics = 1
vim.g.colors_name = 'tokyonight'
vim.o.background = 'dark'

-- Autopep8 for python
vim.cmd('au FileType python setlocal formatprg=autopep8\\ -')

-- Language specific commands
vim.cmd('au FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab')
vim.cmd('au FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab')
vim.cmd('au FileType clj setlocal shiftwidth=2 softtabstop=2 expandtab')
vim.cmd('au FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab')
vim.cmd('au FileType python setlocal shiftwidth=4 softtabstop=4 expandtab')
