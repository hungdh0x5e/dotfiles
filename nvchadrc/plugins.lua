local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = {
			overrides.mason,
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},

	-- Debugging go
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Creates a beautiful debugger UI
			"rcarriga/nvim-dap-ui",

			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		init = function()
			require("core.utils").load_mappings("dap")
		end,
		config = function()
			require("custom.configs.nvim-dap")
		end,
	},

	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function(_, opts)
			require("dap-go").setup(opts)
			require("core.utils").load_mappings("dap_go")
		end,
	},

	{
		"alexghergh/nvim-tmux-navigation",
		cmd = { "NvimTmuxNavigateLeft", "NvimTmuxNavigateRight", "NvimTmuxNavigateUp", "NvimTmuxNavigateDown" },
		opts = {
			disable_when_zoomed = true,
		},
		config = function(_, opts)
			require("nvim-tmux-navigation").setup(opts)
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilterCurrentFile", "LazyGitFilter" },
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"rcarriga/nvim-notify",
	},

	{
		"phaazon/hop.nvim",
		branch = "v2",
		cmd = { "HopWord", "HopPattern", "HopChar1", "HopChar2" },
		init = function()
			require("core.utils").load_mappings("hop")
		end,
		config = function()
			require("custom.configs.hop")
		end,
	},
	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
