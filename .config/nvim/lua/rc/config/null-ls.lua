require("mason-null-ls").setup({
  ensure_installed = { "stylua", "jq", "yamlls" },
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.cmake_format,
    null_ls.builtins.diagnostics.cmake_lint,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.textlint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.mypy,
  },
})
