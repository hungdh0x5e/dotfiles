local harpoon = require "harpoon"

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
  vim.notify("Added to Harpoon", vim.log.levels.INFO)
end, { desc = "Harpoon Add to bookmarks" })

vim.keymap.set("n", "<leader>hd", function()
  harpoon:list():remove()
  vim.notify("Deleted from Harpoon", vim.log.levels.INFO)
end, { desc = "Harpoon Delete from bookmarks" })

vim.keymap.set("n", "<leader>hl", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Show bookmarks" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end, { desc = "Harpoon Previous" })

vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end, { desc = "Harpoon Next" })

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end, { desc = "Harpoon 1" })

vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end, { desc = "Harpoon 2" })

vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end, { desc = "Harpoon 3" })

vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end, { desc = "Harpoon 4" })

vim.keymap.set("n", "<leader>5", function()
  harpoon:list():select(5)
end, { desc = "Harpoon 5" })

