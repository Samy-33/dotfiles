(local {: autoload} (require :nfnl.module))
(local neorg (autoload :neorg))

(local modules {:core.defaults {}
                :core.dirman {:config {:workspaces {:oliv "~/neorg/oliv"
                                                    :personal "~/neorg/personal"
                                                    :ticombo "~/neorg/ticombo"}
                                       :index :index.norg}}
                :core.concealer {}
                :core.export {}
                :core.export.markdown {:config {:extensions :all}}})

(neorg.setup {:load modules})
