(module config.general)

(set vim.o.hlsearch false)

(set vim.wo.number true)
(set vim.wo.relativenumber true)

(set vim.o.mouse "")

(set vim.o.clipboard "unnamedplus")

(set vim.o.breakindent true)
(set vim.o.undofile true)
(set vim.o.ignorecase true)
(set vim.o.smartcase true)
(set vim.wo.signcolumn "yes")
(set vim.o.updatetime 250)
(set vim.o.timeout true)
(set vim.o.timeoutlen 300)
(set vim.o.completeopt "menuone,noselect")
(set vim.o.termguicolors true)
(set vim.o.cursorline true)

(set vim.g.sexp_filetypes (.. vim.g.sexp_filetypes ",fennel"))
