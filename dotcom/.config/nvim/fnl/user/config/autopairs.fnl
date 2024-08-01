(local {: autoload} (require :nfnl.module))
(local {: first} (require :nfnl.core))
(local auto-pairs (autoload :nvim-autopairs))

(local quote-rules (first (auto-pairs.get_rules "'")))

(set quote-rules.not_filetypes [:clojure :fennel])

{}
