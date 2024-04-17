-- Mark and quick jump to bookmark file
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
  },
  keys = function()
    local keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
          vim.notify("Added to Harpoon", vim.log.levels.INFO)
        end,
        desc = "Harpoon Add to bookmarks",
      },
      {
        "<leader>hd",
        function()
          require("harpoon"):list():remove()
          vim.notify("Deleted from Harpoon", vim.log.levels.INFO)
        end,
        desc = "Harpoon Delete from bookmarks",
      },
      {
        "<leader>hl",
        function()
          local harpoon = require "harpoon"
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Menu",
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end

    return keys
  end,
}
