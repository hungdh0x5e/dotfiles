-- Like easy-motion, quick move by label
return {
  "smoka7/hop.nvim",
  keys = {
    { "sc", "<cmd>HopChar2<CR>", { desc = "EasyMotion: Find char" } },
    { "sw", "<cmd>HopWord<CR>", { desc = "EasyMotion: Find word" } },
  },
  opts = {
    keys = "etovxqpdgfblzhckisuran",
    case_insensitive = true,
    jump_on_sole_occurrence = true,
    create_hl_autocmd = true,
    uppercase_labels = false,
  },
  config = function(_, opts)
    local hop = require "hop"

    hop.setup(opts)

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
  end,
}
