let mapleader=','
let config_path=stdpath('config')
set number
set relativenumber

call plug#begin()

" Telescope FZF
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" NERDTree
Plug 'preservim/nerdtree'

" AutoComplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" LSP Installer
Plug 'williamboman/nvim-lsp-installer'

" VSnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Theme Plug
Plug 'rakr/vim-one'

" TreeSitter (Syntax Highlighting and language parsing)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

exec 'source' .config_path. '/telescope_conf.vim'
exec 'source' .config_path. '/nerdtree_conf.vim'
exec 'source' .config_path. '/nvim_cmp_conf.vim'
lua require("nvim-lsp-installer").setup {}

" Theme config
let g:airline_theme='one'
let g:one_allow_italics=1
colorscheme one
set background=dark
