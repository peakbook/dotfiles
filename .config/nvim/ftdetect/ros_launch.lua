vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.launch",
  callback = function()
    vim.bo.filetype = "xml"
  end,
  once = false,
})
