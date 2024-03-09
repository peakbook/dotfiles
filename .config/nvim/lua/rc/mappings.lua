-- tab operations
vim.api.nvim_set_keymap("n", "<leader>t", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>tabnew<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tq", "<cmd>tabclose<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>tabonly<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>te", "<cmd>tabnew<cr>:terminal<cr>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>tabn<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>tabp<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("", "<S-h>", "^", { noremap = true })
vim.api.nvim_set_keymap("", "<S-l>", "$", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>nohl<cr>", { noremap = true })

-- replace currently selected text with default register without yanking it
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true })

vim.api.nvim_set_keymap("n", "ZZ", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "ZQ", "<Nop>", { noremap = true })
