return {
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	priority = 1000,
	-- 	init = function()
	-- 		vim.g.gruvbox_material_enable_italic = true
	-- 		vim.g.gruvbox_material_enable_bold = 1
	-- 		vim.g.gruvbox_material_background = "medium"
	-- 		vim.g.gruvbox_material_better_performance = 1
	-- 		vim.g.gruvbox_material_transparent_background = 1
	-- 		vim.cmd.colorscheme("gruvbox-material")
	-- 	end,
	-- },

	"nvim-lua/plenary.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"nvchad/ui",
		priority = 1000,
		config = function()
			require("nvchad")

			vim.keymap.set("n", "<leader>te", function()
				require("nvchad.themes").open()
			end)

			-- new terminals
			vim.keymap.set("n", "<leader>th", function()
				require("nvchad.term").new({ pos = "sp" })
			end, { desc = "terminal new horizontal term" })

			vim.keymap.set("n", "<leader>tv", function()
				require("nvchad.term").new({ pos = "vsp" })
			end, { desc = "terminal new vertical term" })
		end,
	},

	{
		"nvchad/base46",
		lazy = false,
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"nvchad/volt",
	},
}
