(module common.utils)


(def config-path (vim.fn.stdpath "config"))
(def data-path (vim.fn.stdpath "data"))

(defn glob [path]
  "Returns all the files matching the path regex"
  (vim.fn.glob path true true true))

