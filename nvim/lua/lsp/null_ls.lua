local M = {}

local null_ls = require("null-ls")

local config_source = function(custom_configs)
	local configs = {}

	for _, config in pairs(custom_configs.formatting) do
		local source = config.exe
		local filetypes = config.filetypes

		table.insert(
			configs,
			null_ls.builtins.formatting[source].with({
				filetypes = filetypes,
			})
		)
	end

	-- for _, config in pairs(custom_configs.diagnostics) do
	-- 	local source = config.exe
	--
	-- 	table.insert(configs, null_ls.builtins.diagnostics[source])
	-- end

	return configs
end

M.setup = function()
	null_ls.setup({
		sources = config_source({
			formatting = {
				{ exe = "prettierd" },
				{ exe = "stylua", filetypes = { "lua" } },
			},
			diagnostics = {
				{},
			},
		}),
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd([[
augroup format_on_save
autocmd!
autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync()
augroup END
]])
			end
		end,
	})
end

return M
