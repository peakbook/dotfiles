vim.fn["ddc#custom#patch_global"]("ui", "native")
vim.fn["ddc#custom#patch_global"]("sources", {
  "skkeleton",
  "nvim-lsp",
  "around",
  "file",
  --"deoppet",
  "dictionary",
})

vim.fn["ddc#custom#patch_global"]("sourceOptions", {
  ["_"] = {
    matchers = { "matcher_head" },
    sorters = { "sorter_rank" }
  },
  ["nvim-lsp"] = {
    mark = "LSP",
    forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
  },
  --deoppet = {
    --dup = true,
    --mark = "SNP"
  --},
  around = {
    mark = "ARD"
  },
  dictionary = {
    mark = "DIC"
  },
  skkeleton = {
    mark = "SKK",
    matchers = { "skkeleton" },
    sorters = {}
  },
  file = {
    mark = "FILE",
    forceCompletionPattern = [[\S/\S*]],
  },
})

vim.fn["ddc#custom#patch_global"]("sourceParams", {
  dictionary = {
    dictPaths = { "/usr/share/dict/words" },
    smartCase = true
  },
  ["nvim-lsp"] = {
    kindLabels = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    }
  },
})

vim.fn["ddc#enable"]()
