vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", { pattern = "init.lua", command = "source $MYVIMRC" })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "tf" },
	callback = function()
		vim.cmd("set filetype=terraform")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown", "rst" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 79
		vim.opt_local.colorcolumn = "+1"
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "python" },
	callback = function()
		vim.opt_local.textwidth = 100
		vim.opt_local.colorcolumn = "-20,+20"
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd({ "User" }, {
	pattern = { "AlphaReady" },
	callback = function()
		vim.cmd([[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    ]])
	end,
})

local group = vim.api.nvim_create_augroup("PersistedHooks", {})

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedTelescopeLoadPre",
  group = group,
  callback = function()
    -- Close and delete all open buffers
    vim.api.nvim_input("<ESC>:%bd<CR>")
  end,
})

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedTelescopeLoadPost",
  group = group,
  callback = function(session)
    print("Loaded session " .. session.data.name)
  end,
})
