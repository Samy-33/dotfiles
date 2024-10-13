-- [nfnl] Compiled from fnl/user/plugins.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local utils = autoload("user.common.utils")
local lazy_path = (utils["data-path"] .. "/lazy/lazy.nvim")
local lazy_installed_3f = vim.loop.fs_stat(lazy_path)
local plugins_to_install
local function _2_()
  return vim.cmd.colorscheme("tokyonight-night")
end
local function _3_()
  return (vim.fn.executable("make") == 1)
end
local function _4_()
  return require("guess-indent").setup()
end
local function _5_()
  local pandoc = require("pandoc")
  return pandoc.setup()
end
plugins_to_install = {{"Olical/nfnl", ft = "fennel"}, "tpope/vim-repeat", "tpope/vim-sleuth", {"L3MON4D3/LuaSnip", version = "v2.3.0"}, {"neovim/nvim-lspconfig", dependencies = {{"williamboman/mason.nvim", config = true}, "williamboman/mason-lspconfig.nvim", {"j-hui/fidget.nvim", opts = {}, branch = "main"}, "folke/neodev.nvim"}}, {"nvimtools/none-ls.nvim"}, {"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-nvim-lsp"}}, {"saadparwaiz1/cmp_luasnip"}, {"folke/which-key.nvim", opts = {}}, "tpope/vim-fugitive", {"lewis6991/gitsigns.nvim", opts = {signs = {add = {text = "+"}, change = {text = "~"}, delete = {text = "_"}, topdelete = {text = "\226\128\190"}, changedelete = {text = "~"}}}}, {"folke/tokyonight.nvim", priority = 500, config = _2_, lazy = false}, {"nvim-lualine/lualine.nvim", opts = {options = {theme = "tokyonight", component_separators = "|", section_separators = "", icons_enabled = false}, sections = {lualine_c = {{"filename", file_status = true, path = 1}}}}}, {"lukas-reineke/indent-blankline.nvim", opts = {scope = {show_end = false, show_start = false}}, main = "ibl"}, {"numToStr/Comment.nvim", opts = {}}, {"nvim-telescope/telescope.nvim", version = "*", dependencies = {"nvim-lua/plenary.nvim", {"nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0"}}}, {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _3_}, {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"}}, "Olical/conjure", "PaterJason/cmp-conjure", "tpope/vim-dispatch", "clojure-vim/vim-jack-in", "radenling/vim-dispatch-neovim", "tpope/vim-surround", {"julienvincent/nvim-paredit"}, "HiPhish/rainbow-delimiters.nvim", "lervag/wiki.vim", {"vhyrro/luarocks.nvim", priority = 1000, config = true}, {"Pocco81/true-zen.nvim", config = true}, {"nvim-neorg/neorg", dependencies = {"luarocks.nvim"}}, "justinmk/vim-dirvish", {"windwp/nvim-autopairs", event = "InsertEnter", opts = {enable_check_bracket_line = false}}, {"nmac427/guess-indent.nvim", config = _4_}, {"aspeddro/pandoc.nvim", config = _5_}, {"https://git.sr.ht/~p00f/cphelper.nvim", dependencies = {"nvim-lua/plenary.nvim"}}}
local function setup()
  if not lazy_installed_3f then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazy_path})
  else
  end
  vim.opt.rtp:prepend(lazy_path)
  local lazy = autoload("lazy")
  return lazy.setup(plugins_to_install)
end
return {setup = setup}
