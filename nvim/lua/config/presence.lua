local M = {}

local config = {
  auto_update = true,
  neovim_image_text = "NeoVim",
  main_image = "file",
  client_id = "923614213832867850",
  log_level = nil,
  debounce_timeout = 10,
  enable_line_number = false,
  blacklist = {},
  buttons = true,
  editing_text = "Editing %s",
  file_explorer_text = "Browsing %s",
  plugin_manager_text = "Managing plugins",
  reading_text = "Reading %s",
  workspace_text = function()
    return "Mernalism"
  end,
  line_number_text = "Line %s out of %s"
}

M.setup = function()
  require("presence"):setup(config)
end

return M
