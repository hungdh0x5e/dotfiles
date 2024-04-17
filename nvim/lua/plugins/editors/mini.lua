return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup {
      n_lines = 500,
      -- Disable error feedback.
      silent = true,
      -- Don't use the previous or next text object.
      search_method = "cover",
      mappings = {
        -- Disable next/last variants.
        around_next = "",
        inside_next = "",
        around_last = "",
        inside_last = "",
      },
    }
    require("mini.surround").setup()
  end,
}
