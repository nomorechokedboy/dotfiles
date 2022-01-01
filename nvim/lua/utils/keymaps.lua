local M = {}

M.set_keymap = function(keys)
	local modes = {
		normal = "n",
		insert = "i",
		visual = "v",
	}
	for mode, map in pairs(keys) do
		local key_mode = modes[mode]
		local opts = { noremap = true, silent = true }

		for key, value in pairs(map) do
			vim.api.nvim_set_keymap(key_mode, key, value, opts)
		end
	end
end

M.setup = function()
	local keymap = {
		normal = {
			["<C-s>"] = ":w<CR>",
			["<Tab>"] = ":BufferNext<CR>",
			["<C-e>"] = ":BufferClose<CR>",
			["<C-b>"] = ":NvimTreeToggle<CR>",
			["<S-Tab>"] = ":BufferPrevious<CR>",
			["<C-p>"] = ":Telescope find_files<CR>",
			["<leader>ft"] = ":lua print(vim.bo.filetype)<CR>",
			["<leader>fo"] = ":lua vim.lsp.buf.formatting_sync()<CR>",
			["<C-h>"] = "<C-w>h",
			["<C-j>"] = "<C-w>j",
			["<C-k>"] = "<C-w>k",
			["<C-l>"] = "<C-w>l",
			["<A-j>"] = "<Esc>:m .+1<CR>==gi",
			["<A-k>"] = "<Esc>:m .-2<CR>==gi",
			["<leader>r"] = ":NvimTreeRefresh<CR>",
			["<S-f>"] = ":Telescope buffers<CR>",
		},
		visual = {
			["<C-s>"] = ":w!<CR>",
			["<A-j>"] = ":m .+1<CR>==",
			["<A-k>"] = ":m .-2<CR>==",
			["p"] = '"_dP',
			["<"] = "<gv",
			[">"] = ">gv",
		},
		insert = {
			["jk"] = "<ESC>",
		},
	}

	M.set_keymap(keymap)
end

return M
