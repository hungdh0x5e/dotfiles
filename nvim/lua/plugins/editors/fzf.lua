return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "[F]ind [F]iles" } },
    { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "[F]ind [O]ld files" } },
    { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR>", { desc = "[F]ind [B]uffers" } },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "[F]ind [G]rep" } },
    { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", { desc = "[F]ind [W]ord under cursor" } },
    { "<leader>fw", "<cmd>FzfLua grep_visual<CR>", mode = "v", desc = "[F]ind [W]ord selection" },
    { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "[F]ind [H]elp" },
    { "<leader>fc", "<cmd>FzfLua command_history<cr>", desc = "[F]ind [C]ommand history" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "[F]ind [K]eymaps" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "[F]ind [Q]uickfix" },

    -- with resume
    { "<leader>frf", "<cmd>FzfLua files resume=true<CR>", { desc = "[F]ind [R]esume [F]iles" } },
    { "<leader>frg", "<cmd>FzfLua live_grep_resume<CR>", { desc = "[F]ind [R]esume [G]rep" } },

    -- For LSP keymap
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", { desc = "LSP: [C]ode [A]ction" } },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "LSP: [F]ind [s]ymbols in current buffer" } },
    { "<leader>fS", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "LSP: [F]ind [S]ymbols" } },
    { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "LSP: [F]ind [D]iagnostics" } },
    {
      "gd",
      "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<CR>",
      { desc = "LSP: [G]oto[D]efinition" },
    },
    {
      "gi",
      "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<CR>",
      { desc = "LSP: [G]oto [I]mplementation" },
    },
    {
      "gr",
      "<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<CR>",
      { desc = "LSP: [G]oto [R]eferences" },
    },
    {
      "gt",
      "<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<CR>",
      { desc = "LSP: [G]oto [T]ype references" },
    },
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
      formatter = "path.filename_first",
    },
    keymap = {
      fzf = {
        ["ctrl-e"] = "preview-down",
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
      local min_h, max_h = 0.15, 0.70
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
