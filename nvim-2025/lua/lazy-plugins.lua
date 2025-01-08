local lazy_config = {
	install = { colorscheme = { "nvchad" } },
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			loaded = "",
			not_loaded = "",
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
			},
		},
	},
}

require("lazy").setup({
	{ import = "plugins.ui" },
	{ import = "plugins.git" },
	{ import = "plugins.editors" },
	{ import = "plugins.coding" },
}, lazy_config)
