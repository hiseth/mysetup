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
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
		tag = "nightly", -- optional, update every week.
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("folke/tokyonight.nvim")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		-- or                            , branch = '0.1.x',
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-lua/plenary.nvim")

	use("szw/vim-maximizer")
	use("numToStr/Comment.nvim")
	use("christoomey/vim-tmux-navigator")

	-- managing & install lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim")

	use("jose-elias-alvarez/typescript.nvim")
	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers

	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	}) -- enhanced lsp uis

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- treesitter configuration 语法高亮
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- lualine
	use("nvim-lualine/lualine.nvim")

	-- venv-selector
	use("linux-cultist/venv-selector.nvim")
	use("mfussenegger/nvim-dap-python")

	-- bufferline  tab split
	use({ "akinsho/bufferline.nvim", tag = "*" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
