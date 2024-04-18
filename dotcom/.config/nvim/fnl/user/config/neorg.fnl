(local {: autoload} (require :nfnl.module))
(local neorg (autoload :neorg))

(local modules {:core.defaults {}
                :core.keybinds {:config 
                                {:hook
                                 (fn [{: leader : map}]
                                   (map
                                     :norg
                                     :n (.. leader :njt)
                                     "<cmd>Neorg journal today<cr>"))}}
                :core.dirman {:config {:workspaces
                                       {:oliv "~/neorg/oliv"
                                        :personal "~/neorg/personal"}

                                       :index "index.norg"}}
                :core.concealer {}
                :core.export {}})

(neorg.setup {:load modules})
