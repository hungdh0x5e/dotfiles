local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins
local function augroup(name)
	return vim.api.nvim_create_augroup("hungdh_nullls_" .. name, { clear = true })
end

local sources = {

	-- webdev stuff
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes

	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,

	-- golang
	b.formatting.gofumpt.with({ filetypes = { "go" } }),
	b.formatting.goimports_reviser.with({ filetypes = { "go" } }),
	b.formatting.golines.with({ filetypes = { "go" } }),
}

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({
			group = augroup("formatting"),
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup("formatting"),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			vim.lsp.buf.code_action({
				bufnr = bufnr,
				context = { only = { "source.organizeImports" } },
				apply = true,
			})
		end,
	})
end

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = on_attach,
})
