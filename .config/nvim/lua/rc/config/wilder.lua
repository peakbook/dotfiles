require("wilder").setup({
  modes = { ':' },
  next_key = '<C-n>',
  previous_key = '<C-p>',
  accept_key = '<Tab>',
})

require("wilder").set_option('renderer', require("wilder").popupmenu_renderer(
  require("wilder").popupmenu_border_theme({
    highlighter = require("wilder").basic_highlighter(),
    pumblend = 10,
    left = { ' ', require("wilder").popupmenu_devicons() },
    right = { ' ', require("wilder").popupmenu_scrollbar() },
    border = 'rounded',
  })
))
