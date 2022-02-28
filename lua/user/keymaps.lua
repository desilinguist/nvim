local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-d>", ":Bdelete<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- disable Ex mode:
keymap("n", "Q", "<Nop>", opts)

-- Nvimtree
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>ft", ":Format<cr>", opts)

-- Telescope
-- keymap("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts)
-- keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
-- keymap(
-- 	"n",
-- 	"<leader>ff",
-- 	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
-- 	opts
-- )
-- keymap(
-- 	"n",
-- 	"<leader>fb",
-- 	"<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
-- 	opts
-- )
-- keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
-- keymap(
-- 	"n",
-- 	"<leader>fo",
-- 	"<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
-- 	opts
-- )
-- keymap(
-- 	"n",
-- 	"<leader>r",
-- 	"<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
-- 	opts
-- )
-- keymap(
-- 	"n",
-- 	"<leader>rg",
-- 	"<cmd>lua require'telescope.builtin'.lsp_workspace_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
-- 	opts
-- )

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)
--
-- Toggleterm external applications
-- lazygit
-- keymap(
-- 	"n",
-- 	"<leader>lg",
-- 	"<cmd>lua _LAZYGIT_TOGGLE()<cr>",
-- 	opts
-- )
-- -- gitui
-- keymap(
-- 	"n",
-- 	"<leader>gu",
-- 	"<cmd>lua _GITUI_TOGGLE()<cr>",
-- 	opts
-- )
-- -- htop
-- keymap(
-- 	"n",
-- 	"<leader>ht",
-- 	"<cmd>lua _HTOP_TOGGLE()<cr>",
-- 	opts
-- )
-- -- ncdu
-- keymap(
-- 	"n",
-- 	"<leader>du",
-- 	"<cmd>lua _NCDU_TOGGLE()<cr>",
-- 	opts
-- )
--
-- Trouble diagnostics window
-- keymap("n", "<leader>sa", ":Trouble<CR>", opts)

-- Projects window
-- keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
