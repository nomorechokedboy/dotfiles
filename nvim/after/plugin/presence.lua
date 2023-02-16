local client_id = {
	default = "793271441293967371",
	vs_code = "383226320970055681",
	coc_nvim = "768090036633206815",
	pea_vim = "914799712794705961",
	my_client = "923614213832867850",
}

local log_levels = {
	none = nil,
	error = "error",
	warn = "warn",
	info = "info",
	debug = "debug",
}

require("presence"):setup({
	neovim_image_text = "Neovim",
	main_image = "file",
	log_level = log_levels.none,
	client_id = client_id.vs_code,
	workspace_text = function()
		return "Average rust enjoyer"
	end,
})
