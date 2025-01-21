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
	file_assets = {
		["astro.config.js"] = { "Astro", "astro" },
		["astro.config.mjs"] = { "Astro", "astro" },
		["astro.config.ts"] = { "Astro", "astro" },
		["nuxt.config.mjs"] = { "Nuxt config", "nuxtjs" },
		["nuxt.config.ts"] = { "Nuxt config", "nuxtjs" },
		["pnpm-lock.yaml"] = { "Pnpm", "pnpm" },
		["pnpm-lock.yml"] = { "Pnpm", "pnpm" },
		["pnpm-workspace.yaml"] = { "Pnpm", "pnpm" },
		["pnpm-workspace.yml"] = { "Pnpm", "pnpm" },
		["svelte.config.js"] = { "Svelte config", "svelte" },
		["tailwind.config.mjs"] = { "Tailwind", "tailwind" },
		["tailwind.config.ts"] = { "Tailwind", "tailwind" },
		["tauri.conf.json"] = { "Tauri", "tauri" },
		["turbo.json"] = { "Turbo", "turbo" },
		["vite.config.js"] = { "Vite", "vite" },
		["vite.config.mjs"] = { "Vite", "vite" },
		["vite.config.ts"] = { "Vite", "vite" },
		["vitest.config.js"] = { "Vitest", "vitest" },
		["vitest.config.mjs"] = { "Vitest", "vitest" },
		["vitest.config.ts"] = { "Vitest", "vitest" },
	},
	log_level = log_levels.none,
	client_id = client_id.my_client,
	workspace_text = function()
		return "Average go enjoyer"
	end,
})
