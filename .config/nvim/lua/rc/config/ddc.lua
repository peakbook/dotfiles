vim.fn["ddc#custom#patch_global"]("sources", {
  "skkeleton",
  "vim-lsp",
  "around",
  "deoppet",
  "dictionary",
})

vim.fn["ddc#custom#patch_global"]("sourceOptions", {
  ["_"] = {
    matchers = { "matcher_head" },
    sorters = { "sorter_rank" }
  },
  ["vim-lsp"] = {
    mark = "LSP",
    forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
  },
  deoppet = {
    dup = true,
    mark = "SNP"
  },
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
  }
})

vim.fn["ddc#custom#patch_global"]("sourceParams", {
  dictionary = {
    dictPaths = { "/usr/share/dict/words" },
    smartCase = true
  }
})

vim.fn["ddc#enable"]()
