local M = {}

local config = {
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"bash",
		"comment",
		"dockerfile",
		"graphql",
		"http",
		"jsdoc",
		"json",
		"json5",
		"lua",
		"regex",
		"scss",
		"vim",
		"vue",
		"yaml",
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = { javascriptreact = { style_element = "{/*%s*/}" } },
		typescript = "// %s",
		css = "/* %s */",
		scss = "/* %s */",
		html = "<!-- %s -->",
		svelte = "<!-- %s -->",
		vue = "<!-- %s -->",
		json = "",
		javascript = {
			__default = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			jsx_attribute = "// %s",
			comment = "// %s",
		},
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	autotag = {
		enable = true,
	},
}

M.setup = function()
	require("nvim-treesitter.configs").setup(config)
end

return M
