local map = vim.keymap.set
-- General mapping map("i", "jk", "<ESC>")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better up/down
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

-- Whatever you delete, make it go away
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "x", '"_x')
map("n", "X", '"_X')
-- map("x", "p", "P")

-- Resize window using arrow keys
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

map(
  { "n", "v" },
  "<leader>S",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" }
)

-- ...and navigating through the items.
map("n", "[q", "<cmd>cprev<cr>zvzz", { desc = "Previous quickfix item" })
map("n", "]q", "<cmd>cnext<cr>zvzz", { desc = "Next quickfix item" })
map("n", "[l", "<cmd>lprev<cr>zvzz", { desc = "Previous loclist item" })
map("n", "]l", "<cmd>lnext<cr>zvzz", { desc = "Next loclist item" })

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer New" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Whichkey query lookup" })

map("n", "<leader>rr", function()
  vim.cmd [[ :exe 'silent !tmux send-keys -t editor.2 C-c ENTER' ]]
  vim.cmd [[ :exe 'silent !tmux send-keys -t editor.2 "root && cd cmd/vinshop-public && go run ." ENTER' ]]
  vim.notify("Reloading vinshop-public", vim.log.levels.INFO)
end, { desc = "VinShop: restart service" })
