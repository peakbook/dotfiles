vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use("MunifTanjim/nui.nvim")
  use("nvim-lua/plenary.nvim")
  use("VonHeikemen/searchbox.nvim")
  use({ "vim-denops/denops.vim" })
  use({ "Shougo/ddc-matcher_head" })
  use({ "Shougo/ddc-sorter_rank" })
  use({ "Shougo/ddc-around" })
  use({ "Shougo/ddu-kind-file" })
  use({ "Shougo/ddu-ui-ff" })
  use({ "Shougo/ddc-ui-native" })
  use({ "LumaKernel/ddc-file" })
  use({ "matsui54/ddc-dictionary" })
  use({ "Shougo/ddc-nvim-lsp" })
  use({ "matsui54/denops-signature_help", config = function() require("rc/config/denops-signature_help") end })
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({ "neovim/nvim-lspconfig", after = { "mason.nvim" }, config = function() require("rc/config/nvim-lspconfig") end })
  use({ "Shougo/ddc.vim", config = function() require("rc/config/ddc") end })
  use({ "tami5/lspsaga.nvim", config = function() require("rc/config/lspsaga") end })
  use({ "folke/trouble.nvim", config = function() require("trouble").setup() end })
  use({ "folke/lsp-colors.nvim", config = function() require("lsp-colors").setup() end })
  use({ "j-hui/fidget.nvim", config = function() require("fidget").setup() end })
  use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim",
    config = function() require("rc/config/null-ls") end })

  use({ "Shougo/deoppet.nvim",
    run = ":UpdateRemotePlugins",
    config = function() require("rc/config/deoppet") end
  })
  use("Shougo/neosnippet-snippets")
  use("honza/vim-snippets")

  use({ "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    event = 'BufEnter',
    config = function() require("rc/config/nvim-treesitter") end,
  })
  use({ "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({ "yioneko/nvim-yati",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({ "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use({ "SmiteshP/nvim-gps",
    after = "nvim-treesitter",
    config = function() require("nvim-gps").setup() end,
  })

  use({ "nvim-lualine/lualine.nvim",
    after = "gruvbox-material.nvim",
    requires = {
      { "kyazdani42/nvim-web-devicons", config = function() require("nvim-web-devicons").setup() end }
    },
    config = function() require("rc/config/lualine") end,
  })

  use({ "lewis6991/gitsigns.nvim", config = function() require("rc/config/gitsigns") end })
  use({ "ahmedkhalf/project.nvim", event = "BufWinEnter", config = function() require("rc/config/project") end })
  --use({ "notjedi/nvim-rooter.lua", config = function() require "nvim-rooter".setup() end })
  use("dhruvasagar/vim-table-mode")
  use("itchyny/calendar.vim")
  use("jceb/vim-hier")
  use("jpalardy/vim-slime")
  use({ "junegunn/fzf.vim", config = function() require("rc/config/fzf") end })
  use("junegunn/vim-easy-align")
  use("svermeulen/vim-cutlass")
  use("kana/vim-grex")
  use({ "kana/vim-submode", config = function() require("rc/config/submode") end })
  use({ "lervag/vimtex", ft = { "tex", "latex" } })
  use("mattn/learn-vimscript")
  use("maverickg/stan.vim")
  use("osyo-manga/vim-over")
  use("rhysd/vim-grammarous")
  use("simrat39/rust-tools.nvim")
  use("scrooloose/nerdcommenter")
  use("shemerey/vim-project")
  use("t9md/vim-quickhl")
  use("thinca/vim-qfreplace")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("vim-jp/vimdoc-ja")
  use("wtsnjp/vim-expl3")
  use("luochen1990/rainbow")
  use("SkyLeach/pudb.vim")
  use("majutsushi/tagbar")
  use({ "voldikss/vim-floaterm",
    after = "gruvbox-material.nvim",
    config = function() require("rc/config/floaterm") end })
  use("junegunn/goyo.vim")
  use("terryma/vim-expand-region")
  use("rbgrouleff/bclose.vim")
  use("iberianpig/tig-explorer.vim")
  use({ "nvim-telescope/telescope.nvim", config = function() require("telescope").load_extension("notify") end })
  use({ "rcarriga/nvim-notify", config = function() vim.notify = require("notify") end })
  use({ "petertriho/nvim-scrollbar",
    after = "nvim-hlslens",
    config = function() require("rc/config/nvim-scrollbar") end
  })
  use({ "akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end })
  use({ "Shougo/ddu.vim" })
  use({ "Shougo/pum.vim" })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ "rmagatti/auto-session", config = function() require("auto-session").setup({ auto_save_enabled = false }) end })
  use({ "kevinhwang91/nvim-hlslens",
    config = function() require("hlslens").setup({ calm_down = true, nearest_only = true }) end })
  use({ "karb94/neoscroll.nvim", config = function() require("neoscroll").setup({ easing_function = "sine" }) end })
  use({ "phaazon/hop.nvim", config = function() require("hop").setup() end })
  use({ "vim-skk/denops-skkeleton.vim", config = function() require("rc/config/skkeleton") end })
  use({ "mfussenegger/nvim-dap",
    requires = {
      { "rcarriga/nvim-dap-ui", config = function() require("rc/config/dap-ui") end },
      { "theHamsta/nvim-dap-virtual-text", config = function() require('nvim-dap-virtual-text').setup() end },
      { "mfussenegger/nvim-dap-python", config = function() require('dap-python').setup('/usr/bin/python') end },
    },
    config = function() require("rc/config/dap") end,
  })
  use({ "nvim-telescope/telescope-dap.nvim", config = function() require("telescope").load_extension("dap") end })
  use("antoinemadec/FixCursorHold.nvim")
  use({ "liuchengxu/vim-which-key", on = { "WhichKey", "WhichKey!" } })
  use("deris/vim-rengbang")
  use("AndrewRadev/linediff.vim")
  use({ "stevearc/overseer.nvim", config = function() require("rc/config/overseer") end })
  use({ "stevearc/dressing.nvim" })

  -- quickrun
  use({ "is0n/jaq-nvim", config = function() require("rc/config/jaq") end })

  -- ui
  use({ "gelguy/wilder.nvim", config = function() require("rc/config/wilder") end })

  -- yank
  use({ "gbprod/yanky.nvim", config = function() require("rc/config/yanky") end })
  use("haya14busa/vim-asterisk")

  -- colorscheme
  use({ "WIttyJudge/gruvbox-material.nvim", config = function() require("gruvbox-material").setup() end })
  --use({"EdenEast/nightfox.nvim", config = function() require("nightfox").setup() end})
  use({ "flazz/vim-colorschemes", opt = true })

  use({ "tpope/vim-repeat" })
  use({ "danymat/neogen", config = function() require('neogen').setup {} end, requires = "nvim-treesitter" })
  use({ "folke/todo-comments.nvim",
    after = "gruvbox-material.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("rc/config/todo-comments") end })
end)
