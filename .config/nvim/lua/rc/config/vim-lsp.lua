vim.g.lsp_preview_float = 0
vim.g.lsp_diagnostics_float_cursor = 1
vim.g.lsp_diagnostics_virtual_text_enabled = 1
vim.g.lsp_diagnostics_virtual_text_prefix = "‣ "
vim.g.lsp_hover_ui = 'float'

vim.g.lsp_diagnostics_signs_error = { text = " " }
vim.g.lsp_diagnostics_signs_warning = { text = " " }
vim.g.lsp_diagnostics_signs_information = { text = " " }
vim.g.lsp_diagnostics_signs_hint = { text = " " }
vim.g.lsp_document_code_action_signs_hint = { text = " " }

vim.api.nvim_command("hi! link LspErrorText RedSign")
vim.api.nvim_command("hi! link LspWarningText YellowSign")
vim.api.nvim_command("hi! link LspInformationText GreenSign")
vim.api.nvim_command("hi! link LspHintText BlueSign")
vim.api.nvim_command("hi! link LspCodeActionText BlueSign")

vim.api.nvim_command("hi! link LspErrorVirtualText ErrorFloat")
vim.api.nvim_command("hi! link LspWarningVirtualText WarningFloat")
vim.api.nvim_command("hi! link LspInformationVirtualText InfoFloat")
vim.api.nvim_command("hi! link LspHintVirtualText HintFloat")
vim.api.nvim_command("hi! link LspCodeActionVirtualText HintFloat")

vim.cmd([[
set foldmethod=expr
      \ foldexpr=lsp#ui#vim#folding#foldexpr()
      \ foldtext=lsp#ui#vim#folding#foldtext() ]])

vim.g.lsp_settings_filetype_typescript = 'typescript-language-server'
vim.g.lsp_settings_filetype_javascript = 'typescript-language-server'
vim.g.lsp_settings_filetype_vue = 'vls'
vim.g.lsp_settings_filetype_html = 'html-languageserver'
vim.g.lsp_settings_filetype_yaml = 'yaml-language-server'
vim.g.lsp_settings_filetype_dockerfile = 'dockerfile-language-server-nodejs'
vim.g.lsp_settings_filetype_xml = 'lemminx'
vim.g.lsp_settings_filetype_python = 'pylsp-all'
vim.g.lsp_settings_filetype_lua = 'sumneko-lua-language-server'
