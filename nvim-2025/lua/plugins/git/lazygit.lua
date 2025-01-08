-- LazyGit git UI
return {
  "kdheepak/lazygit.nvim",
  cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilterCurrentFile", "LazyGitFilter" },
  keys = {
    { "<leader>lg", "<cmd>LazyGitCurrentFile<CR>", desc = "LazyGit Open" },
    { "<leader>lf", "<cmd>LazyGitFilterCurrentFile<CR>", desc = "LazyGit Open current file" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
