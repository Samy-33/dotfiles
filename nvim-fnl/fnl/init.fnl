(module init
  {require {core aniseed.core
            nvim aniseed.nvim
            utils common.utils}})

(->> (utils.glob (.. utils.config-path "/lua/config/*.lua"))
     (core.run! (fn [path]
                  (require (string.gsub path ".*/(.*)/(.*).lua" "%1.%2")))))

