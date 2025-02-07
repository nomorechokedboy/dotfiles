require("telescope").setup({
	extensions = {
		undo = {
			saved_only = true,
		},
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
})

require("telescope").load_extension("undo")
