vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.formatoptions:append { c = true, r = true, o = false, q = true }

vim.api.nvim_create_user_command("GoModVendor", function()
  vim.cmd.LspStop()
  vim.cmd "!go mod vendor"
  vim.cmd.write()
  vim.cmd.LspStart()
end, {})

vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>", { desc = "Gopher: Go if error" })
vim.keymap.set("n", "<leader>gta", "<cmd>GoTagAdd<CR>", { desc = "Gopher: Go add tag" })
vim.keymap.set("n", "<leader>gtr", "<cmd>GoTagRm<CR>", { desc = "Gopher: Go remove tag" })
