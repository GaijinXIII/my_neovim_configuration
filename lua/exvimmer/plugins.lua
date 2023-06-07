local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	{
		"adoyle-h/lsp-toggle.nvim",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{ "airblade/vim-rooter" },
	{ "akinsho/bufferline.nvim", lazy = true, dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
	},
	{ "famiu/bufdelete.nvim", event = "VeryLazy" },
	{ "folke/which-key.nvim", lazy = true },
	{ "folke/zen-mode.nvim", even = "VeryLazy" },
	{ "folke/neodev.nvim", lazy = true },
	{ "glepnir/dashboard-nvim", event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"glepnir/lspsaga.nvim",
		lazy = true,
		branch = "main",
		event = "LspAttach",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},
	{ "itchyny/calendar.vim", event = "VeryLazy" },
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{
		"kylechui/nvim-surround",
		config = true,
		event = "VeryLazy",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{ "L3MON4D3/LuaSnip" },
	{
		"leoluz/nvim-dap-go",
		config = true,
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap" },
		ft = "go",
	},
	{ "lervag/vimtex", event = "VeryLazy", ft = "tex" },
	{ "lewis6991/gitsigns.nvim", dependencies = "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{ "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" },
	{ "mbbill/undotree", event = "VeryLazy" },
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		event = "VeryLazy",
	},
	{ "mxsdev/nvim-dap-vscode-js", event = "VeryLazy", dependencies = { "mfussenegger/nvim-dap" } },
	{ "neovim/nvim-lspconfig", dependencies = { "glepnir/lspsaga.nvim" } },
	{ "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
	},
	{ "xiyaowong/telescope-emoji.nvim", dependencies = "nvim-telescope/telescope.nvim", event = "VeryLazy" },
	{ "ghassan0/telescope-glyph.nvim", dependencies = "nvim-telescope/telescope.nvim", event = "VeryLazy" },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-tree/nvim-tree.lua", lazy = true, dependencies = "nvim-tree/nvim-web-devicons" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "windwp/nvim-autopairs" },
	{ "numToStr/Comment.nvim", event = "VeryLazy" },
	{ "NvChad/nvim-colorizer.lua", event = "VeryLazy" },
	{ "phaazon/hop.nvim", config = true, event = "VeryLazy", branch = "v2" },
	{ "rafamadriz/friendly-snippets", dependencies = "L3MON4D3/LuaSnip" },
	{ "ray-x/lsp_signature.nvim", lazy = true },
	{ "rcarriga/nvim-dap-ui", config = true, dependencies = {
		"mfussenegger/nvim-dap",
	}, event = "VeryLazy" },
	{ "rhysd/clever-f.vim", event = "VeryLazy" },
	{ "saadparwaiz1/cmp_luasnip", dependencies = "hrsh7th/nvim-cmp" },
	{
		"theHamsta/nvim-dap-virtual-text",
		config = true,
		dependencies = { "mfussenegger/nvim-dap" },
		event = "VeryLazy",
	},
	{ "/tpope/vim-abolish", event = "VeryLazy" },
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "tpope/vim-rhubarb", event = "VeryLazy" },
	{ "tpope/vim-rsi", event = "VeryLazy" },
	{ "tpope/vim-obsession", event = "VeryLazy" },
	{ "tpope/vim-speeddating", event = "VeryLazy" },
	{ "vimwiki/vimwiki", event = "VeryLazy" },
	{ "williamboman/mason.nvim", event = "VeryLazy" },
	{ "williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim" },
}, {
	ui = {
		border = "single",
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
