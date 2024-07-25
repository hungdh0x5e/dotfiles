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
    order = { "mode", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" }, --  "git",
    modules = {
      file = function()
        local icon = "󰈚"
        local path = vim.api.nvim_buf_get_name(0)
        local name = (path == "" and "Empty ") or vim.fn.fnamemodify(path, ":p:.")

        if name ~= "Empty " then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")

          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and ft_icon) or icon
          end
        end

        if vim.o.columns < 100 then
          name = name:match "([^/\\]+)[/\\]*$" -- only show filename
        end
        return "%#St_file# " .. icon .. " " .. name .. " " .. "%#St_file_sep#"
      end,
    },
  },

  tabufline = {
    enabled = false,
  },

  cmp = {
    icons = true,
    lspkind_text = true,
  },
}

return M
