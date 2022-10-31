local status_ok, persisted = pcall(require, "persisted")
if not status_ok then
	return
end

persisted.setup({
	autoload = true,
    branch_separator = "_",
	telescope = {
		before_source = function()
			-- Close all open buffers
			-- Thanks to https://github.com/avently
			vim.api.nvim_input("<ESC>:%bd<CR>")
		end,
		after_source = function(session)
			print("Loaded session " .. session.name)
		end,
	},
})
