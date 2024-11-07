return {
  "lewis6991/gitsigns.nvim",
  event = "User FilePost",
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "󰍵" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" }, -- │
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation [c ]c
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, { desc = "Git [H]unk [S]tage" })
      map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git [H]unk [U]ndo stage" })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "Git [H]unk [R]eset" })
      map("n", "<leader>hd", gs.diffthis, { desc = "Git [H]unk [D]iff" })
      map("n", "<leader>hp", gs.preview_hunk, { desc = "Git [H]unk [P]review" })
      map("v", "<leader>hs", function()
        gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end)
      map("v", "<leader>hr", function()
        gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, { desc = "Git [H]unk [R]eset" })
      map("n", "<leader>gb", function()
        gs.blame_line { full = true }
      end, { desc = "Git blame preview" })
      map("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "Git toggle blame" })

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "git")
    require("gitsigns").setup(opts)
  end,
}
