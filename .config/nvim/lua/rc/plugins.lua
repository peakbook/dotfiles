require("lazy").setup({
	{ "MunifTanjim/nui.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{
		"VonHeikemen/searchbox.nvim",
		keys = {
			{ "<leader>ss", "<cmd>SearchBoxIncSearch<cr>" },
			{ "<leader>sr", "<cmd>SearchBoxReplace confirm=menu<cr>" },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("rc/config/nvim-cmp")
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "dcampos/cmp-snippy" },
			{ "dcampos/nvim-snippy" },
			{ "uga-rosa/cmp-dictionary" },
			{ "onsails/lspkind.nvim" },
			{ "petertriho/cmp-git" },
		},
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("rc/config/nvim-lspconfig")
		end,
		lazy = false,
		keys = {
			{ "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>" },
			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format({async=true})<cr>" },
			{ "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>" },
			{ "<leader>ltd", "<cmd>lua vim.lsp.buf.type_definition()<cr>" },
			{ "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<cr>" },
			{ "<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<cr>" },
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("rc/config/lspsaga")
		end,
		keys = {
			{ "<leader>ld", "<cmd>Lspsaga goto_definition<cr>" },
			{ "<leader>lr", "<cmd>Lspsaga finder<cr>" },
			{ "<leader>lh", "<cmd>Lspsaga hover_doc<cr>" },
			{ "<leader>lg", "<cmd>Lspsaga show_cursor_diagnostics<cr>" },
			{ "<leader>la", "<cmd>Lspsaga code_action<cr>" },
			{ "<leader>lo", "<cmd>Lspsaga outline<cr>" },
			{ "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
			{ "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
		},
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("trouble").setup()
		end,
		keys = {
			{ "<leader>ltt", "<cmd>TroubleToggle<cr>" },
		},
	},
	{
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("rc/config/fidget")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("rc/config/null-ls")
		end,
	},
	{ "Shougo/neosnippet-snippets" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufEnter",
		config = function()
			require("rc/config/nvim-treesitter")
		end,
	},
	"Shougo/neosnippet-snippets",
	"honza/vim-snippets",
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"yioneko/nvim-yati",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("nvim-navic").setup({ lsp = { auto_attach = true } })
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("rc/config/lualine")
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("rc/config/gitsigns")
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		event = "BufWinEnter",
		config = function()
			require("rc/config/project")
		end,
		keys = {
			{ "<leader>cd", "<cmd>ProjectRoot<cr>" },
			{ "<C-u><C-p>", "<cmd>Telescope projects<cr>" },
		},
	},
	{
		"dhruvasagar/vim-table-mode",
		keys = {
			{ "<leader>ta", "<cmd>TableModeToggle<cr>" },
		},
	},
	{ "itchyny/calendar.vim" },
	{ "jpalardy/vim-slime" },
	{ "junegunn/fzf" },
	{
		"junegunn/fzf.vim",
		config = function()
			require("rc/config/fzf")
		end,
		keys = {
			{ "<C-u>", "<Nop>" },
			{ "<C-u><C-b>", "<cmd>Buffers<cr>" },
			{ "<C-u><C-c>", "<cmd>History:<cr>" },
			{ "<C-u><C-g>", "<cmd>Rg<cr>" },
			{ "<C-u><C-h>", "<cmd>History<cr>" },
			{ "<C-u><C-l>", "<cmd>Lines<cr>" },
			{ "<C-u><C-m>", "<cmd>Marks<cr>" },
			{ "<C-u><C-o>", "<cmd>Files<cr>" },
			{ "<C-u><C-r>", "<cmd>BTags<cr>" },
			{ "<C-u><C-n>", "<cmd>Tags<cr>" },
			{ "<C-u><C-s>", "<cmd>History/<cr>" },
			{ "<C-u><C-w>", "<cmd>Windows<cr>" },
		},
	},
	{
		"junegunn/vim-easy-align",
		keys = {
			{ "ga", "<Plug>(EasyAlign)", mode = "x" },
		},
	},
	{
		"svermeulen/vim-cutlass",
		keys = {
			{ "m", "d", mode = { "n", "x" } },
			{ "mm", "dd", mode = { "n" } },
			{ "M", "Dd", mode = { "n" } },
		},
	},
	{
		"kana/vim-grex",
		keys = {
			{ "<leader>gd", "<cmd>Gred" },
			{ "<leader>gy", "<cmd>Grey" },
		},
	},
	{
		"kana/vim-submode",
		config = function()
			require("rc/config/submode")
		end,
	},
	{
		"lervag/vimtex",
		ft = { "tex", "latex" },
	},
	{ "mattn/learn-vimscript" },
	{ "maverickg/stan.vim" },
	{ "osyo-manga/vim-over" },
	{ "simrat39/rust-tools.nvim" },
	{ "scrooloose/nerdcommenter" },
	{
		"t9md/vim-quickhl",
		keys = {
			{ "<leader>m", "<Plug>(quickhl-manual-this)", mode = { "n", "x" } },
			{ "<leader>M", "<Plug>(quickhl-manual-reset)", mode = { "n", "x" } },
		},
	},
	{ "thinca/vim-qfreplace" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-surround" },
	{ "wtsnjp/vim-expl3" },
	{ "luochen1990/rainbow" },
	{ "SkyLeach/pudb.vim" },
	{
		"voldikss/vim-floaterm",
		config = function()
			require("rc/config/floaterm")
		end,
		keys = {
			{ "<C-[><C-n>", "<C-\\><C-n>:FloatermToggle<cr>", mode = "t" },
			{ "<C-u><C-t>", "<cmd>FloatermToggle<cr>" },
			{ "<leader>f", "<Nop>" },
			{ "<leader>ff", "<cmd>FloatermNew<cr>" },
			{ "<leader>ft", "<cmd>FloatermToggle<cr>" },
			{ "<leader>fn", "<cmd>FloatermNext<cr>" },
			{ "<leader>fp", "<cmd>FloatermPrev<cr>" },
			{ "<leader>fk", "<cmd>FloatermKill<cr>" },
			{ "<leader>fh", "<cmd>FloatermHide<cr>" },
			{ "<leader>fs", "<cmd>FloatermShow<cr>" },
			{ "<C-u><C-f>", "<cmd>FloatermNew --title= vifm -c only<cr>" },
		},
	},
	{ "junegunn/goyo.vim" },
	{
		"terryma/vim-expand-region",
		keys = {
			{ "v", "<Plug>(expand_region_expand)", mode = "v" },
			{ "<C-v>", "<Plug>(expand_region_shrink)", mode = "v" },
		},
	},
	{ "rbgrouleff/bclose.vim" },
	{ "iberianpig/tig-explorer.vim" },
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope")
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		dependencies = "kevinhwang91/nvim-hlslens",
		config = function()
			require("rc/config/nvim-scrollbar")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({ auto_save_enabled = false })
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup({ calm_down = true, nearest_only = true })
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({ easing_function = "sine" })
		end,
		keys = {
			{ "<leader>j", "<cmd>lua require('neoscroll').scroll( vim.api.nvim_win_get_height(0), true, 550)<cr>" },
			{ "<leader>k", "<cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), true, 550)<cr>" },
		},
	},
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		keys = {
			{ "<leader><leader>j", "<cmd>HopLineAC<cr>" },
			{ "<leader><leader>k", "<cmd>HopLineBC<cr>" },
			{ "<leader><leader>w", "<cmd>HopWordAC<cr>" },
			{ "<leader><leader>W", "<cmd>HopWordBC<cr>" },
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("rc/config/dap-ui")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("/usr/bin/python")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			require("rc/config/dap")
		end,
		keys = {
			{ "<leader>d", "<Nop>" },
			{ "<leader>dl", "<cmd>lua require'dap.ext.vscode'.load_launchjs()<cr>" },
			{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>" },
			{ "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>" },
			{ "<leader>ds", "<cmd>lua require'dap'.step_over()<cr>" },
			{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>" },
			{ "<leader>do", "<cmd>lua require'dap'.step_out()<cr>" },
			{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>" },
			{ "<f5>", "<cmd>lua require'dap'.continue()<cr>" },
			{ "<f8>", "<cmd>lua require'dapui'.toggle()<cr>" },
			{ "<f10>", "<cmd>lua require'dap'.step_over()<cr>:lua require('neoscroll').zz(250)<cr>" },
			{ "<f11>", "<cmd>lua require'dap'.step_into()<cr>" },
			{ "<f12>", "<cmd>lua require'dap'.step_out()<cr>" },
			{ "<f9>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>" },
			{ "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>" },
			{ "<leader>dp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>" },
			{ "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>" },
			{ "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>" },
			{ "<leader>dv", "<cmd>lua require('dap.ext.vscode').load_launchjs(nil, {cppdbg = {'c', 'cpp'}})<cr>" },
		},
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		config = function()
			require("telescope").load_extension("dap")
		end,
	},
	{ "antoinemadec/FixCursorHold.nvim" },
	{
		"liuchengxu/vim-which-key",
		on = { "WhichKey", "WhichKey!" },
	},
	{ "deris/vim-rengbang" },
	{ "AndrewRadev/linediff.vim" },
	{
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup()
		end,
		keys = {
			{ "<leader>tr", "<cmd>OverseerRun<cr>" },
			{ "<leader>tg", "<cmd>OverseerToggle<cr>" },
		},
		lazy = false,
	},
	{ "stevearc/dressing.nvim" },
	{
		"is0n/jaq-nvim",
		config = function()
			require("rc/config/jaq")
		end,
		keys = {
			{ "<leader>r", "<cmd>Jaq<cr>" },
		},
	},
	{
		"gbprod/yanky.nvim",
		config = function()
			require("rc/config/yanky")
		end,
		keys = {
			{ "p", "<Plug>(YankyPutAfter)" },
			{ "P", "<Plug>(YankyPutBefore)" },
			{ "gp", "<Plug>(YankyGPutAfter)" },
			{ "gP", "<Plug>(YankyGPutBefore)" },
			{ "<C-p>", "<Plug>(YankyCycleForward)" },
			{ "<C-n>", "<Plug>(YankyCycleBackward)" },
			{ "<C-u><C-y>", "<cmd>YankyRingHistory<cr>" },
		},
	},
	{
		"rapan931/lasterisk.nvim",
		keys = {
			{
				"*",
				function()
					require("lasterisk").search({ silent = true })
				end,
				mode = "n",
			},
			{
				"g*",
				function()
					require("lasterisk").search({ is_whole = false, silent = true })
				end,
				mode = { "n", "x" },
			},
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("rc/config/gruvbox")
		end,
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "tpope/vim-repeat" },
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
		dependencies = "nvim-treesitter",
		keys = {
			{ "<leader>lnf", "<cmd>lua require('neogen').generate({ type = 'func' })<cr>" },
			{ "<leader>lnc", "<cmd>lua require('neogen').generate({ type = 'class' })<cr>" },
			{ "<leader>lnt", "<cmd>lua require('neogen').generate({ type = 'type' })<cr>" },
			{ "<leader>lni", "<cmd>lua require('neogen').generate({ type = 'file' })<cr>" },
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("rc/config/todo-comments")
		end,
	},
	{
		"klen/nvim-config-local",
		config = function()
			require("rc/config/nvim-config-local")
		end,
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
		keys = {
			{ "<leader>c<leader>", "<cmd>CommentToggle<cr>", mode = { "n", "v" } },
		},
	},
	{
		"yorickpeterse/nvim-window",
		keys = {
			{ "-", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
		},
		config = true,
	},
	-- { "TabbyML/vim-tabby" },
})
