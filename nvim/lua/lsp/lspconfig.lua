local M = {}

local servers = {
	"rust_analyzer",
	"tsserver",
	"jsonls",
	"stylelint_lsp",
	"emmet_ls",
	"cssls",
	"dockerls",
	"sumneko_lua",
	"yamlls",
	"html",
}

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

local lsp_installer_servers = require("nvim-lsp-installer.servers")

for _, server_name in pairs(servers) do
	local _, server = lsp_installer_servers.get_server(server_name)
	if not server:is_installed() then
		server:install()
	end
end

local capabilities = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

	return capabilities
end

local on_attach = function(client, _)
	local disable_fmt = {
		"rust_analyzer",
		"tsserver",
		"jsonls",
		"stylelint_lsp",
	}

	vim.fn["vsnip#get_complete_items"](vim.fn["bufnr"]())

	for _, server in pairs(disable_fmt) do
		if client.name == server then
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end
	end
end

M.setup = function()
	local lsp_installer = require("nvim-lsp-installer")

	lsp_installer.on_server_ready(function(server)
		local opts = {
			on_attach = on_attach,
			capabilities = capabilities(),
		}

		if server.name == "jsonls" then
			local jsonls_opts = require("lsp.settings.jsonls")
			opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		end

		if server.name == "sumneko_lua" then
			local sumneko_opts = require("lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end

		if server.name == "tsserver" then
			opts = {
				on_attach = on_attach,
				capabilities = capabilities(),
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			}
		end

		server:setup(opts)
		vim.cmd("do User LspAttachBuffers")
	end)
end

return M
