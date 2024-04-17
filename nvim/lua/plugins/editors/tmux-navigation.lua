-- Navigate between Neovim vs tmux panel
return {
  "alexghergh/nvim-tmux-navigation",
  cmd = { "NvimTmuxNavigateLeft", "NvimTmuxNavigateRight", "NvimTmuxNavigateUp", "NvimTmuxNavigateDown" },
  keys = {
    { "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>", { desc = "Windown move to left" } },
    { "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>", { desc = "Windown move to down" } },
    { "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>", { desc = "Windown move to up" } },
    { "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", { desc = "Windown move to right" } },
    { "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>", { desc = "Windown move to last active" } },
    { "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>", { desc = "Windown move to next" } },
  },
  opts = {
    disable_when_zoomed = true,
  },
}
