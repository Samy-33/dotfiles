(set vim.o.hlsearch false)

(set vim.wo.number true)
(set vim.wo.relativenumber true)

(set vim.o.mouse "")

(set vim.opt.clipboard :unnamedplus)

(set vim.o.breakindent true)
(set vim.o.undofile true)
(set vim.o.ignorecase true)
(set vim.o.smartcase true)
(set vim.wo.signcolumn :yes)
(set vim.o.updatetime 250)
(set vim.o.timeout true)
(set vim.o.timeoutlen 300)
(set vim.o.completeopt "menuone,noselect")
(set vim.o.termguicolors true)
(set vim.o.cursorline true)
(set vim.o.backupcopy :yes)
(set vim.o.scrolloff 5)

; (vim.lsp.set_log_level :DEBUG)

;; Highlight on Yank
(fn setup-yank-highlight []
  (let [yank-augroup (vim.api.nvim_create_augroup :YankHighlight {:clear true})]
    (vim.api.nvim_create_autocmd :TextYankPost
                                 {:callback #(vim.highlight.on_yank)
                                  :group yank-augroup
                                  :pattern "*"})))

(setup-yank-highlight)

(vim.api.nvim_create_autocmd :BufEnter
                             {:callback (fn [] (set vim.bo.filetype :clojure))
                              :pattern :*.cljd})

(vim.filetype.add {:extension {:ebnf :ebnf}})

{}
