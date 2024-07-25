return {
  "mfussenegger/nvim-dap",
  -- stylua: ignore
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Debug: Set Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Debug: Continue" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Debug: Step Into" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    { "<leader>dn", function() require("dap").step_over() end, desc = "Debug: Step Over" },
    { "<leader>dj", function() require("dap").down() end, desc = "Debug: Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Debug: Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Debug: Run Last" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Debug: Pause" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Debug: Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Debug: Widgets" },
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
        { "<leader>de", function() require("dapui").eval(nil, {enter=true}) end, desc = "Debug: DapUI Eval", mode = {"n", "v"} },
      },
      opts = {
        layouts = {
          {
            elements = {
              { id = "breakpoints", size = 0.2 },
              { id = "scopes", size = 0.6 },
              -- { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.2 },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            position = "bottom",
            size = 10,
          },
        },
      },
      config = function(_, opts)
        local dap = require "dap"
        local dapui = require "dapui"

        dapui.setup(opts)

        -- automatic open UI
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {
        display_callback = function(variable)
          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end,
      },
    },

    -- For Golang
    "leoluz/nvim-dap-go",
  },

  config = function()
    vim.api.nvim_set_hl(0, "DapStopped", { default = true, link = "Visual" })

    -- Install golang specific config
    require("dap-go").setup {}
  end,
}
