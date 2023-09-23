(local {: autoload} (require :nfnl.module))
(local fs (autoload :nfnl.fs))

(local config-path (vim.fn.stdpath :config))
(local data-path (vim.fn.stdpath :data))
(local lazy-path (.. data-path :/lazy/lazy.nvim))

(local lazy-installed?
     (vim.loop.fs_stat lazy-path))

(local plugins-to-install
  [{1 :Olical/nfnl
    :ft :fennel }
   :tpope/vim-repeat
   ; Detect tabstop and shiftwidth automatically
   :tpope/vim-sleuth
   ; NOTE: This is where your plugins related to LSP can be installed.
   ; The configuration is done below. Search for lspconfig to find it below.
   {1 :neovim/nvim-lspconfig
    :dependencies [{1 :williamboman/mason.nvim :config true}
                   :williamboman/mason-lspconfig.nvim
                   {1 :j-hui/fidget.nvim :opts {}}
                   :folke/neodev.nvim]}
   ; Autocompletion   
   {1 :hrsh7th/nvim-cmp
    :dependencies [:hrsh7th/cmp-nvim-lsp
                   :L3MON4D3/LuaSnip
                   :saadparwaiz1/cmp_luasnip]}
   ; Useful plugin to show you pending keybinds.
   {1 :folke/which-key.nvim :opts {}}
   ; Git related plugins
   :tpope/vim-fugitive
   ; Adds git releated signs to the gutter, as well as utilities for managing changes
   {1 :lewis6991/gitsigns.nvim
    ; See `:help gitsigns.txt`
    :opts {:signs {:add {:text "+"}
                   :change {:text "~"}
                   :delete {:text "_"}
                   :topdelete {:text "‾"}
                   :changedelete {:text "~"}}}}
   {1 :folke/tokyonight.nvim
    :lazy false
    :priority 500
    :config (fn [] (vim.cmd.colorscheme :tokyonight-night))}
   ; Theme inspired by Atom
   {1 :navarasu/onedark.nvim
    :priority 1000
    :config (fn [] (vim.cmd.colorscheme :onedark))}
   ; Set lualine as statusline
   {1 :nvim-lualine/lualine.nvim
    ; See `:help lualine.txt`
    :opts {:options {:icons_enabled false
                     :theme :onedark
                     :component_separators "|"
                     :section_separators ""}
           :sections {:lualine_c [{1 :filename
                                   :file_status true
                                   :path 1}]}}}
   ; Add indentation guides even on blank lines
   {1 :lukas-reineke/indent-blankline.nvim
    ; See `:help indent_blankline.txt`
    :opts {:char "┊" :show_trailing_blankline_indent false}}
   ; "gc" to comment visual regions/lines
   {1 :numToStr/Comment.nvim :opts {}}
   ; Fuzzy Finder (files, lsp, etc)
   {1 :nvim-telescope/telescope.nvim
    :version "*"
    :dependencies {1 :nvim-lua/plenary.nvim}}
   ; Fuzzy Finder Algorithm which requires local dependencies to be built.
   ; Only load if `make` is available. Make sure you have the system
   ; requirements installed.
   {1 :nvim-telescope/telescope-fzf-native.nvim
    ; NOTE: If you are having trouble with this installation,
    ; refer to the README for telescope-fzf-native for more instructions.
    :build :make
    :cond (fn [] (= (vim.fn.executable :make) 1))}
   ; Highlight, edit, and navigate code
   {1 :nvim-treesitter/nvim-treesitter
    :build ":TSUpdate"
    :dependencies [:nvim-treesitter/nvim-treesitter-textobjects]}
   ; Clojure dev
   :Olical/conjure
   :PaterJason/cmp-conjure
   :tpope/vim-dispatch
   :clojure-vim/vim-jack-in
   :radenling/vim-dispatch-neovim
   :tpope/vim-surround
   :guns/vim-sexp
   :tpope/vim-sexp-mappings-for-regular-people
   :HiPhish/rainbow-delimiters.nvim
   ; For functional nvim config using fnl-lang
   ; This is already added in init.lua but somehow,
   ; if not added here, the syntax highlighting stops working.
   ; so keeping it here till I figure out why this is happening. (probably never?)
   ; :Olical/aniseed
   ; For making notes
   :lervag/wiki.vim
   ; Exploring filesystem pragmatically
   :justinmk/vim-dirvish
   ; autopairs
   {1 :windwp/nvim-autopairs
    :event :InsertEnter
    :opts {:enable_check_bracket_line false}}
   
   {1 :nmac427/guess-indent.nvim
    :config (fn [] ((. (require :guess-indent) :setup)))}])

(fn setup []
 (when (not lazy-installed?)
    (vim.fn.system [:git
		    :clone
		    "--filter=blob:none"
		    "https://github.com/folke/lazy.nvim.git"
		    :--branch=stable
		    lazy-path]))
 (vim.opt.rtp:prepend lazy-path)
 (let [lazy (autoload :lazy)]
   (lazy.setup plugins-to-install)))

{: setup}
