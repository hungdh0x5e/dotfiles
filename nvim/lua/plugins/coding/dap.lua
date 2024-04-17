return {
  "mfussenegger/nvim-dap",
  -- stylua: ignore
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Debug: Set Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Debug: Continue" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Debug: Step Into" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Debug: Step Over" },
    { "<leader>dj", function() require("dap").down() end, desc = "Debug: Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Debug: Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Debug: Run Last" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Debug: Pause" },
  },

  dependencies = {
    -- Creates a beautiful debugger UI
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Debug: DapUI toggle" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Debug: DapUI Eval", mode = {"n", "v"} },
      },
      opts = {},
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    -- For Golang
    "leoluz/nvim-dap-go",
  },

  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {}

    -- automatic open UI
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Install golang specific config
    require("dap-go").setup()
  end,
}
