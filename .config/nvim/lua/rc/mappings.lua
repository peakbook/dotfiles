---------------------------------------------------------------------------------------------------+
-- Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator | Terminal | Lang-Arg |
-- ================================================================================================+
-- map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |    -     |    -     |
-- nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |    -     |    -     |
-- map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |    -     |    -     |
-- imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |    -     |    -     |
-- cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |    -     |    -     |
-- vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |    -     |    -     |
-- xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |    -     |    -     |
-- smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |    -     |    -     |
-- omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |    -     |    -     |
-- tmap / tnoremap  |    -   |   -    |    -    |   -    |   -    |    -     |    @     |    -     |
-- lmap / lnoremap  |    -   |   @    |    @    |   -    |   -    |    -     |    -     |    @     |
---------------------------------------------------------------------------------------------------+

-- utils
local nnoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = silent })
end

local nmap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = false, silent = silent })
end

local xnoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("x", lhs, rhs, { noremap = true, silent = silent })
end

local xmap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("x", lhs, rhs, { noremap = false, silent = silent })
end

local inoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true })
end

local imap = function(lhs, rhs)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = false })
end

local vnoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true })
end

local vmap = function(lhs, rhs)
  vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = false })
end

local tnoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("t", lhs, rhs, { noremap = true, silent = silent })
end

local cmap = function(lhs, rhs)
  vim.api.nvim_set_keymap("c", lhs, rhs, { noremap = false })
end

local smap = function(lhs, rhs)
  vim.api.nvim_set_keymap("s", lhs, rhs, { noremap = false })
end


vim.g.mapleader = " "

-- tab operations
nnoremap("<leader>t", "<Nop>", true)
nnoremap("<leader>tn", ":tabnew<CR>", true)
nnoremap("<leader>tq", ":tabclose<CR>", true)
nnoremap("<leader>to", ":tabonly<CR>", true)
nnoremap("<leader>te", ":tabnew<CR>:terminal<CR>a", true)
nnoremap("<leader>n", ":tabn<CR>", true)
nnoremap("<leader>p", ":tabp<CR>", true)

-- quickrun
nnoremap("<leader>r", ":Jaq<CR>")

-- quickhl
nmap("<leader>m", "<Plug>(quickhl-manual-this)")
xmap("<leader>m", "<Plug>(quickhl-manual-this)")
nmap("<leader>M", "<Plug>(quickhl-manual-reset)")
xmap("<leader>M", "<Plug>(quickhl-manual-reset)")

-- hop
nnoremap("<leader><leader>j", ":HopLineAC<CR>", true)
nnoremap("<leader><leader>k", ":HopLineBC<CR>", true)
nnoremap("<leader><leader>w", ":HopWordAC<CR>", true)
nnoremap("<leader><leader>W", ":HopWordBC<CR>", true)

-- screen up/down
nnoremap("<leader>j", "<C-f>")
nnoremap("<leader>k", "<C-b>")

-- termnial hide
tnoremap("<C-[><C-n>", "<C-\\><C-n>:FloatermToggle<CR>", true)

-- fzf keybinds
nnoremap("<C-u><C-b>", ":Buffers<CR>", true)
nnoremap("<C-u><C-c>", ":History:<CR>", true)
nnoremap("<C-u><C-g>", ":Rg<CR>", true)
nnoremap("<C-u><C-h>", ":History<CR>", true)
nnoremap("<C-u><C-l>", ":Lines<CR>", true)
nnoremap("<C-u><C-m>", ":Marks<CR>", true)
nnoremap("<C-u><C-o>", ":Files<CR>", true)
nnoremap("<C-u><C-r>", ":BTags<CR>", true)
nnoremap("<C-u><C-n>", ":Tags<CR>", true)
nnoremap("<C-u><C-s>", ":History/<CR>", true)
nnoremap("<C-u><C-w>", ":Windows<CR>", true)

-- floaterm
nnoremap("<C-u><C-t>", ":FloatermToggle<CR>", true)
nnoremap("<leader>f", "<Nop>", true)
nnoremap("<leader>ff", ":FloatermNew<CR>", true)
nnoremap("<leader>ft", ":FloatermToggle<CR>", true)
nnoremap("<leader>fn", ":FloatermNext<CR>", true)
nnoremap("<leader>fp", ":FloatermPrev<CR>", true)
nnoremap("<leader>fk", ":FloatermKill<CR>", true)
nnoremap("<leader>fh", ":FloatermHide<CR>", true)
nnoremap("<leader>fs", ":FloatermShow<CR>", true)
vim.cmd("command! Vifm FloatermNew --title= vifm -c only")
nnoremap("<C-u><C-v>", ":Vifm<CR>")

-- vim-expand-region
vmap("v", "<Plug>(expand_region_expand)")
vmap("<C-v>", "<Plug>(expand_region_shrink)")

-- searchbox
nnoremap("<leader>ss", ":SearchBoxIncSearch<CR>", true)
nnoremap("<leader>sr", ":SearchBoxReplace confirm=menu<CR>", true)

-- vimtable
nnoremap("<leader>ta", ":tableModeToggle<CR>")

-- lsp
nnoremap("<leader>ld", ":LspDefinition<CR>", true)
nnoremap("<leader>lf", ":LspDocumentFormat<CR>", true)
nnoremap("<leader>lh", ":LspHover<CR>", true)
nnoremap("<leader>lr", ":LspReferences<CR>", true)

-- yank
nnoremap("<C-u><C-y>", ":YankHistoryRgPaste<CR>", true)

nmap("p", "<Plug>(yankround-p)")
xmap("p", "<Plug>(yankround-p)")
nmap("P", "<Plug>(yankround-P)")
nmap("gp", "<Plug>(yankround-gp)")
xmap("gp", "<Plug>(yankround-gp)")
nmap("gP", "<Plug>(yankround-gP)")
nmap("<C-p>", "<Plug>(yankround-prev)")
nmap("<C-n>", "<Plug>(yankround-next)")

-- cutlass
nnoremap("m", "d")
xnoremap("m", "d")
nnoremap("mm", "dd")
nnoremap("M", "D")

-- easyalign
xmap("ga", "<Plug>(EasyAlign)")

-- lsp
nnoremap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", true)
nnoremap("<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", true)
nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", true)
--nnoremap("<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", true)
nnoremap("<leader>lh", "<cmd>Lspsaga hover_doc<CR>", true)
nnoremap("<leader>lg", "<cmd>Lspsaga show_cursor_diagnostics<CR>", true)
nnoremap("<leader>la", "<cmd>Lspsaga code_action<CR>", true)
nnoremap("<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", true)
nnoremap("<leader>ltd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", true)
nnoremap("<leader>lrf", "<cmd>lua vim.lsp.buf.references()<CR>", true)
nnoremap("<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", true)
nnoremap("<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)



-- snippets
imap("<C-k>", "<Plug>(deoppet_expand)")
imap("<C-l>", "<Plug>(deoppet_jump_forward)")
smap("<C-l>", "<Plug>(deoppet_jump_forward)")

-- skk
imap("<C-j>", "<Plug>(skkeleton-toggle)")
cmap("<C-j>", "<Plug>(skkeleton-toggle)")

-- dap
nnoremap("<leader>d", "<Nop>", true)
nnoremap("<leader>dc", ":lua require'dap'.continue()<CR>", true)
nnoremap("<leader>du", ":lua require'dapui'.toggle()<CR>", true)
nnoremap("<leader>ds", ":lua require'dap'.step_over()<CR>", true)
nnoremap("<leader>di", ":lua require'dap'.step_into()<CR>", true)
nnoremap("<leader>do", ":lua require'dap'.step_out()<CR>", true)
nnoremap("<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", true)
nnoremap("<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", true)
nnoremap("<leader>dp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", true)
nnoremap("<leader>dr", ":lua require'dap'.repl.open()<CR>", true)
nnoremap("<leader>dl", ":lua require'dap'.run_last()<CR>", true)

-- grammer
nnoremap("<leader>gc", ":GrammarousCheck<CR>", true)
nnoremap("<leader>gr", ":GrammarousReset<CR>", true)

-- others
--vim.api.nvim_set_keymap("", "<C-j>", ":cn<CR>", { noremap = true })
--vim.api.nvim_set_keymap("", "<C-p>", ":cp<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<S-h>", "^", { noremap = true })
vim.api.nvim_set_keymap("", "<S-l>", "$", { noremap = true })
xnoremap("p", "\"_dP", true)

nnoremap("ZZ", "<Nop>")
nnoremap("ZQ", "<Nop>")
nnoremap("<leader>/", ":nohl<CR>", true)