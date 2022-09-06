local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
	return
end

tokyonight.setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
	styles = {
		functions = "italic",
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,
})

local colorscheme = "tokyonight"
local status_cs, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_cs then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end


-- -- Tokyonight colorscheme configuration
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
--
-- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
