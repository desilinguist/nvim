local status_ok, silicon = pcall(require, "silicon")
if not status_ok then
	return
end

silicon.setup({
	font = "FiraCode Nerd Font Mono",
	background = "#87f",
	theme = "Monokai Extended",
	line_number = true,
	pad_vert = 80,
	pad_horiz = 50,
	output = {
		clipboard = false,
		path = "/Users/nmadnani/Desktop",
	},
	window_title = function()
		return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
	end,
})
