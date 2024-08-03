(set vim.g.cph#dir (vim.fn.expand "$HOME/Documents/cp/cphelper"))
(set vim.g.cph#lang :cpp)
(set vim.g.cph#cpp#compile_command "g++ -g solution.cpp -o cpp.out")

(vim.keymap.set [:n] :<localleader>cpr ":CphReceive<cr>" {:desc "Fetch problem"
                                                          :silent false})
(vim.keymap.set [:n] :<localleader>cpt ":CphTest<cr>" {:desc "Compile and Test"
                                                       :silent false})
(vim.keymap.set [:n] :<localleader>cptt ":CphRetest<cr>" {:desc "Retest"
                                                          :silent false})
