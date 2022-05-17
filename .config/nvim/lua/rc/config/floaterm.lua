vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.6
vim.g.floaterm_title = ""
vim.g.floaterm_borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
vim.g.floaterm_opener = "edit"

vim.api.nvim_command("hi! link NormalFloat Normal")
vim.api.nvim_command("hi! link FloatermBorder NormalFloat")
