local M = {}

M.setup = function()
	local cmp_kinds = {
		Text = "  ",
		Method = "  ",
		Function = "  ",
		Constructor = "  ",
		Field = "  ",
		Variable = "  ",
		Class = "  ",
		Interface = "  ",
		Module = "  ",
		Property = "  ",
		Unit = "  ",
		Value = "  ",
		Enum = "  ",
		Keyword = "  ",
		Snippet = "  ",
		Color = "  ",
		File = "  ",
		Reference = "  ",
		Folder = "  ",
		EnumMember = "  ",
		Constant = "  ",
		Struct = "  ",
		Event = "  ",
		Operator = "  ",
		TypeParameter = "  ",
	}

	local cmp = require("cmp")

	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		formatting = {
			fields = { "kind", "abbr" },
			format = function(_, vim_item)
				vim_item.kind = cmp_kinds[vim_item.kind] or ""
				return vim_item
			end,
		},
		mapping = {
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable,
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "vsnip" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	--[[ local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local lsp_installer = require("nvim-lsp-installer")

  lsp_installer.on_server_ready(
    function(server)
      local opts = {
        capabilities = capabilities
      }
      server:setup(opts)
    end
  ) ]]
end

return M
