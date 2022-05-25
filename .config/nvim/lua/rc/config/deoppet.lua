vim.fn["deoppet#initialize"]()
vim.fn["deoppet#custom#option"]("snippets",
  vim.fn.map(vim.fn.globpath(vim.o.runtimepath, "*snippets", 1, 1), function(_, val) return { path = val } end))
