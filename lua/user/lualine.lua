local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "-- " .. str .. " --"
-- 	end,
-- }

local filetype = {
	"filetype",
	icons_enabled = true,
	icon_only = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local short_hostname = function()
	local full_hostname = vim.loop.os_gethostname()
	local parts = {}
	for part in string.gmatch(full_hostname, "[^%.]+") do
		table.insert(parts, part)
	end
	return parts[1]
end

local get_conda_or_venv = function()
	-- is a non-base conda environment defined?
	local conda_env = vim.fn.getenv("CONDA_DEFAULT_ENV")
	local use_conda = (conda_env ~= "" and conda_env ~= "base")

	-- what does the venv plugin say?
	local venv = require("venv-selector").get_active_venv()
    local venv_name = ""
	if venv then
        local venv_parts = vim.fn.split(venv, "/")
        venv_name = venv_parts[#venv_parts]
	end

	-- show conda environment if defined else whatever the plugin says
	if use_conda then
		return conda_env
	else
		return venv_name
	end
end

-- cool function for progress
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local navic_status_ok, navic = pcall(require, "nvim-navic")
if not navic_status_ok then
	return
end

navic.setup({
	lsp = {
		auto_attach = true,
	},
})

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch, diagnostics, { get_conda_or_venv, icon = "🐍" } },
		lualine_c = {
			function()
				return "%="
			end,
			filetype,
			"filename",
		},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { short_hostname, diff, "fileformat", spaces, "encoding" },
		lualine_y = { "navic", color_correction = nil, navic_opts = nil },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		-- lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {
		"trouble",
		"nvim-tree",
		"lazy",
	},
})
