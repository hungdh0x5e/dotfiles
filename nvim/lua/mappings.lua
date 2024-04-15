-- require "nvchad.mappings"

local map = vim.keymap.set

-- General mapping
-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "j", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
vim.keymap.set("n", "k", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })

-- move line up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- join line keep cursor position
map("n", "J", "mzJ`z")

-- center content
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Whatever you delete, make it go away
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "x", '"_x')
map("n", "X", '"_X')
map("x", "p", "P")

-- TIP: Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight after search", nowait = true })
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

-- nvim-tmux-navigation
map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>", { desc = "Windown move to left" })
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>", { desc = "Windown move to down" })
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>", { desc = "Windown move to up" })
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", { desc = "Windown move to right" })
map("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>", { desc = "Windown move to last active" })
map("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>", { desc = "Windown move to next" })

-- Lazygit
map("n", "<leader>lg", "<cmd>LazyGitCurrentFile<CR>", { desc = "LazyGit Open" })
map("n", "<leader>lf", "<cmd>LazyGitFilterCurrentFile<CR>", { desc = "LazyGit Open current file" })

-- Telescope File picker
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[F]ind [F]iles respects .gitignore" })
map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "[F]ind current [W]ord" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "[F]ind by [G]rep" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "[F]ind [O]ldfiles" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "[F]ind [A]ll files" }
)

-- Telescope Vim picker
map("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", { desc = "[F]ind [B]uffers" })
map("n", "<leader>fc", "<cmd>Telescope command_history<cr>", { desc = "[F]ind [C]ommand history" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[F]ind [H]elp" })
map("n", "<leader>th", "<cmd>Telescope colorscheme<cr>", { desc = "Change themes" })
map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "[F]ind [Q]uickfix" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "[F]ind [K]eymaps" })
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "[F]ind in current buffer" })
map("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "[F]ind [R]esume" })

-- Telescope LSP picker
local mapLSP = function(keys, func, desc)
  vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
end
mapLSP("<leader>gr", "<cmd>Telescope lsp_references<cr>", "[G]oto [R]eferences")
mapLSP("<leader>gd", "<cmd>Telescope lsp_definitions<cr>", "[G]oto [D]efinition")
mapLSP("<leader>gi", "<cmd>Telescope lsp_implementations<cr>", "[G]oto [I]mplementation")
mapLSP("<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "[F]ind [S]ymbols")
mapLSP("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "[F]ind [S]ymbols Buffer")
mapLSP("<leader>fd", "<cmd>Telescope diagnostics<cr>", "[F]ind [D]iagnostics")
mapLSP("<leader>ft", "<cmd>Telescope lsp_type_definitions<cr>", "[F]ind [D]efinition")
mapLSP("[d", vim.diagnostic.goto_prev, "Lsp prev diagnostic")
mapLSP("]d", vim.diagnostic.goto_next, "Lsp next diagnostic")
mapLSP("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
mapLSP("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

-- mapLSP("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
-- mapLSP("K", vim.lsp.buf.hover, "Hover Documentation")
-- mapLSP("<leader>sh", vim.lsp.buf.signature_help, "Show signature help")
-- mapLSP("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
-- mapLSP("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")

-- NvChad Tabufline
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })
map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })
map("n", "<leader>cc", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })
map("n", "<leader>co", function()
  require("nvchad.tabufline").closeOtherBufs()
end, { desc = "Buffer Close Other" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer New" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Whichkey query lookup" })

-- Flash
-- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash" },
-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },

-- Gopher
map("n", "<leader>ge", "<cmd>GoIfErr<CR>", { desc = "Gopher: Go if error" })
map("n", "<leader>gta", "<cmd>GoTagAdd<CR>", { desc = "Gopher: Go add tag" })
map("n", "<leader>gtr", "<cmd>GoTagRm<CR>", { desc = "Gopher: Go remove tag" })

map("n", "<leader>rr", function()
  vim.cmd [[ :exe 'silent !tmux send-keys -t editor.2 C-c ENTER' ]]
  vim.cmd [[ :exe 'silent !tmux send-keys -t editor.2 "root && cd cmd/vinshop-public && go run ." ENTER' ]]
  vim.notify("Reloading vinshop-public", vim.log.levels.INFO)
end, { desc = "VinShop: restart service" })

-- Debugging
map("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "Debug: toggle breakpoint" })
map("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "Debug: continue" })
