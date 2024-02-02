require("mason-null-ls").setup({
    ensure_installed = { "stylua", "jq" }
})

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.yamllint,
    require("null-ls").builtins.formatting.yamlfmt,
    -- require("null-ls").builtins.diagnostics.markdownlint,
    require("null-ls").builtins.formatting.cmake_format,
    require("null-ls").builtins.diagnostics.clang_check,
    require("null-ls").builtins.formatting.clang_format,
    require("null-ls").builtins.diagnostics.cmake_lint,
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.beautysh,
    require("null-ls").builtins.formatting.xmllint,
    require("null-ls").builtins.formatting.textlint,
    require("null-ls").builtins.formatting.jq,
    require("null-ls").builtins.formatting.latexindent,
    require("null-ls").builtins.diagnostics.mypy,
    --require("null-ls").builtins.formatting.stylua,
  },
})
