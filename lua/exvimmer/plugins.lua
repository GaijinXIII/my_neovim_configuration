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
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
	},
	-- { "EdenEast/nightfox.nvim" },
	{ "akinsho/bufferline.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
			"windwp/nvim-autopairs",
		},
	},
	{ "nvim-lualine/lualine.nvim" },
	-- { "nvim-tree/nvim-tree.lua" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			"xiyaowong/telescope-emoji.nvim",
			"ghassan0/telescope-glyph.nvim",
		},
	},
	{ "adoyle-h/lsp-toggle.nvim" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{ "glepnir/dashboard-nvim", event = "VimEnter" },
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-nvim-lsp-signature-help",
			"ray-x/lsp_signature.nvim",
		},
	},
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "folke/todo-comments.nvim" },
	{ "folke/which-key.nvim" },
	{ "folke/zen-mode.nvim" },
	{ "folke/neodev.nvim" },
	-- { "folke/tokyonight.nvim" },
	-- {
	-- 	"folke/noice.nvim",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- "rcarriga/nvim-notify",
	-- 	},
	-- },
	{ "NvChad/nvim-colorizer.lua" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "lewis6991/gitsigns.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-rsi" },
	{ "tpope/vim-obsession" },
	{ "tpope/vim-speeddating" },
	{ "phaazon/hop.nvim" },
	{ "vimwiki/vimwiki" },
	{ "itchyny/calendar.vim" },
	-- {'simrat39/rust-tools.nvim'},
	{ "KabbAmine/vCoolor.vim" },
	{ "mbbill/undotree" },
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
