return require('packer').startup(function(use) 
  use 'wbthomason/packer.nvim'

  -- Neo Git
  use 'TimUntersberger/neogit'

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
    }
  }
  use 'hrsh7th/cmp-vsnip';
  use 'hrsh7th/vim-vsnip';
  use 'williamboman/nvim-lsp-installer';

  -- File Explorer
  use 'preservim/nerdtree';

  -- Commenting
  use 'tpope/vim-commentary';

  -- Color scheme
  use 'ghifarit53/tokyonight-vim';

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'BurntSushi/ripgrep', 'nvim-lua/plenary.nvim'
    }
  }

  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    run	 = function() vim.fn['mkdp#util#install']() end,
  }

  -- Formatter
  use 'sbdchd/neoformat';

  -- AutoClosing of the brackets/quotes
  use 'windwp/nvim-autopairs';
end)
