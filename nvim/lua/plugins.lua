return require('packer').startup(function(use) 
	use 'wbthomason/packer.nvim'
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline'
		}
	}
	use {
		'williamboman/nvim-lsp-installer'
	}
	use {
		'tpope/vim-commentary'
	}
	use {
        	'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate'
    	}
	use {
		'preservim/nerdtree'
	}
	use {
		'ghifarit53/tokyonight-vim'
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'BurntSushi/ripgrep', 'nvim-lua/plenary.nvim'
		}
	}
	use{
	    'iamcco/markdown-preview.nvim',
	    run	 = function() vim.fn['mkdp#util#install']() end,
	}
	use {
		'hrsh7th/cmp-vsnip'
	}
	use {
		'hrsh7th/vim-vsnip'
	}
end)
