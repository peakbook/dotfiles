local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) == 1 then
  vim.fn.system({
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
  })
end

--vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use("vim-denops/denops.vim")
  use({ "Shougo/ddc-matcher_head" })
  use({ "Shougo/ddc-sorter_rank" })
  use({ "Shougo/ddc-around" })
  use({ "matsui54/ddc-dictionary" })
  --use({ "shun/ddc-vim-lsp" })
  --use({ "prabirshrestha/vim-lsp", config = function() require("rc/config/vim-lsp") end })
  --use({ "mattn/vim-lsp-settings", config = function() require("rc/config/vim-lsp-settings") end })
  use({ "Shougo/ddc-nvim-lsp" })
  use({ "williamboman/nvim-lsp-installer",
    { "neovim/nvim-lspconfig", config = function() require("rc/config/nvim-lspconfig") end }
  })
  use({ "Shougo/ddc.vim", config = function() require("rc/config/ddc") end })
  use({ "tami5/lspsaga.nvim", config = function() require("rc/config/lspsaga") end })

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

  use({ "airblade/vim-gitgutter", config = function() require("rc/config/gitgutter") end })
  use("airblade/vim-rooter")
  use("dhruvasagar/vim-table-mode")
  use("h1mesuke/vim-alignta")
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
  use("posva/vim-vue")
  use("rhysd/vim-grammarous")
  use("rust-lang/rust.vim")
  use("scrooloose/nerdcommenter")
  use("shemerey/vim-project")
  use("t9md/vim-quickhl")
  use("thinca/vim-qfreplace")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("vim-jp/vimdoc-ja")
  use("sheerun/vim-polyglot")
  use("wtsnjp/vim-expl3")
  use("luochen1990/rainbow")
  use("SkyLeach/pudb.vim")
  use("majutsushi/tagbar")
  use({ "voldikss/vim-floaterm", config = function() require("rc/config/floaterm") end })
  use("junegunn/goyo.vim")
  use("terryma/vim-expand-region")
  use("MunifTanjim/nui.nvim")
  use("VonHeikemen/searchbox.nvim")
  use("rbgrouleff/bclose.vim")
  use("iberianpig/tig-explorer.vim")
  use({ "nvim-telescope/telescope.nvim", config = function() require("telescope").load_extension("notify") end })
  use({ "rcarriga/nvim-notify", config = function() vim.notify = require("notify") end })
  use("nvim-lua/plenary.nvim")
  use({ "petertriho/nvim-scrollbar", config = function() require("rc/config/nvim-scrollbar") end })
  use("akinsho/toggleterm.nvim")
  use("Shougo/ddu.vim")
  use("Shougo/pum.vim")
  use("lukas-reineke/indent-blankline.nvim")
  use({ "rmagatti/auto-session", config = function() require("auto-session").setup({ auto_save_enabled = false }) end })
  use({ "kevinhwang91/nvim-hlslens", config = function() require("hlslens").setup({ calm_down = true, nearest_only = true }) end })
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
  use("skanehira/denops-gh.vim")
  use("antoinemadec/FixCursorHold.nvim")
  use({ "liuchengxu/vim-which-key", on = { "WhichKey", "WhichKey!" } })

  -- quickrun
  use({ "is0n/jaq-nvim", config = function() require("rc/config/jaq") end })

  -- ui
  use({ "gelguy/wilder.nvim", config = function() require("rc/config/wilder") end })

  -- yank
  use("yazgoo/yank-history")
  use({ "LeafCage/yankround.vim", config = function() require("rc/config/yankround") end })

  -- colorscheme
  use({ "WIttyJudge/gruvbox-material.nvim", config = function() require("gruvbox-material").setup() end })
  use({ "flazz/vim-colorschemes", opt = true })
end)
