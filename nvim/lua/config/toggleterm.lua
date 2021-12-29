local M = {}

local config = {
  size = 15,
  hiden_number = true,
  close_on_exit = true,
  shade_terminals = false,
  open_mapping = "<C-t>",
  direction = "horizontal",
  float_opts = {
    windblend = 3,
    border = "rounded"
  }
}

M.setup = function()
  require("toggleterm").setup(config)
end

return M
