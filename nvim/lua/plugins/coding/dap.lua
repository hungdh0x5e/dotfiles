local BP_DB_PATH = vim.fn.stdpath "data" .. "/dap_breakpoints.json"

local M = {}

M._load_breakpoints = function()
  local fp = io.open(BP_DB_PATH, "r")
  if not fp then
    return
  end
  local json = fp:read "*a"
  local ok, bps = pcall(vim.json.decode, json)
  if not ok or type(bps) ~= "table" then
    vim.notify(string.format("Error parsing breakpoint json-db: %s", bps), vim.log.levels.WARN)
    return
  end
  local path2bufnr = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local path = vim.api.nvim_buf_get_name(bufnr)
    if type(bps[path]) == "table" and not vim.tbl_isempty(bps[path]) then
      path2bufnr[path] = bufnr
    end
  end
  -- no breakpoints in current buflist
  if vim.tbl_isempty(path2bufnr) then
    return
  end
  local bp_count = 0
  for path, buf_bps in pairs(bps) do
    local bufnr = tonumber(path2bufnr[path])
    if bufnr then
      for _, bp in pairs(buf_bps) do
        bp_count = bp_count + 1
        local line = bp.line
        local opts = {
          condition = bp.condition,
          log_message = bp.logMessage,
          hit_condition = bp.hitCondition,
        }
        require("dap.breakpoints").set(opts, bufnr, line)
      end
    end
  end
  -- Load bps into active session (not just the UI)
  local session = require("dap").session()
  if session and bp_count > 0 then
    session:set_breakpoints(require("dap.breakpoints").get())
  end
  vim.notify(
    string.format("Loaded %d breakpoints in %d bufers.", bp_count, vim.tbl_count(path2bufnr)),
    vim.log.levels.INFO
  )
end

M._store_breakpoints = function()
  local fp = io.open(BP_DB_PATH, "r")
  local json = fp and fp:read "*a" or "{}"
  local ok, bps = pcall(vim.json.decode, json)
  if not ok or type(bps) ~= "table" then
    bps = {}
  end
  local bp_count = 0
  local breakpoints_by_buf = require("dap.breakpoints").get()
  for bufnr, buf_bps in pairs(breakpoints_by_buf) do
    bp_count = bp_count + #buf_bps
    bps[vim.api.nvim_buf_get_name(bufnr)] = buf_bps
  end
  -- If buffer has no breakpoints, remove from the db
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if not breakpoints_by_buf[bufnr] then
      local path = vim.api.nvim_buf_get_name(bufnr)
      bps[path] = nil
    end
  end
  fp = io.open(BP_DB_PATH, "w")
  if fp then
    fp:write(vim.json.encode(bps))
    fp:close()
    vim.notify(
      string.format("Stored %d breakpoints in %d bufers.", bp_count, vim.tbl_count(breakpoints_by_buf)),
      vim.log.levels.INFO
    )
  end
end

return {
  "mfussenegger/nvim-dap",
  -- stylua: ignore
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Debug: Set Breakpoint" },
    {"<Leader>lp", function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc="Debug: Log point"},
    { "<leader>dc", function() require("dap").continue() end, desc = "Debug: Continue" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Debug: Step Into" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    { "<leader>dn", function() require("dap").step_over() end, desc = "Debug: Step Over" },
    { "<leader>dr", function() require("dap").run_last() end, desc = "Debug: Run Last" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Debug: Pause" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Debug: Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Debug: Widgets" },

  -- Load/Store breakpoint in a json-db
    { "<leader>d-", function () M._load_breakpoints() end, mode={"n", "v"}, desc="DAP load breakpoints"},
    { "<leader>d+", function () M._store_breakpoints() end, mode={"n", "v"}, desc="DAP store breakpoints"},
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
            position = "left",
            size = 40,
            elements = {
              { id = "breakpoints", size = 0.15 },
              { id = "scopes", size = 0.55 },
              -- { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.3 },
            },
          },
          {
            position = "bottom",
            size = 12,
            elements = {
              { id = "repl", size = 1.0 },
              -- { id = "console", size = 0.5 },
            },
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
    -- {
    --   "theHamsta/nvim-dap-virtual-text",
    --   opts = {
    --     display_callback = function(variable)
    --       if #variable.value > 15 then
    --         return " " .. string.sub(variable.value, 1, 15) .. "... "
    --       end
    --
    --       return " " .. variable.value
    --     end,
    --   },
    -- },

    -- For Golang
    "leoluz/nvim-dap-go",
  },

  config = function()
    -- Lazy load fzf-lua to register_ui_select
    require "fzf-lua"

    -- Set logging level
    require("dap").set_log_level "DEBUG"

    local signs = {
      { name = "DapBreakpoint", text = "B" },
      { name = "DapBreakpointCondition", text = "C" },
      { name = "DapLogPoint", text = "L" },
      { name = "DapStopped", text = "→" },
      { name = "DapBreakpointRejected", text = "R" },
    }
    for _, item in ipairs(signs) do
      vim.fn.sign_define(
        item.name,
        { text = item.text, texthl = "CursorLineNr", linehl = "Visual", numhl = "CursorLineNr" }
      )
    end

    -- Install golang specific config
    require("dap-go").setup {
      delve = {
        port = "38697",
      },
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
    }
  end,
}
