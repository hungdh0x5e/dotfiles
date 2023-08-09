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
		["<leader>b"] = "",
		["<leader>fa"] = "",
		["<leader>fb"] = "",
		["<leader>fw"] = "",
		["<leader>fd"] = "",
		["<leader>ff"] = "",
		["<leader>fg"] = "",
		["<leader>fh"] = "",
		["<leader>fo"] = "",
		["<leader>fz"] = "",

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
		["<C-U>"] = { "<C-U>zz" },
		["<C-D>"] = { "<C-D>zz" },

		["<leader>co"] = { ":%bd | e# <CR>", "Close all other buffer", opts = { silent = true } },
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
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "[Find] [A]ll" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "[Find] [B]uffers" },
		["<leader>fw"] = { "<cmd> Telescope grep_string <CR>", "[Find] current [W]ord" },
		["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "[Find] [D]iagnostics" },
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "[Find] [F]iles" },
		["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "[Find] by [G]rep" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "[Find] [H]elp page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "[Find] [O]ldfiles" },
		["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "[Find] in current buffer" },
	},
}

M.dap = {
	plugin = true,
	n = {
		["<F5>"] = { "<cmd> DapContinue <CR>", "Debug: Start/Continue" },
		["<F1>"] = { "<cmd> DapStepInto <CR>", "Debug: Step Into" },
		["<F2>"] = { "<cmd> DapStepOver <CR>", "Debug: Step Over" },
		["<F3>"] = { "<cmd> DapStepOut <CR>", "Debug: Step Out" },

		["<leader>b"] = { "<cmd> DapToggleBreakpoint <CR>", "Debug: Toggle Breakpoint" },
		["<leader>B"] = {
			function()
				local dap = require("dap")
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			"Debug: Set Breakpoint",
		},
		["<F7>"] = {
			function()
				local dapui = require("dapui")
				dapui.toggle()
			end,
			"Debug: See last session result.",
		},
	},
}

M.dap_go = {
	plugin = true,
	n = {
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug: go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug: last go test",
		},
	},
}

return M
