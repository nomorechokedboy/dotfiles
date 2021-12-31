local M = {}

local config = {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "build",
      "dist"
    }
  }
}

M.setup = function()
  require("telescope").setup(config)
end

return M
