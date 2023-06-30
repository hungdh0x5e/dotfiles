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
		-- [";"] = { ":", "enter command mode", opts = { nowait = true } },
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

M.telescope = {
	n = {
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "[F]ind [A]ll" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "[F]ind [B]uffers" },
		["<leader>fw"] = { "<cmd> Telescope grep_string <CR>", "[F]ind current [W]ord" },
		["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "[F]ind [D]iagnostics" },
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "[F]ind [F]iles" },
		["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "[F]ind by [G]rep" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "[F]ind [H]elp page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "[F]ind [O]ldfiles" },
		["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "[F]ind in current buffer" },
	},
}

return M
