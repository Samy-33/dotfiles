-- [nfnl] Compiled from fnl/user/config/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local cmp = autoload("cmp")
local luasnip = autoload("luasnip")
luasnip.setup()
local function _2_(args)
  return luasnip.lsp_expand(args.body)
end
local function _3_(fallback)
  if cmp.visible() then
    return cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    return luasnip.expand_or_jump()
  else
    return fallback()
  end
end
local function _5_(fallback)
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    return luasnip.jump(-1)
  else
    return fallback()
  end
end
return cmp.setup({snippet = {expand = _2_}, mapping = cmp.mapping.preset.insert({["<C-d>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete({}), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false}), ["<Tab>"] = cmp.mapping(_3_), ["<S-Tab>"] = cmp.mapping(_5_)}, {"i", "s"}), sources = {{name = "nvim_lsp"}, {name = "conjure"}, {name = "luasnip"}, {name = "path"}, {name = "buffer"}}})
