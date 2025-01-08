dofile(vim.g.base46_cache .. "cmp")

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				-- Build Step is needed for regex support in snippets.
				-- This step is not supported in many windows environments.
				-- Remove the below condition to re-enable on windows.
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},

		-- autopairing of (){}[] etc
		{
			"windwp/nvim-autopairs",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			},
			config = function(_, opts)
				require("nvim-autopairs").setup(opts)

				-- setup cmp for autopairs
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end,
		},

		-- Adds other completion capabilities.
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},

	opts = function()
		local cmp = require("cmp")
		local compare = require("cmp.config.compare")
		local luasnip = require("luasnip")

		local options = {
			completion = { completeopt = "menu,menuone,noinsert" },

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			sources = {
				{
					name = "lazydev",
					group_index = 0,
				},
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},

			sorting = {
				comparators = {
					compare.offset,
					compare.exact,
					compare.score,

					function(entry1, entry2)
						local _, entry1_under = entry1.completion_item.label:find("^_+")
						local _, entry2_under = entry2.completion_item.label:find("^_+")
						entry1_under = entry1_under or 0
						entry2_under = entry2_under or 0
						if entry1_under > entry2_under then
							return false
						elseif entry1_under < entry2_under then
							return true
						end
					end,

					compare.kind,
					compare.sort_text,
					compare.length,
					compare.order,
				},
			},

			-- Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete({}),

				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),

				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
		}

		return vim.tbl_deep_extend("force", options, require("nvchad.cmp"))
	end,

	config = function(_, opts)
		require("luasnip").config.setup({})
		require("cmp").setup(opts)
	end,
}
