(module common.utils
  {require {nvim aniseed.nvim}})


(def config-path (nvim.fn.stdpath "config"))

(defn glob [path]
  "Returns all the files matching the path regex"
  (nvim.fn.glob path true true true))

