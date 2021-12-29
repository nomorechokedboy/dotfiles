local M = {}

local config = {
  disable_filetype = {"TelescopePrompt", "vim"},
  map_cr = true,
  enable_check_bracket_line = true
}

M.setup = function()
  require("nvim-autopairs").setup(config)
end

return M
