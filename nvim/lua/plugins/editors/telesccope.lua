local M = {}

-- display {filename - basePath} instead full {filePath}
---@param path string
function M.filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local full_parent = vim.fs.dirname(path)

  -- Find the Git root directory
  local git_root = vim.fs.find(".git", { path = full_parent, upward = true })[1]
  if git_root then
    git_root = vim.fs.dirname(git_root)
  end

  -- Determine the project root using LSP if Git root is not found
  local project_root = git_root
  if not project_root then
    local lsp_clients = vim.lsp.get_clients()
    for _, client in ipairs(lsp_clients) do
      if client.config.root_dir then
        project_root = client.config.root_dir
        break
      end
    end
  end

  -- Fallback to the current working directory if no Git or LSP root
  project_root = project_root or vim.fn.getcwd()

  -- Adjust parent path relative to the project root
  local relative_parent = full_parent:gsub("^" .. vim.pesc(project_root) .. "/", "")

  if relative_parent == "" then
    relative_parent = "."
  end

  path = string.format("%s (%s)", tail, relative_parent)

  local highlights = {
    {
      {
        #tail + 1, -- highlight start position
        #path, -- highlight end position
      },
      "Comment", -- highlight group name
    },
  }

  return path, highlights
end

-- Telescope
return {
  {
    "nvim-telescope/telescope.nvim",
    -- keys = {
    --   { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles respects .gitignore" },
    --   { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "[F]ind current [W]ord" },
    --   { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[F]ind by [G]rep" },
    --   { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "[F]ind [O]ldfiles" },
    --   {
    --     "<leader>fa",
    --     "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    --     desc = "[F]ind [A]ll files",
    --   },
    --
    --   { "<leader><leader>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "[F]ind [B]uffers" },
    --   { "<leader>fc", "<cmd>Telescope command_history<cr>", desc = "[F]ind [C]ommand history" },
    --   { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[F]ind [H]elp" },
    --   { "<leader>th", "<cmd>Telescope themes<cr>", desc = "Change themes" },
    --   { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "[F]ind [Q]uickfix" },
    --   { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[F]ind [K]eymaps" },
    --   { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[F]ind in current buffer" },
    --   { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "[F]ind [R]esume" },
    -- },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    opts = function()
      -- more details https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/telescope.lua
      local conf = require "nvchad.configs.telescope"

      conf.extensions_list = { "themes", "terms", "fzf", "ui-select" }
      conf.defaults.path_display = M.filenameFirst

      return conf
    end,

    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
}
