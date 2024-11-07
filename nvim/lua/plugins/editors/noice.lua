-- Beauty notification
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Noice Dismiss All" },
  },
  dependencies = {
    { "MunifTanjim/nui.nvim" },
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out", -- fade_in_slide_out, fade, slide, static
        time_formats = {
          notification = "%T",
          notification_history = "%FT%T",
        },
        timeout = 4000,
        top_down = true,
      },
      config = function(_, opts)
        require("notify").setup(opts)
        vim.notify = require "notify"
        -- vim.notify("Welcome back, hungdh", vim.log.levels.INFO, { title = "Intro" })
      end,
    },
  },
  opts = {
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
      { filter = { find = "E162" }, view = "mini" },
      { filter = { event = "msg_show", kind = "", find = "written" }, skip = true },
      { filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
      { filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
      { filter = { event = "emsg", find = "E23" }, skip = true },
      { filter = { event = "emsg", find = "E20" }, skip = true },
      { filter = { find = "No signature help" }, skip = true },
      { filter = { find = "E37" }, skip = true },

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
  },
}
