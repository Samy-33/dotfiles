(local {: autoload} (require :nfnl.module))
(local telescope (autoload :telescope))
(local builtin (autoload :telescope.builtin))
(local actions (autoload :telescope.actions))
(local themes (autoload :telescope.themes))
(local lga-actions (autoload :telescope-live-grep-args.actions))

(local utils (autoload :user.common.utils))

(telescope.setup {:defaults {:mappings {:i {:<C-u> false
                                            :<C-d> false
                                            :<C-q> (+ actions.smart_send_to_qflist
                                                      actions.open_qflist)}}}
                  :extensions {:live_grep_args {:auto_quoting true
                                                :mappings {:i {:<C-k> (lga-actions.quote_prompt)
                                                               :<C-i> (lga-actions.quote_prompt {:postfix " --iglob "})
                                                               :<C-space> actions.to_fuzzy_refine}}}}})

(telescope.load_extension :fzf)
(telescope.load_extension :live_grep_args)

;; keymaps
(vim.keymap.set :n :<leader>? builtin.oldfiles
                {:desc "[?] Find recently opened files"})

(vim.keymap.set :n :<leader>fb builtin.buffers {:desc "[F]ind open [B]uffers"})

(vim.keymap.set :n :<leader>/
                (fn []
                  (builtin.current_buffer_fuzzy_find (themes.get_dropdown {:winblend 10
                                                                           :previewer false})))
                {:desc "[/] Fuzzily search in current buffer"})

(vim.keymap.set :n :<leader>ff builtin.find_files {:desc "[F]ind [F]iles"})

(vim.keymap.set :n :<leader>fh builtin.help_tags {:desc "[F]ind [H]elp"})

(vim.keymap.set :n :<leader>fw builtin.grep_string
                {:desc "[F]ind current [W]ord"})

(vim.keymap.set :n :<leader>fg
                telescope.extensions.live_grep_args.live_grep_args
                {:desc "[F]ind by [G]rep"})

(vim.keymap.set :n :<leader>fd builtin.diagnostics
                {:desc "[F]ind [D]iagnostics"})

(vim.keymap.set :n :<leader>fcf
                (fn [] (builtin.find_files {:cwd utils.config-path}))
                {:desc "[F]ind [C]onfing [F]iles"})

(vim.keymap.set :n :<leader>fch builtin.command_history
                {:desc "[F]ind in [C]ommands [H]istory"})

(vim.keymap.set :n :<leader>fm builtin.marks {:desc "[F]ind in [M]arks"})
