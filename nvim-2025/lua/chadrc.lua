---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvchad",
	transparency = true,

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },

		CursorLineNr = { bold = true, fg = "red" },
		CursorLine = { bg = "line" },
		LineNr = { bold = false },
	},
}

M.ui = {
	tabufline = {
		enabled = false,
	},

	statusline = {
		theme = "default",
		separator_style = "arrow",
	},

	cmp = {
		icons_left = true, -- only for non-atom styles!
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		abbr_maxwidth = 60,
	},
}

M.colorify = {
	enabled = true,
	mode = "bg", -- fg, bg, virtual
	highlight = { hex = true, lspvars = true },
}

return M
