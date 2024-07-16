return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
      -- stylua: ignore
      { "<leader>-", function() require("oil").toggle_float() end, desc = "Open Oil in floating window", },
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
