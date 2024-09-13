vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("hungdh-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
  desc = "Auto-save when switching window or leaving vim",
  group = vim.api.nvim_create_augroup("hungdh-auto-save", { clear = true }),
  command = ":silent! wa",
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Quick close by q",
  group = vim.api.nvim_create_augroup("hungdh-quick-close", { clear = true }),
  pattern = { "help", "lspinfo", "man", "qf", "startuptime", "checkhealth", "git", "fugitive*", "dap-*" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Highlight for Telescope search result",
  group = vim.api.nvim_create_augroup("hungdh-telescope-result", { clear = true }),
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.cmd "setlocal nofoldenable"
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t.*$")
      -- vim.api.nvim_set_hl(0, "TelescopeParent", { fg = "Comment", bg = "Comment", underline = true })
    end)
  end,
})
