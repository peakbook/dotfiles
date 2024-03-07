require("lazy").setup({
	{ "MunifTanjim/nui.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "VonHeikemen/searchbox.nvim" },
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
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("trouble").setup()
		end,
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
		},
	},
	{ "dhruvasagar/vim-table-mode" },
	{ "itchyny/calendar.vim" },
	{ "jceb/vim-hier" },
	{ "jpalardy/vim-slime" },
	{ "junegunn/fzf" },
	{
		"junegunn/fzf.vim",
		config = function()
			require("rc/config/fzf")
		end,
	},
	{ "junegunn/vim-easy-align" },
	{ "svermeulen/vim-cutlass" },
	{ "kana/vim-grex" },
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
	{ "t9md/vim-quickhl" },
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
	},
	{ "junegunn/goyo.vim" },
	{ "terryma/vim-expand-region" },
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
	{ "Shougo/ddu.vim" },
	{ "Shougo/pum.vim" },
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
	},
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
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
	},
	{
		"gbprod/yanky.nvim",
		config = function()
			require("rc/config/yanky")
		end,
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
