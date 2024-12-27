return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>f?", "<cmd>FzfLua builtin<CR>", desc = "[F]ind providers" },

    -- common
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "[F]ind [F]iles" },
    { "<leader>fF", "<cmd>FzfLua files resume=true<CR>", desc = "[F]ind [F]iles resume" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "[F]ind [O]ld files" },
    { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR>", desc = "[F]ind [B]uffers" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "[F]ind [G]rep" },
    { "<leader>fG", "<cmd>FzfLua live_grep_resume<CR>", desc = "[F]ind [G]rep resume" },
    { "<leader>fc", "<cmd>FzfLua grep_curbuf<CR>", desc = "[F]ind in [C]urrent buffer" },
    { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", desc = "[F]ind [W]ord under cursor" },
    { "<leader>fw", "<cmd>FzfLua grep_visual<CR>", mode = "v", desc = "[F]ind [W]ord selection" },

    -- misc
    { "<leader>f:", "<cmd>FzfLua command_history<cr>", desc = "[F]ind command history" },
    { "<leader>f/", "<cmd>FzfLua search_history<cr>", desc = "[F]ind search history" },
    { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "[F]ind [H]elp" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "[F]ind [K]eymaps" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "[F]ind [Q]uickfix" },

    -- with resume
    { "<leader><leader>", "<cmd>FzfLua resume<CR>", { desc = "Open last finder" } },

    -- Git
    { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Git commit" },
    { "<leader>gC", "<cmd>FzfLua git_bcommits<CR>", desc = "Git commit buffer" },

    -- For LSP keymap
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", desc = "LSP: [C]ode [A]ction" },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "LSP: [F]ind [s]ymbols buffer" },
    { "<leader>fS", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = "LSP: [F]ind [S]ymbols" },
    { "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "LSP: [F]ind [D]iagnostics buffer" },
    { "<leader>fD", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "LSP: [F]ind [D]iagnostics" },
    {
      "gd",
      "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<CR>",
      desc = "LSP: [G]oto [D]efinition",
    },
    {
      "gi",
      "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<CR>",
      desc = "LSP: [G]oto [I]mplementation",
    },
    {
      "gr",
      "<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<CR>",
      desc = "LSP: [G]oto [R]eferences",
    },
    { "gt", "<cmd>FzfLua lsp_typedefs ignore_current_line=true<CR>", desc = "LSP: [G]oto [T]ype references" },
  },
  opts = {
    -- { "default-title" },
    winopts = {
      backdrop = 100,
      treesitter = false,
      preview = {
        default = "bat",
      },
    },
    defaults = {
      git_icons = false,
      file_icons = false,
      color_icons = false,
      -- fuzzy search by direction: filename -> path_to_file
      -- { formatter={"path.filename_first",2} for fuzzy search: path_to_file -> filename. But highlight not working
      formatter = "path.filename_first",
    },
    keymap = {
      fzf = {
        ["ctrl-u"] = "half-page-up",
        ["ctrl-d"] = "half-page-down",
        ["ctrl-e"] = "preview-down",
        ["ctrl-x"] = "jump",
        ["ctrl-y"] = "preview-up",
        ["ctrl-q"] = "select-all+accept",
      },
      builtin = {
        ["ctrl-e"] = "preview-down",
        ["ctrl-y"] = "preview-up",
      },
      files = {
        ["ctrl-e"] = "preview-down",
        ["ctrl-y"] = "preview-up",
      },
    },
    oldfiles = {
      include_current_session = true,
      cwd_only = true,
    },
    grep = {
      -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
      -- ex: > enable --*/plugins/*
      rg_glob = true, -- enable glob parsing
      glob_flag = "--iglob", -- case insensitive globs
      glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
    },
    lsp = {
      code_actions = {
        previewer = false,
        winopts = { height = 0.40, width = 0.60 },
      },
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    require("fzf-lua").register_ui_select(function(o, items)
      local min_h, max_h = 0.25, 0.70
      local preview = o.kind == "codeaction" and 0.20 or 0
      local h = (#items + 4) / vim.o.lines + preview
      if h < min_h then
        h = min_h
      elseif h > max_h then
        h = max_h
      end
      return { winopts = { height = h, width = 0.60, row = 0.40 } }
    end)
  end,
}
