require("nvim-lsp-installer").setup({})
local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end

lspconfig.sumneko_lua.setup({
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
require("lspconfig").zk.setup({})
require("lspconfig").pylsp.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").r_language_server.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").taplo.setup({})
--require("lspconfig").grammerly.setup({})
