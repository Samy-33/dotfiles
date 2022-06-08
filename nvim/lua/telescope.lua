local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }

keymap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<cr>', noremap_opts)
keymap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<cr>', noremap_opts)
keymap('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<cr>', noremap_opts)
keymap('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<cr>', noremap_opts)
