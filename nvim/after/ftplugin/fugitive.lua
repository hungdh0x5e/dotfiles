vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("hungdh_fugitive", {}),
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false, desc = "Git push/ Pull" }

    vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", opts)
    vim.keymap.set("n", "<leader>gP", "<cmd>Git pull --rebase<CR>", opts)
  end,
})
