-- function for Golang
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  config = function(_, opts)
    require("gopher").setup(opts)

    vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>", { desc = "Gopher: Go if error" })
    vim.keymap.set("n", "<leader>gta", "<cmd>GoTagAdd<CR>", { desc = "Gopher: Go add tag" })
    vim.keymap.set("n", "<leader>gtr", "<cmd>GoTagRm<CR>", { desc = "Gopher: Go remove tag" })
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
}
