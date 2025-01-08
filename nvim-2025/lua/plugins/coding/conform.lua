return {
	"stevearc/conform.nvim",
	event = { "LspAttach", "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		notify_on_error = true,

		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt", "goimports-reviser" },
			json = { "jq" },
			yaml = { "yamlfmt" },
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "deno_fmt" },
			toml = { "taplo" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,
		},

		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			local lsp_format_opt

			if disable_filetypes[vim.bo[bufnr].filetype] then
				lsp_format_opt = "never"
			else
				lsp_format_opt = "fallback"
			end

			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,
	},
}
