-- Telescope
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = function()
      local conf = require "nvchad.configs.telescope"
      conf.extensions_list = { "themes", "terms", "fzf" }

      -- display {filename - basePath} instead full {filePath}
      local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then
          return tail
        end
        return string.format("%s\t\t%s", tail, parent)
      end
      conf.defaults.path_display = filenameFirst

      return conf
    end,
  },
}
