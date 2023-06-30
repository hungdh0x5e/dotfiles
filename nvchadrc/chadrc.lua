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
			"                            ______                             ",
			'    _________        .---"""      """---.                      ',
			"   :______.-':      :  .--------------.  :                     ",
			"   | ______  |      | :                : |                     ",
			"   |:______B:|      | |                | |                     ",
			"   |:______B:|      | |  $ whoami      | |   _     /)---(\\     ",
			"   |:______B:|      | |                | |   \\\\   (/ . . \\)    ",
			"   |         |      | |  > hungdh      | |    \\\\__)-\\(*)/      ",
			"   |:_____:  |      | |                | |    \\_       (_      ",
			"   |    ==   |      | :                : |    (___/-(____)     ",
			"   |       O |      :  '--------------'  :                     ",
			"   |       o |      :'---...______...---'                      ",
			"   |       o |-._.-i___/'             \\._                      ",
			"   |'-.____o_|   '-.   '-...______...-'  `-._                  ",
			"   :_________:      `.____________________   `-.___.-.         ",
			"                    .'.eeeeeeeeeeeeeeeeee.'.      :___:        ",
			"      2023        .'.eeeeeeeeeeeeeeeeeeeeee.'.                 ",
			"                 :____________________________:                ",
		},
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
