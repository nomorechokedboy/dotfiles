local M = {}

local config = {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  },
  autotag = {
    enable = true
  }
}

M.setup = function()
  require("nvim-treesitter.configs").setup(config)
end

return M
