return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        delete_to_trash = true,
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
        },
        view_options = {
          show_hidden = true,
        },
      }
    end,
  },
}
