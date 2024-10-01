local cmp = require("cmp")

require("snippy").setup({
  mappings = {
    is = {
      ["<Tab>"] = "expand_or_advance",
      ["<S-Tab>"] = "previous",
    },
    nx = {
      ["<leader>x"] = "cut_text",
    },
  },
})

require("cmp_dictionary").setup({
  paths = { "/usr/share/dict/words" },
  exact_length = 2,
  first_case_insensitive = true,
  document = {
    enable = false,
  },
})

cmp.setup({
  snippet = {
    expand = function(args)
      require("snippy").expand_snippet(args.body)
    end,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "snippy" },
    { name = "nvim_lsp_signature_help" },
  }, {
    { name = "buffer" },
  }, {
    { name = "dictionary", keyword_length = 2 },
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = require("lspkind").cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
    }),
  },
})

-- cmp.setup.filetype("gitcommit", {
-- 	sources = cmp.config.sources({
-- 		{ name = "git" },
-- 		{ name = "buffer" },
-- 	}),
-- })

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
