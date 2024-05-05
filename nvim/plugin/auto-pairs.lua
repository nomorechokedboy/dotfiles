local config = {
	disable_filetype = { "TelescopePrompt", "vim" },
	map_cr = true,
	enable_check_bracket_line = true,
}

require("nvim-autopairs").setup(config)
