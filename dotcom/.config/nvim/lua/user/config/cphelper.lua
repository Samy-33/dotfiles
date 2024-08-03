-- [nfnl] Compiled from fnl/user/config/cphelper.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g["cph#dir"] = vim.fn.expand("$HOME/Documents/cp/cphelper")
vim.g["cph#lang"] = "cpp"
vim.g["cph#cpp#compile_command"] = "g++ -g solution.cpp -o cpp.out"
vim.keymap.set({"n"}, "<localleader>cpr", ":CphReceive<cr>", {desc = "Fetch problem", silent = false})
vim.keymap.set({"n"}, "<localleader>cpt", ":CphTest<cr>", {desc = "Compile and Test", silent = false})
return vim.keymap.set({"n"}, "<localleader>cptt", ":CphRetest<cr>", {desc = "Retest", silent = false})
