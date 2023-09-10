(module init
  {require {core aniseed.core
            utils common.utils
            : plugins}})

(plugins.load-lazy)

(->> (utils.glob (.. utils.config-path "/lua/config/*.lua"))
     (core.run! (fn [path]
                  (require (string.gsub path ".*/(.*)/(.*).lua" "%1.%2")))))

(->> (utils.glob (.. utils.config-path "/lua/ftplugin/*.lua"))
     (core.run! (fn [path]
                  (require (string.gsub path ".*/(.*)/(.*).lua" "%1.%2")))))
