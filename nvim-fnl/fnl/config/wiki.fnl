(module config.wiki {require {tbuiltin telescope.builtin}})

(def- wiki-root "~/wiki")

(set vim.g.wiki_root wiki-root)
(set vim.g.wiki_tag_scan_num_lines -2)

(vim.keymap.set :n :<leader>w<leader>ff
                (fn [] (tbuiltin.find_files {:cwd wiki-root}))
                {:desc "[W]iki [F]ind [F]iles"})

(vim.keymap.set :n :<leader>w<leader>fg
                (fn [] (tbuiltin.live_grep {:cwd wiki-root}))
                {:desc "[W]iki [F]ind by [G]rep"})
