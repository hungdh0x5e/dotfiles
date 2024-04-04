return {
  -- Parser and highlight code
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "bash",
        "regex",
        "markdown",
        "markdown_inline",
        "dockerfile",
      },
    },
  },

  -- Highlight instance under cursor follow by treesitter
  {
    "RRethy/vim-illuminate",
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
    config = function()
      require "configs.illuminate"
    end,
  },

  -- function for Golang
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
