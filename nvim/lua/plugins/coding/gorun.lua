return {
  {
    dir = "~/dotfiles/nvim/plugins/gorun.nvim",
    ft = "go",
    keys = {
      { "<leader>rc", "<CMD>GoRun<CR>", desc = "Go run configuration" },
    },
    config = function()
      -- Lazy load fzf-lua to register_ui_select
      require "fzf-lua"
      require "gorun"
    end,
  },
}
