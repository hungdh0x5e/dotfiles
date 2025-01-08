local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General mapping map("i", "jk", "<ESC>")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better up/down with word wrap
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- move line up/down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- join line keep cursor position
map("n", "J", "mzJ`z")

-- moving first or last in current line
map({ "n", "o", "x" }, "<S-h>", "^", opts)
map({ "n", "o", "x" }, "<S-l>", "g_", opts)

-- center content
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- map("n", "n", "nzzzv")
-- map("n", "N", "Nzzzv")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Whatever you , make it go away
map("n", "c", [["_d]])
map("n", "C", [["_D]])
map({ "n", "v" }, "x", [["_x]])
map({ "n", "v" }, "X", [["_X]])
-- map({ "n", "v" }, "<leader>d", [["_d]])

-- paste without override clipboard in visual mode
map("x", "p", [["_dP]])

-- copy, paste to system clipboard
-- map({ "n", "v" }, "<leader>y", [["+y]])
-- map("n", "<leader>Y", [["+Y]])

-- Resize window using arrow keys
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer New" })
map("n", "<leader>bv", "<cmd>vertical enew<CR>", { desc = "Buffer New Vertical" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Buffer Delete" })
map("n", "<leader>bo", "<cmd>%bd|e#<CR>", { desc = "Buffer Delete all others" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "Whichkey query lookup" })

--- copy file name to the clipboard
map("n", "yff", function()
	local filename = vim.api.nvim_buf_get_name(0)
	vim.fn.setreg("+", filename)
	vim.notify("Copied " .. filename, vim.log.levels.INFO)
end, { desc = "yank file absolute path" })

map("n", "yfr", function()
	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:.")
	vim.fn.setreg("+", filename)
	vim.notify("Copied " .. filename, vim.log.levels.INFO)
end, { desc = "yank file relative path" })

map({ "n", "v", "i" }, "<C-x><C-f>", function()
	require("fzf-lua").complete_path({ file_icons = true })
end, { silent = true, desc = "Fuzzy complete path" })

map({ "n", "v", "i" }, "<C-x><C-l>", function()
	require("fzf-lua").complete_line()
end, { silent = true, desc = "Fuzzy complete line" })

-- Terminal mappings
map("t", "<C-[>", "<C-\\><C-n>", { desc = "[Terminal] escape terminal mode" })
map("t", "<C-w>", [[<C-\><C-n><C-w>]], {})
-- map("t", "<M-r>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true })

-- Search and Replace
-- 'c.' for word, 'c>' for WORD
-- 'c.' in visual mode for selection
map("n", "c.", [[:s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "search and replace word under cursor" })
map("n", "c>", [[:s/\V<C-r><C-a>//g<Left><Left>]], { desc = "search and replace WORD under cursor" })
