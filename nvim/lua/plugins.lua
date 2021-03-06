local constants = require("constant")
local lazy_load_snip = constants.lazy_load_snip
local install = {
	{
		"cpea2506/one_monokai.nvim",
	},
	{
		"wbthomason/packer.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		commit = "fbbcfa7b6c0841e19f39836a7c5561fd9cc6900f",
		config = function()
			require("config.treesitter").setup()
		end,
	},
	{ "p00f/nvim-ts-rainbow" },
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"javascript",
			"typescriptreact",
			"html",
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"hrsh7th/cmp-vsnip",
				ft = lazy_load_snip,
			},
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			require("config.cmp").setup()
		end,
	},
	{
		"hrsh7th/vim-vsnip",
		requires = {
			{
				"nomorechokedboy/friendly-snippets",
				ft = lazy_load_snip,
			},
			{
				"hrsh7th/vim-vsnip-integ",
				ft = lazy_load_snip,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		requires = {
			{
				"williamboman/nvim-lsp-installer",
			},
		},
	},
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		commit = "89f27c53bb447bd02f92c615aecbd149689bc2a8",
		run = "yarn install --frozen-lockfile && yarn compile",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("config.telescope").setup()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		requires = {
			{
				"kyazdani42/nvim-web-devicons",
				config = function()
					require("config.web_devicon").setup()
				end,
			},
		},
		config = function()
			require("config.tree").setup()
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("lsp.null_ls").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("config.comment").setup()
		end,
		keys = { "gc", "gb" },
	},
	{
		"andweeb/presence.nvim",
		config = function()
			require("config.presence").setup()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("config.toggleterm").setup()
		end,
		keys = { "<C-t>" },
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns").setup()
		end,
	},
	{
		"romgrk/barbar.nvim",
	},
	{
		"wakatime/vim-wakatime",
	},
	{ "tamago324/nlsp-settings.nvim" },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("config.indent").setup()
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "LunarVim/onedarker.nvim" },
	{ "navarasu/onedark.nvim" },
	{
		"saecki/crates.nvim",
		tag = "v0.1.0",
		config = function()
			require("config.crates").setup()
		end,
		event = { "BufRead Cargo.toml" },
	},
}

require("config").plugin_install(install)
require("utils.keymaps").setup()
require("utils.autocmd").setup()
require("lsp.lspconfig").setup()
vim.opt.number = true
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
require("onedark").setup({
	style = "warmer",
})
local themes = { "one_monokai", "onedark", "onedarker" }
local random_themes = themes[math.random(1, #themes)]

vim.cmd("colorscheme " .. random_themes)
