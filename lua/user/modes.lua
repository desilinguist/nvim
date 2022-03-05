local status_ok, modes = pcall(require, "modes")
if not status_ok then
	return
end

require("modes").setup({
	colors = {
		copy = "#f5c359",
		delete = "#c75c6a",
		insert = "#669fa8",
		visual = "#9745be",
	},

	-- Cursorline highlight opacity
	line_opacity = 0.2,

	-- Highlight cursor
	set_cursor = true,

	-- Highlight in active window only
	focus_only = false,
})
