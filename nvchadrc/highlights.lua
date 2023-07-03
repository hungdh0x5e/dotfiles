-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
	Comment = { italic = true, fg = "black", bg = "light_grey" },
	CursorLineNr = { fg = "red", bold = true },
	LineNr = { bold = true },
	NvDashAscii = { bg = "none", fg = "red" },
	NvDashButtons = { bg = "none", fg = "light_grey" },
}

---@type HLTable
M.add = {
	NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
