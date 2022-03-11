local colorscheme = "tokyonight"
-- local colorscheme = "sonokai"

-- Tokyonight colorscheme configuration
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- sonokai colorscheme configuration
-- vim.g.sonokai_style = "atlantis"
-- vim.g.sonokai_enable_italic = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

