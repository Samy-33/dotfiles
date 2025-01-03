(local {: autoload} (require :nfnl.module))
(local utils (autoload :user.common.utils))

(local lazy-path (.. utils.data-path :/lazy/lazy.nvim))

(local lazy-installed? (vim.loop.fs_stat lazy-path))

(local plugins-to-install
       [{1 :Olical/nfnl :ft :fennel}
        ; Exploring filesystem pragmatically
        ; :justinmk/vim-dirvish
        {1 :stevearc/oil.nvim
         :dependencies [:nvim-tree/nvim-web-devicons]
         :config (fn []
                   (let [oil (require :oil)]
                     (oil.setup)))}
        :tpope/vim-repeat
        ; Detect tabstop and shiftwidth automatically
        :tpope/vim-sleuth
        ; :nvim-java/nvim-java
        {1 :L3MON4D3/LuaSnip :version :v2.3.0}
        {1 :neovim/nvim-lspconfig
         :dependencies [{1 :williamboman/mason.nvim :config true}
                        :williamboman/mason-lspconfig.nvim
                        {1 :j-hui/fidget.nvim :opts {} :branch :main}
                        :folke/neodev.nvim]}
        {1 :nvimtools/none-ls.nvim}
        ; Autocompletion   
        {1 :hrsh7th/nvim-cmp :dependencies [:hrsh7th/cmp-nvim-lsp]}
        {1 :saadparwaiz1/cmp_luasnip}
        ; Useful plugin to show you pending keybinds.
        {1 :folke/which-key.nvim :opts {}}
        ; Git related plugins
        :tpope/vim-fugitive
        ; Adds git related signs to the gutter, as well as utilities for managing changes
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
        ; Set lualine as statusline
        {1 :nvim-lualine/lualine.nvim
         ; See `:help lualine.txt`
         :opts {:options {:icons_enabled false
                          :theme :tokyonight
                          :component_separators "|"
                          :section_separators ""}
                :sections {:lualine_c [{1 :filename :file_status true :path 1}]}}}
        ; Add indentation guides even on blank lines
        ; {1 :lukas-reineke/indent-blankline.nvim
        ;  ; See `:help indent_blankline.txt`
        ;  :opts {:scope {:enabled false}}
        ;  :main :ibl}
        ; "gc" to comment visual regions/lines
        {1 :numToStr/Comment.nvim :opts {}}
        ; Fuzzy Finder (files, lsp, etc)
        {1 :nvim-telescope/telescope.nvim
         :version "*"
         :dependencies [:nvim-lua/plenary.nvim
                        {1 :nvim-telescope/telescope-live-grep-args.nvim}]}
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
        {1 :julienvincent/nvim-paredit :branch :master}
        :HiPhish/rainbow-delimiters.nvim
        {1 :vhyrro/luarocks.nvim :priority 1000 :config true}
        {1 :Pocco81/true-zen.nvim :config true}
        {1 :nvim-neorg/neorg :dependencies [:luarocks.nvim]}
        ; autopairs
        {1 :windwp/nvim-autopairs
         :event :InsertEnter
         :opts {:enable_check_bracket_line false}}
        {1 :nmac427/guess-indent.nvim :config true}
        {1 :aspeddro/pandoc.nvim :config true}
        {1 "https://git.sr.ht/~p00f/cphelper.nvim"
         :ft :cpp
         :dependencies [:nvim-lua/plenary.nvim]}])

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
