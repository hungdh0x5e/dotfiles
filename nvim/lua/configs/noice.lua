require("noice").setup {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = { enabled = false },
    signature = { enabled = false },
  },

  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },

  -- command line
  cmdline = {
    view = "cmdline",
    format = {
      search_down = {
        view = "cmdline",
      },
      search_up = {
        view = "cmdline",
      },
    },
  },

  routes = {
    -- ignore 'written' message
    {
      filter = { event = "msg_show", kind = "", find = "written" },
      opts = { skip = true },
    },

    -- bring @q to command line
    {
      view = "cmdline",
      filter = { event = "msg_showmode" },
    },

    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },

    -- ignore some input. Ex: HopChar
    {
      -- view = "cmdline",
      filter = { event = "msg_show", kind = "echo", find = "Hop" },
      opts = { skip = true },
    },
  },
}

-- stylua: ignore
vim.keymap.set("n", "<leader>nl", function() require("noice").cmd "last" end, { desc = "Noice Last message" })
-- stylua: ignore
vim.keymap.set("n", "<leader>nh", function() require("noice").cmd "history" end, { desc = "Noice History" })
-- stylua: ignore
vim.keymap.set("n", "<leader>na", function() require("noice").cmd "all" end, { desc = "Noice All" })
-- stylua: ignore
vim.keymap.set("n", "<leader>nd", function() require("noice").cmd "dismiss" end, { desc = "Dismiss All" })
