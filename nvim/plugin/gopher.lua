require("gopher").setup({
	commands = {
		go = "go",
		gomodifytags = "gomodifytags",
		gotests = "gotests",
		impl = "impl",
		iferr = "iferr",
	},
	gotag = {
		transform = "camelcase",
	},
})
