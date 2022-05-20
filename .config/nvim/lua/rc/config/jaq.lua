local status, jaq = pcall(require, "jaq-nvim")
if (not status) then return end

jaq.setup({
      cmds = {
            default = "float",
            external = {
                  markdown = "glow %",
                  python = "python %",
                  r = "Rscript %",
                  rust = "cargo run %",
                  cpp = "g++ % -o $fileBase && ./$fileBase",
                  c = "gcc % -o $fileBase && ./$fileBase",
                  go = "go run %",
                  julia = "julia %",
                  sh = "sh %",
                  typescript = "deno run %",
                  javascript = "node %",
            },
            internal = {
                  lua = "luafile %",
                  vim = "source %"
            }
      },

      ui = {
            startinsert = false,
            wincmd      = false,
            float       = {
                  border    = "rounded",
                  height    = 0.8,
                  width     = 0.8,
                  x         = 0.5,
                  y         = 0.5,
                  border_hl = "FloatermBorder",
                  float_hl  = "Normal",
                  blend     = 10
            },
            terminal    = {
                  position = "bot",
                  line_no  = false,
                  size     = 10
            },
            quickfix    = {
                  position = "bot",
                  size     = 10
            }
      }
})
