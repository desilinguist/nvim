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

-- are we local or on the ETS servers
local machine = os.getenv("NVIM_MACHINE")
local lazygit_dir
local gitui_dir
if machine == "ets" then
    lazygit_dir = "/opt/python/lazygit/bin/"
    gitui_dir = "/opt/rust/cargo/bin/"
elseif machine == "ec2" then
    lazygit_dir = "/home/ec2-user/miniconda/bin/"
    gitui_dir = ""
else
    lazygit_dir = "/opt/local/bin/"
    gitui_dir = "/opt/local/bin/"
end

local Terminal = require("toggleterm.terminal").Terminal
local gitui = Terminal:new({ cmd = gitui_dir .. "gitui", direction = "float", hidden = true })

function _GITUI_TOGGLE()
	gitui:toggle()
end

local lazygit = Terminal:new({
	cmd = lazygit_dir .. "lazygit",
	direction = "float",
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", "<cmd>close<CR>", { silent = false, noremap = true })
		if vim.fn.mapcheck("<esc>", "t") ~= "" then
			vim.api.nvim_buf_del_keymap(term.bufnr, "t", "<esc>")
		end
	end,
})

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", direction = "float", hidden = true })

function _NCDU_TOGGLE()
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", direction = "float", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end
