local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
    persist_mode = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- are we local or on the GCP instance
local machine = os.getenv("NVIM_MACHINE")
local lazygit_dir
if machine == "gcp" then
    lazygit_dir = "/home/nitin_duolingo_com/bin/"
else
    lazygit_dir = "/opt/homebrew/bin/"
end

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = lazygit_dir .. "lazygit",
    dir = vim.cmd("pwd"),
	direction = "float",
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", "<cmd>close<CR>", { silent = false, noremap = true })
		if vim.fn.mapcheck("<esc>", "t") ~= "" then
			vim.api.nvim_buf_del_keymap(term.bufnr, "t", "<esc>")
			vim.api.nvim_buf_del_keymap(term.bufnr, "t", "<C-j>")
			vim.api.nvim_buf_del_keymap(term.bufnr, "t", "<C-k>")
		end
	end,
})

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local htop = Terminal:new({ cmd = "htop", direction = "float", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end
