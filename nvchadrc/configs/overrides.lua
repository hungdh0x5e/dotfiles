local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"go",
		"gomod",
		"dockerfile",
	},
	indent = {
		enable = true,
	},

	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<M-space>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- golang stuff
		"gopls",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},

	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = false,
	},

	-- view = {
	-- 	float = {
	-- 		enable = true,
	-- 		open_win_config = function()
	-- 			local screen_w = vim.opt.columns:get()
	-- 			local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
	-- 			local window_w = screen_w * 0.8
	-- 			local window_h = screen_h * 0.8
	-- 			local window_w_int = math.floor(window_w)
	-- 			local window_h_int = math.floor(window_h)
	-- 			local center_x = (screen_w - window_w) / 2
	-- 			local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
	-- 			return {
	-- 				border = "rounded",
	-- 				relative = "editor",
	-- 				row = center_y,
	-- 				col = center_x,
	-- 				width = window_w_int,
	-- 				height = window_h_int,
	-- 			}
	-- 		end,
	-- 	},
	-- width = function()
	-- 	return math.floor(vim.opt.columns:get() * 0.8)
	-- end,
	-- },
}

return M
