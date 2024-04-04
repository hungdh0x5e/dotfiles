return {
  {
    "folke/which-key.nvim",
    enabled = true,
  },

  -- Like easy-motion, quick move by label
  {
    "smoka7/hop.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.hop"
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.flash"
    end,
  },

  -- Navigate between Neovim vs tmux panel
  {
    "alexghergh/nvim-tmux-navigation",
    cmd = { "NvimTmuxNavigateLeft", "NvimTmuxNavigateRight", "NvimTmuxNavigateUp", "NvimTmuxNavigateDown" },
    config = function()
      require("nvim-tmux-navigation").setup {
        disable_when_zoomed = true,
      }
    end,
  },

  -- Beauty notification
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
      require "configs.notify"
    end,
  },

  -- Mark and quick jump to bookmark file
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.harpoon"
    end,
  },

  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  -- Collection of various small independent plugins/modules
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup { n_lines = 500 }
      require("mini.surround").setup()
    end,
  },

  -- format
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = function()
      require "configs.conform"
    end,
  },
}
