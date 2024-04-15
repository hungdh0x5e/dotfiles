local present, hop = pcall(require, "hop")

if not present then
  return
end

local options = {
  keys = "etovxqpdgfblzhckisuran",
  case_insensitive = true,
  jump_on_sole_occurrence = true,
  create_hl_autocmd = true,
  uppercase_labels = false,
}

hop.setup { options }

local directions = require("hop.hint").HintDirection

-- replace f F
vim.keymap.set("n", "f", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
end, { remap = true })
vim.keymap.set("n", "F", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
end, { remap = true })

-- replace t T
vim.keymap.set("n", "t", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
end, { remap = true })
vim.keymap.set("n", "T", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
end, { remap = true })

vim.keymap.set("n", "sc", "<cmd>HopChar2<CR>", { desc = "EasyMotion: Find char" })
vim.keymap.set("n", "sw", "<cmd>HopWord<CR>", { desc = "EasyMotion: Find word" })
