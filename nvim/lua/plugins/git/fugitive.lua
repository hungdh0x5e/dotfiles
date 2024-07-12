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

    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = vim.api.nvim_create_augroup("hungdh_fugitive", {}),
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false, desc = "Git push/ Pull" }
        vim.keymap.set("n", "<leader>gp", function()
          vim.cmd.Git "push"
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>gP", function()
          vim.cmd.Git { "pull", "--rebase" }
        end, opts)
      end,
    })
  end,
}
