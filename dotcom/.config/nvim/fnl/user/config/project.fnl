(var project-dir (vim.fn.getcwd))
(local home-dir (vim.fn.expand :$HOME))

(while (= 1 (string.find project-dir home-dir))
  (let [config-file (.. project-dir :/.nvim/init.lua)]
    (when (vim.uv.fs_stat config-file)
      (print (string.format "Found config file: `%s`!" config-file))
      (vim.cmd {:cmd :source :args [(string.format "%s" config-file)]})))
  (set project-dir (vim.fn.fnamemodify project-dir ":h")))
