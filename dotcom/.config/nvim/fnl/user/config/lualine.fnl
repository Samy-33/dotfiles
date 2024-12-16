(local {: concat} (require :nfnl.core))
(local lualine (require :lualine))
(local conjure-client (require :conjure.client))

(local current-config (lualine.get_config))

(lualine.setup
  {:options {:icons_enabled false
   :theme :tokyonight
   :component_separators "|"
   :section_separators ""}
   :sections {:lualine_c [{1 :filename :file_status true :path 1}]
              :lualine_x (concat current-config.sections.lualine_x [conjure-client.state-key])}})
