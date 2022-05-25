vim.g.lsp_settings_filetype_lua = 'sumneko-lua-language-server'

vim.g.lsp_settings = {
  ["sumneko-lua-language-server"] = {
    workspace_config = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        }
      }
    }
  }
}
