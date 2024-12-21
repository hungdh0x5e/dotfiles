return {
  {
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
  },
  {
    "echasnovski/mini.files",
    opts = {
      mappings = {
        close = "<C-c>",
        go_in = "l",
        go_in_plus = "<CR>",
        go_out = "h",
        go_out_plus = "",
        reveal_cwd = "@",
      },
    },
    keys = {
      {
        "<leader>,",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>.",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      local filter_show = function(fs_entry)
        return true
      end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, ".")
      end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh { content = { filter = new_filter } }
      end

      -- Set focused directory as current working directory
      local set_cwd = function()
        local path = (MiniFiles.get_fs_entry() or {}).path
        if path == nil then
          return vim.notify "Cursor is not on valid entry"
        end
        vim.fn.chdir(vim.fs.dirname(path))
      end

      -- Yank in register full path of entry under cursor
      local yank_path = function()
        local path = (MiniFiles.get_fs_entry() or {}).path
        if path == nil then
          return vim.notify "Cursor is not on valid entry"
        end
        vim.fn.setreg(vim.v.register, path)
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id

          vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle hidden files" })
          vim.keymap.set("n", "g~", set_cwd, { buffer = buf_id, desc = "Set cwd" })
          vim.keymap.set("n", "gy", yank_path, { buffer = buf_id, desc = "Yank path" })
        end,
      })
    end,
  },
}
