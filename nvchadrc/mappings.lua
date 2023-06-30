---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		-- disable for nvim_tmux_navigation
		["<C-h>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",
		["<C-l>"] = "",

		-- no need terminal in nvim
		["<leader>h"] = "",

		["<Esc>"] = "",
	},
}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>,"] = { ":noh<cr>", "clear highlight after search", opts = { nowait = true } },
		["<leader><leader>"] = { "<C-^>", "switch the last two files", opts = { nowait = true } },

		["<Right>"] = { ":vertical resize +5<cr>", opts = { silent = true } },
		["<Left>"] = { ":vertical resize -5<cr>", opts = { silent = true } },
		["<Up>"] = { ":resize +5<cr>", opts = { silent = true } },
		["<Down>"] = { ":resize -5<cr>", opts = { silent = true } },

		-- Whatever you delete, make it go away
		["c"] = { '"_c' },
		["C"] = { '"_C' },
		["x"] = { '"_x' },
		["X"] = { '"_c' },

		-- Search will center on the line it's found in
		["n"] = { "nzzzv" },
		["N"] = { "Nzzzv" },
		["#"] = { "#zz" },
		["*"] = { "*zz" },
		["g;"] = { "g;zz" },
	},

	v = {
		["<"] = { "<gv", "Stay in visual mode during outdent" },
		[">"] = { ">gv", "Stay in visual mode during indent" },
	},
}

-- more keybinds!
M.tmux = {
	n = {
		["<C-h>"] = { ":NvimTmuxNavigateLeft<CR>", "Move to window left", opts = { silent = true } },
		["<C-j>"] = { ":NvimTmuxNavigateDown<CR>", "Move to window down", opts = { silent = true } },
		["<C-k>"] = { ":NvimTmuxNavigateUp<CR>", "Move to window up", opts = { silent = true } },
		["<C-l>"] = { ":NvimTmuxNavigateRight<CR>", "Move to window right", opts = { silent = true } },
		["<C-\\>"] = { ":NvimTmuxNavigateLastActive<CR>", "Move to window last active", opts = { silent = true } },
	},
}

M.lazygit = {
	n = {
		["<leader>lg"] = { ":LazyGitCurrentFile<CR>", "Open LazyGit in project", opts = { silent = true } },
		["<leader>lf"] = { ":LazyGitFilterCurrentFile<CR>", "Open LazyGit of current file", opts = { silent = true } },
	},
}

return M
