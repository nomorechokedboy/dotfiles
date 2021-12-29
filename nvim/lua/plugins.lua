local map = vim.api.nvim_set_keymap
local lazy_load_snip = {
  "javascript",
  "typescript",
  "typescriptreact",
  "html",
  "css",
  "scss",
  "lua"
}

local install = {
  {
    "cpea2506/one_monokai.nvim"
  },
  {
    "wbthomason/packer.nvim"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config.treesitter").setup()
    end
  },
  {"p00f/nvim-ts-rainbow"},
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "typescriptreact",
      "html"
    }
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs").setup()
    end,
    event = "InsertCharPre"
  },
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "hrsh7th/cmp-vsnip",
        ft = lazy_load_snip
      },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
    },
    config = function()
      require("config.cmp").setup()
    end
  },
  {
    "hrsh7th/vim-vsnip",
    requires = {
      {
        "nomorechokedboy/friendly-snippets",
        ft = lazy_load_snip
      },
      {
        "hrsh7th/vim-vsnip-integ",
        ft = lazy_load_snip
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    requires = {
      {
        "williamboman/nvim-lsp-installer"
      }
    }
    -- config = function()
    -- 	require("lspconfig").tsserver.setup({
    -- 		on_attach = function(client)
    -- 			client.resolved_capabilities.document_formatting = false
    -- 			client.resolved_capabilities.document_range_formatting = false
    -- 		end,
    -- 	})
    -- end,
  },
  {
    "dsznajder/vscode-es7-javascript-react-snippets",
    run = "yarn install --frozen-lockfile && yarn compile",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/plenary.nvim"}}
  },
  {
    "kyazdani42/nvim-tree.lua",
    requires = {
      {
        "kyazdani42/nvim-web-devicons",
        config = function()
          require("config.web_devicon").setup()
        end
      }
    },
    config = function()
      require("config.tree").setup()
    end
  },
  -- {
  -- 	"jose-elias-alvarez/null-ls.nvim",
  -- 	config = function()
  -- 		require("lsp.null_ls").setup()
  -- 	end,
  -- },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("config.comment").setup()
    end,
    keys = {"gc", "gb"}
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      require("config.formatter").setup()
    end
  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("config.presence").setup()
    end
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("config.toggleterm").setup()
    end,
    keys = {"<C-t>"}
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config.lualine").setup()
    end
  }
}

require("config").plugin_install(install)

map("n", "<C-s>", ":Format<CR>", {noremap = true})
map("n", "<C-b>", ":NvimTreeToggle<CR>", {noremap = true})
map("n", "<leader>r", ":NvimTreeRefresh<CR>", {noremap = true})
map("n", "<C-p>", ":Telescope find_files<CR>", {noremap = true})
map("n", "<S-f>", ":Telescope buffers<CR>", {noremap = true})
vim.opt.number = true
vim.opt.undofile = true
-- Move current line / block
--[[ ["<A-j>"] = ":m .+1<CR>==",
["<A-k>"] = ":m .-2<CR>==",
-- Better indenting
["<"] = "<gv",
[">"] = ">gv",
 visual_block_mode = {
        -- Move selected line / block of text in visual mode
        ["K"] = ":move '<-2<CR>gv-gv",
        ["J"] = ":move '>+1<CR>gv-gv",

        -- Move current line / block
        ["<A-j>"] = ":m '>+1<CR>gv-gv",
        ["<A-k>"] = ":m '<-2<CR>gv-gv",
    }, ]]

