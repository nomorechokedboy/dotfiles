local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("mason-null-ls").setup({
	ensure_installed = {
		"eslint_d",
		"gofumpt",
		"goimports",
		"golines",
		"hadolint",
		"jq",
		"nixpkgs-fmt",
		"prettier",
		"staticcheck",
		"stylua",
	},
	automatic_setup = true,
	handlers = {
		function(source_name, methods)
			-- all sources with no handler get passed here

			-- To keep the original functionality of `automatic_setup = true`,
			-- please add the below.
			require("mason-null-ls.automatic_setup")(source_name, methods)
		end,
	},
})

-- will setup any installed and configured sources above
null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
