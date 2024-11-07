return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git" },
  keys = {
    { "<leader>gs", "<cmd>Git<CR>", desc = "[G]it [s]tatus" },
    { "<leader>ga", "<cmd>Git blame<CR>", desc = "[G]it [a]notate" },
    { "<leader>gla", "<cmd>Gllog!<CR>", desc = "[G]it [l]og [a]ll" },
    { "<leader>glf", "<cmd>0Gllog!<CR>", desc = "[G]it [l]og current [f]ile" },
    { "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "[G]it [d]iff vertical" },
  },
  config = function()
    vim.keymap.set("n", "gH", "<cmd>diffget //2<CR>", { desc = "Git diffget 2" })
    vim.keymap.set("n", "gL", "<cmd>diffget //3<CR>", { desc = "Git diffget 3" })

    vim.cmd [[
      let g:fugitive_summary_format = "%s (%ar) <%an>"
    ]]
  end,
}
