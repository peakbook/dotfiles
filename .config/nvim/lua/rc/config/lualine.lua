local myfilename = {
  "filename",
  path = 4,
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
  symbols = { error = " ", warn = " ", info = " " , hint = " " },
}
local mydiff = {
  "diff",
  symbols = { added = " ", modified = "🔨", removed = " " }
}
local navic = {
  "navic",
  color_correction = nil,
  navic_opts = nil
}

require("lualine").setup({
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
    lualine_c = {},
    lualine_x = { mydiagnostics },
    lualine_y = { "encoding", "fileformat", "filetype" },
    lualine_z = { "selectioncount", "location" },
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
    lualine_b = { myfilename },
    lualine_c = { navic },
    lualine_x = { "overseer" },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {},
})
