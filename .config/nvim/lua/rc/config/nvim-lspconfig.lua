require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_installation = false,
})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    }
  }
})
require("lspconfig").bashls.setup({})
require("lspconfig").yamlls.setup({})
require("lspconfig").volar.setup({})
require("lspconfig").cmake.setup({})
--require("lspconfig").zk.setup({})
require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E203", "W503" },
          maxLineLength = 120
        }
      }
    }
  }
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({
  capabilities = capabilities,
  --cmd = {"clangd", "--offset-encoding=utf-16"}
  cmd = { "clangd" }
})
--require("lspconfig").clangd.setup({})
require("lspconfig").r_language_server.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").taplo.setup({})
require("lspconfig").julials.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").zls.setup({})
require("lspconfig").eslint.setup({})
--require("lspconfig").grammerly.setup({})
require('lspconfig').ruff_lsp.setup({})
require('lspconfig').marksman.setup({})

-- disable virtual_text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- set signs for diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
