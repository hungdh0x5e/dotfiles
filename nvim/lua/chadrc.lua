---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvchad",
  transparency = true,

  -- References: https://github.com/NvChad/base46/blob/v2.0/lua/base46/integrations/telescope.lua
  hl_override = {
    Comment = { italic = true, fg = "black", bg = "light_grey" },
    CursorLineNr = { bold = true, fg = "red" },
    CursorLine = { bg = "line" },
    LineNr = { bold = false },

    TelescopePromptBorder = { fg = "red" },
    TelescopeBorder = { fg = "green" },
    TelescopeSelection = { bg = "grey_fg" },
  },

  hl_add = {
    -- folke/flash.nvim
    FlashLabel = { fg = "white", bg = "#e83e82" },
    FlashBackdrop = { bg = "Comment" },
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "arrow",
  },
}

return M
