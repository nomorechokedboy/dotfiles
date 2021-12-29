local M = {}

local function prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
    stdin = true
  }
end

local config = {
  filetype = {
    lua = {
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
    javascript = {
      prettier
    },
    javascriptreact = {
      prettier
    },
    typescript = {
      prettier
    },
    typescriptreact = {
      prettier
    },
    html = {
      prettier
    },
    css = {
      prettier
    },
    scss = {
      prettier
    },
    json = {
      prettier
    }
  }
}

M.setup = function()
  require("formatter").setup(config)
end

return M
