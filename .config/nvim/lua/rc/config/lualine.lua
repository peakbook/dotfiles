local status, lualine = pcall(require, "lualine")
if (not status) then return end

local mydiagnostics = {
  "diagnostics",
  sources = { "vim_lsp" },
  sections = { "error", "warn", "info", "hint" },
  diagnostics_color = {},
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = { "require('nvim-gps').get_location()" },
    lualine_x = { mydiagnostics },
    lualine_y = { "encoding", "fileformat", "filetype" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { "buffers" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "tabs" }
  },
  extensions = {},
})
