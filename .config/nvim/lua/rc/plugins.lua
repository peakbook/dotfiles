require("lazy").setup({
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "VonHeikemen/searchbox.nvim" },
  { "vim-denops/denops.vim" },
  {
    "Shougo/ddc-matcher_head",
    dependencies = "Shougo/ddc.vim",
  },
  {
    "Shougo/ddc-sorter_rank",
    dependencies = "Shougo/ddc.vim",
  },
  {
    "Shougo/ddc-around",
    dependencies = "Shougo/ddc.vim",
  },
  {
    "Shougo/ddu-kind-file",
    dependencies = "Shougo/ddu.vim",
  },
  {
    "Shougo/ddu-ui-ff",
    dependencies = "Shougo/ddu.vim",
  },
  {
    "Shougo/ddc-ui-native",
    dependencies = "Shougo/ddu.vim",
  },
  {
    "LumaKernel/ddc-file",
    dependencies = "Shougo/ddc.vim",
  },
  {
    "matsui54/ddc-dictionary",
    dependencies = "Shougo/ddc.vim",
  },
  {
    "Shougo/ddc-source-lsp",
    dependencies = "Shougo/ddc.vim",
  },
  {
    "matsui54/denops-signature_help",
    dependencies = "vim-denops/denops.vim",
    config = function() require("rc/config/denops-signature_help") end
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    after = { "mason.nvim" },
    config = function() require("rc/config/nvim-lspconfig") end
  },
  {
    "Shougo/ddc.vim",
    dependencies = "vim-denops/denops.vim",
    config = function() require("rc/config/ddc") end
  },
  {
    "tami5/lspsaga.nvim",
    config = function() require("rc/config/lspsaga") end
  },
  {
    "folke/trouble.nvim",
    config = function() require("trouble").setup() end
  },
  {
    "folke/lsp-colors.nvim",
    config = function() require("lsp-colors").setup() end
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function() require("fidget").setup() end
  },
  {
    "neovim-stuff/null-ls.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("rc/config/null-ls") end
  },
  {
    "Shougo/deoppet.nvim",
    --run = ":UpdateRemotePlugins",
    -- dependencies = "rcarriga/nvim-notify",
    config = function() require("rc/config/deoppet") end
  },
  { "Shougo/neosnippet-snippets" },
  {
    "nvim-treesitter/nvim-treesitter",
    --run = ':TSUpdate',
    event = 'BufEnter',
    config = function() require("rc/config/nvim-treesitter") end
  },
  {
    "Shougo/deoppet.nvim",
    --run = ":UpdateRemotePlugins",
    config = function() require("rc/config/deoppet") end
  },
  "Shougo/neosnippet-snippets",
  "honza/vim-snippets",
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "yioneko/nvim-yati",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },

  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function() require("nvim-navic").setup({lsp={auto_attach=true}}) end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "gruvbox-material.nvim"
    },
    config = function() require("rc/config/lualine") end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    config = function() require("nvim-web-devicons").setup() end
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function() require("rc/config/gitsigns") end
  },

  {
    "ahmedkhalf/project.nvim",
    event = "BufWinEnter",
    config = function() require("rc/config/project") end
  },
  { "dhruvasagar/vim-table-mode" },
  { "itchyny/calendar.vim" },
  { "jceb/vim-hier" },
  { "jpalardy/vim-slime" },
  { "junegunn/fzf" },
  {
    "junegunn/fzf.vim",
    config = function() require("rc/config/fzf") end
  },
  { "junegunn/vim-easy-align" },
  { "svermeulen/vim-cutlass" },
  { "kana/vim-grex" },
  {
    "kana/vim-submode",
    config = function() require("rc/config/submode") end
  },
  {
    "lervag/vimtex",
    ft = { "tex", "latex" }
  },
  { "mattn/learn-vimscript" },
  { "maverickg/stan.vim" },
  { "osyo-manga/vim-over" },
  { "rhysd/vim-grammarous" },
  { "simrat39/rust-tools.nvim" },
  { "scrooloose/nerdcommenter" },
  { "shemerey/vim-project" },
  { "t9md/vim-quickhl" },
  { "thinca/vim-qfreplace" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-surround" },
  { "wtsnjp/vim-expl3" },
  { "luochen1990/rainbow" },
  { "SkyLeach/pudb.vim" },
  {
    "voldikss/vim-floaterm",
    after = "gruvbox-material.nvim",
    config = function() require("rc/config/floaterm") end
  },
  { "junegunn/goyo.vim" },
  { "terryma/vim-expand-region" },
  { "rbgrouleff/bclose.vim" },
  { "iberianpig/tig-explorer.vim" },
  {
    "nvim-telescope/telescope.nvim",
    config = function() require("telescope").load_extension("notify") end
  },
  {
    "rcarriga/nvim-notify",
    config = function() require("rc/config/nvim-notify") end
  },
  {
    "petertriho/nvim-scrollbar",
    after = "nvim-hlslens",
    config = function() require("rc/config/nvim-scrollbar") end
  },
  {
    "akinsho/toggleterm.nvim",
    config = function() require("toggleterm").setup() end
  },
  { "Shougo/ddu.vim" },
  { "Shougo/pum.vim" },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "rmagatti/auto-session",
    config = function() require("auto-session").setup({ auto_save_enabled = false }) end
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function() require("hlslens").setup({ calm_down = true, nearest_only = true }) end
  },
  {
    "karb94/neoscroll.nvim",
    config = function() require("neoscroll").setup({ easing_function = "sine" }) end
  },
  {
    "phaazon/hop.nvim",
    config = function() require("hop").setup() end
  },
  {
    "vim-skk/denops-skkeleton.vim",
    dependencies = "vim-denops/denops.vim",
    config = function() require("rc/config/skkeleton") end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function() require("rc/config/dap-ui") end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function() require('nvim-dap-virtual-text').setup() end
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function() require('dap-python').setup('/usr/bin/python') end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
    },
    config = function() require("rc/config/dap") end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function() require("telescope").load_extension("dap") end
  },
  { "antoinemadec/FixCursorHold.nvim" },
  {
    "liuchengxu/vim-which-key",
    on = { "WhichKey", "WhichKey!" }
  },
  { "deris/vim-rengbang" },
  { "AndrewRadev/linediff.vim" },
  {
    "stevearc/overseer.nvim",
    config = function() require("rc/config/overseer") end
  },
  { "stevearc/dressing.nvim" },

  -- quickrun
  {
    "is0n/jaq-nvim",
    config = function() require("rc/config/jaq") end
  },

  -- ui
  {
    "gelguy/wilder.nvim",
    config = function() require("rc/config/wilder") end
  },

  -- yank
  {
    "gbprod/yanky.nvim",
    config = function() require("rc/config/yanky") end
  },
  { "haya14busa/vim-asterisk" },

  -- colorscheme
  {
    "WIttyJudge/gruvbox-material.nvim",
    config = function() require("gruvbox-material").setup() end
  },
  {
    "flazz/vim-colorschemes",
    lazy = true
  },

  { "tpope/vim-repeat" },
  {
    "danymat/neogen",
    config = function() require('neogen').setup {} end,
    dependencies = "nvim-treesitter"
  },
  {
    "folke/todo-comments.nvim",
    after = "gruvbox-material.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("rc/config/todo-comments") end
  },
  {
    "klen/nvim-config-local",
    config = function() require("rc/config/nvim-config-local") end
  },
  {
    "terrortylor/nvim-comment",
    config = function() require("nvim_comment").setup() end
  }
})
