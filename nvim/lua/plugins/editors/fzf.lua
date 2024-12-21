return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "[F]ind [F]iles" } },
    { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "[F]ind [O]ld files" } },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "[F]ind [B]uffers" } },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "[F]ind [G]rep" } },
    { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", { desc = "[F]ind [W]ord under cursor" } },
    { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "[F]ind [H]elp" },
    { "<leader>fc", "<cmd>FzfLua command_history<cr>", desc = "[F]ind [C]ommand history" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "[F]ind [K]eymaps" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "[F]ind [Q]uickfix" },

    -- For LSP keymap
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "LSP: [F]ind [s]ymbols in current buffer" } },
    { "<leader>fS", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "LSP: [F]ind [S]ymbols" } },
    { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "LSP: [F]ind [D]iagnostics" } },
    { "gd", "<cmd>FzfLua lsp_definitions<CR>", { desc = "LSP: [G]oto[D]efinition" } },
    { "gi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP: [G]oto [I]mplementation" } },
    { "gr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP: [G]oto [R]eferences" } },
    { "gt", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "LSP: [G]oto [T]ype references" } },
  },
  opts = {
    -- { "default-title" },
    winopts = {
      backdrop = 100,
      treesitter = true,
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
    },
    grep = {
      -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
      -- ex: > enable --*/plugins/*
      rg_glob = true, -- enable glob parsing
      glob_flag = "--iglob", -- case insensitive globs
      glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
  end,
}
