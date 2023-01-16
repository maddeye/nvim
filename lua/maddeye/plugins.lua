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

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Teleskop
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Colorscheme
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- Text manipulation
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")

	-- File explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			-- Snippet Collection (Optional)
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- VSCode like icons for Autocompletion
	use("onsails/lspkind.nvim")

	-- Enhanced lsp ui
	use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	-- Autopairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "right_align",
					delay = 100,
				},
			})
		end,
	})

	-- Better git log display
	use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })

	use({ "christoomey/vim-conflicted", requires = "tpope/vim-fugitive", cmd = { "Conflicted" } })

	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "User InGitRepo",
		config = [[require('config.git-linker')]],
	})

	-- harpoon for file jumping
	use("ThePrimeagen/harpoon")

	-- For Windows and Mac, we can open an URL in the browser. For Linux, it may
	-- not be possible since we maybe in a server which disables GUI.
	if vim.g.is_win or vim.g.is_mac then
		-- open URL in browser
		use({ "tyru/open-browser.vim", event = "VimEnter" })
	end

	if packer_bootstrap then
		require("packer").sync()
	end
end)
