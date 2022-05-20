local status, lualine = pcall(require, "lualine")
if (not status) then return end

local myfilename = {
  "filename",
  path = 0,
  symbols = {
    modified = " +",
    readonly = " ",
    unnamed = "[NoName]",
  }
}
local mydiagnostics = {
  "diagnostics",
  sources = { "nvim_lsp" },
  sections = { "error", "warn", "info", "hint" },
  diagnostics_color = {},
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
}
local mydiff = {
  "diff",
  symbols = { added = " ", modified = "🔨", removed = " " }
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
    lualine_b = { "branch", mydiff },
    lualine_c = { "require('nvim-gps').get_location()" },
    lualine_x = { mydiagnostics },
    lualine_y = { "encoding", "fileformat", "filetype" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = { myfilename },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { "tabs" },
    lualine_b = {},
    lualine_c = { myfilename },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {},
})
