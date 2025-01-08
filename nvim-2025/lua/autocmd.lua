vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("hungdh-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
	desc = "Auto-save when switching window or leaving vim",
	group = vim.api.nvim_create_augroup("hungdh-auto-save", { clear = true }),
	command = ":silent! wa",
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Quick close by q",
	group = vim.api.nvim_create_augroup("hungdh-quick-close", { clear = true }),
	pattern = {
		"help",
		"lspinfo",
		"man",
		"qf",
		"startuptime",
		"checkhealth",
		"git",
		"fugitive*",
		"dap-*",
		"fzf",
		"lazygit",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		-- local client = vim.lsp.get_client_by_id(event.data.client_id)
		-- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
		-- 	local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

		-- vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = "#FFFF00" })
		-- vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = "#FF0000" })
		-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		-- 		buffer = event.buf,
		-- 		group = highlight_augroup,
		-- 		callback = vim.lsp.buf.document_highlight,
		-- 	})
		--
		-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		-- 		buffer = event.buf,
		-- 		group = highlight_augroup,
		-- 		callback = vim.lsp.buf.clear_references,
		-- 	})
		--
		-- 	vim.api.nvim_create_autocmd("LspDetach", {
		-- 		group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
		-- 		callback = function(event2)
		-- 			vim.lsp.buf.clear_references()
		-- 			vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
		-- 		end,
		-- 	})
		-- end
	end,
})
