local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- setup substitute plugin for later keymaps
local status_ok, substitute = pcall(require, "substitute")
if not status_ok then
	return
end

substitute.setup({})

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

-- Have cursor stay in place when joining lines
keymap("n", "J", "mzJ`z", opts)

-- keep cursor in place when doing half-page-up/down
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- disable Ex mode:
keymap("n", "Q", "<Nop>", opts)

-- disable arrow keys to learn hjkl
keymap("n", "<up>", "<Nop>", opts)
keymap("n", "<down>", "<Nop>", opts)
keymap("n", "<left>", "<Nop>", opts)
keymap("n", "<right>", "<Nop>", opts)

-- map j and k to gj and gk to navigate
-- by screen lines, not file lines
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- shortcut to quickly insert newline in normal mode above and below
keymap("n", "oo", "m`o<ESC>``", opts)
keymap("n", "OO", "m`O<ESC>``", opts)

-- substitute keymaps
keymap("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
keymap("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
-- keymap("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
keymap("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })

keymap("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
keymap("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
keymap("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
keymap("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })

-- color and icon pickers in insert mode
keymap("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)
keymap("i", "<C-i>", "<cmd>PickIconsInsert<cr>", opts)
keymap("i", "<C-s>", "<cmd>PickSymbolsInsert<cr>", opts)

-- map Esc in insert mode to :w in normal mode
keymap("i", "<Esc>", "<Esc>:w<CR>", { noremap = true })

-- special delete and paste
keymap("n", "<leader>d", '"_d', opts)
keymap("n", "<leader>p", '"_dP', opts)
