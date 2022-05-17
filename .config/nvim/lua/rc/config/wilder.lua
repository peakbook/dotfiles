local status, wilder = pcall(require, "wilder")
if (not status) then return end

wilder.setup({
  modes = { ':' },
  next_key = '<C-n>',
  previous_key = '<C-p>',
  accept_key = '<Tab>',
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlighter = wilder.basic_highlighter(),
    pumblend = 10,
    left = { ' ', wilder.popupmenu_devicons() },
    right = { ' ', wilder.popupmenu_scrollbar() },
    border = 'rounded',
  })
))
