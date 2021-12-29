local M = {}

local config = {
  ignore = "^$"
}

M.setup = function()
  require("Comment").setup(config)
end

return M
