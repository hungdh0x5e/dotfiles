---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "gruvbox",
	theme_toggle = { "onedark", "one_light", "gruvbox", "ayu_dark" },
	transparency = true,

	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = {
		theme = "default",
	},

	nvdash = {
		load_on_startup = true,
		header = {

			" ___________________________ ",
			"/ Hi Huy Hung.              \\",
			"|                           |",
			"\\ Shut-up and keep working! /",
			" --------------------------- ",
			"        \\   ^__^             ",
			"         \\  (oo)\\_______     ",
			"            (__)\\       )\\/\\ ",
			"                ||----w |    ",
			"                ||     ||    ",
		},
		buttons = {
			{ "  Find File", "Spc s f", "Telescope find_files" },
			{ "󰈚  Recent Files", "Spc s o", "Telescope oldfiles" },
			{ "󰈭  Find Word", "Spc s w", "Telescope live_grep" },
			{ "  Bookmarks", "Spc m a", "Telescope marks" },
			{ "  Themes", "Spc t h", "Telescope themes" },
			{ "  Mappings", "Spc c h", "NvCheatsheet" },
			{ "  Let me out!", "", ":q!" },
		},
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
