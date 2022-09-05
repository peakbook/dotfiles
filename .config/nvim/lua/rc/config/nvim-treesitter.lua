local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup({
    ensure_installed = {
      'bash',
      'bibtex',
      'c',
      'cmake',
      'comment',
      'cpp',
      'dockerfile',
      'go',
      'help',
      'html',
      'http',
      'javascript',
      'json',
      'latex',
      'llvm',
      'lua',
      'make',
      'ninja',
      'python',
      'r',
      'regex',
      'rust',
      'julia',
      'toml',
      'typescript',
      'vim',
      'yaml',
      'vue',
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1000,
    },
    autotag = {
      enable = true,
    },
    yati = {
      enable = true
    },
  })
vim.cmd([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  ]])
