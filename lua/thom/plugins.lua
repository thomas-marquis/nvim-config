local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-nvim-lsp")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("github/copilot.vim")
	use({
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		requires = {
			{ "nvim-lua/plenary.nvim", "zbirenbaum/copilot.lua" },
		},
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Navigation
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use({ "mg979/vim-visual-multi" })

	-- UI
	use({
		"craftzdog/solarized-osaka.nvim",
	})
	use({ "scottmckendry/cyberdream.nvim" })
	-- use({
	-- 	"svrana/neosolarized.nvim",
	-- 	requires = { "tjdevries/colorbuddy.nvim" },
	-- })
	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("thom.dashboard")
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	-- use({
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	config = function()
	-- 		require("monokai-pro").setup()
	-- 	end,
	-- })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("barbecue").setup()
		end,
	})
	use({ "xiyaowong/transparent.nvim" })

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("RRethy/vim-illuminate")
	use({
		"hedyhli/outline.nvim",
	})
	use({
		"linux-cultist/venv-selector.nvim",
		requires = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		config = function()
			require("venv-selector")
		end,
	})

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- formatting
	use({
		"stevearc/conform.nvim",
		config = function()
			local formatter_config = require("thom.formatter")
			require("conform").setup(formatter_config)
		end,
	})

	-- Tests
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
		},
	})

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Code formatting
	use("tpope/vim-surround")
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup(require("thom.autopairs"))
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("thom.toggleterm")
		end,
	})

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			require("thom.keymaps.git").setup_keymaps()
		end,
	})
	use({ "tpope/vim-fugitive" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
