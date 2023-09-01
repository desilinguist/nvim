local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- do not highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
    inccommand = "split", -- show the effects of a search / replace in a live preview window
	mouse = "a", -- allow the mouse to be used in neovim
    mmp = 8000, -- max mem pattern for JSON files
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 4 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	scrolloff = 8, -- number of context lines above and below when scorlling
	sidescrolloff = 8, -- horizontal scrolling characters
    laststatus = 3, -- use global status line instead of per buffer
	guifont = "Berkeley Mono Variable:h16", -- the font used in graphical neovim applications
    guicursor = "", -- use a fat cursor in insert mode too
    -- set folding options for ufo
    foldcolumn = '1',
    foldlevel = 99,
    foldlevelstart = 99,
    foldenable = true,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- set markdown fenced languages
vim.g.markdown_fenced_languages = {"bash=sh", "javascript", "json=javascript", "python", "html"}

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
