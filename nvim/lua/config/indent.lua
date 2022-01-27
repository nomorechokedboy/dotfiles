local M = {}

local config = {
	show_current_context = true,
	show_current_context_start = true,
	use_treesitter = true,
	filetype_exclude = {
		"help",
		"terminal",
		"dashboard",
		"packer",
		"tsplayground",
		"lspinfo",
		"TelescopePrompt",
		"lsp-installer",
	},
	buftype_exclude = { "terminal" },
	trailing_blankline_indent = false,
	max_indent_increase = 1,
}

M.setup = function()
	require("indent_blankline").setup(config)
end

return M
