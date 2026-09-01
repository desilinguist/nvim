local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
	return
end

fzf_lua.setup({
	fzf_colors = true,
})

local M = {}

-------------------------------------------------------------------------------
-- Environment variables (replaces telescope-env.nvim)
-------------------------------------------------------------------------------

function M.env_vars()
	local items = {}
	for key, value in pairs(vim.fn.environ()) do
		table.insert(items, { key = key, value = value })
	end
	table.sort(items, function(a, b)
		return a.key < b.key
	end)

	local lines = {}
	local by_line = {}
	for _, item in ipairs(items) do
		local flat_value = item.value:gsub("\r?\n", " ")
		local line = string.format("%-30s %s", item.key, flat_value)
		table.insert(lines, line)
		by_line[line] = item
	end

	fzf_lua.fzf_exec(lines, {
		prompt = "Env Vars> ",
		actions = {
			-- <CR> inserts the variable name into the current buffer
			["default"] = function(selected)
				local item = by_line[selected[1]]
				if item and vim.bo.modifiable then
					vim.api.nvim_put({ item.key }, "b", true, true)
				end
			end,
			-- <C-a> inserts the variable value into the current buffer
			["ctrl-a"] = function(selected)
				local item = by_line[selected[1]]
				if item and vim.bo.modifiable then
					vim.api.nvim_put({ item.value }, "b", true, true)
				end
			end,
			-- <C-e> edits the value for the current session (vim.fn.setenv)
			["ctrl-e"] = function(selected)
				local item = by_line[selected[1]]
				if not item then
					return
				end
				local value = vim.fn.input("[ENV] Enter new value: ", item.value)
				if value == "" then
					return
				end
				vim.fn.setenv(item.key, value)
			end,
		},
	})
end

-------------------------------------------------------------------------------
-- Persisted sessions (replaces telescope extension from persisted.nvim)
-------------------------------------------------------------------------------

function M.persisted_sessions()
	local ok_persisted, persisted = pcall(require, "persisted")
	if not ok_persisted then
		return
	end
	local save_dir = require("persisted.config").save_dir
	local sep = require("persisted.utils").dir_pattern()

	local function escape_pattern(str, pattern, replace, n)
		pattern = string.gsub(pattern, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1")
		replace = string.gsub(replace, "[%%]", "%%%%")
		return string.gsub(str, pattern, replace, n)
	end

	local function list_sessions()
		local sessions = {}
		for _, session in pairs(persisted.list()) do
			local name = escape_pattern(session, save_dir, ""):gsub("%%", sep):gsub(vim.fn.expand("~"), sep):gsub(
				"//",
				""
			):sub(1, -5)
			table.insert(sessions, { name = name, file_path = session })
		end
		table.sort(sessions, function(a, b)
			return a.name < b.name
		end)
		return sessions
	end

	local sessions = list_sessions()
	local lines = {}
	local by_line = {}
	for _, s in ipairs(sessions) do
		table.insert(lines, s.name)
		by_line[s.name] = s
	end

	local function fire(event)
		vim.api.nvim_exec_autocmds("User", { pattern = "Persisted" .. event })
	end

	fzf_lua.fzf_exec(lines, {
		prompt = "Sessions> ",
		actions = {
			["default"] = function(selected)
				local s = by_line[selected[1]]
				if not s then
					return
				end
				fire("TelescopeLoadPre")
				vim.schedule(function()
					persisted.load({ session = s.file_path })
				end)
				fire("TelescopeLoadPost")
			end,
			-- <C-x> deletes the session from disk
			["ctrl-x"] = {
				function(selected)
					local s = by_line[selected[1]]
					if s and vim.fn.confirm("Delete [" .. s.name .. "]?", "&Yes\n&No") == 1 then
						vim.fn.delete(vim.fn.expand(s.file_path))
					end
				end,
				fzf_lua.actions.resume,
			},
		},
	})
end

-------------------------------------------------------------------------------
-- Toggletasks (replaces the telescope extension from toggletasks.nvim)
-------------------------------------------------------------------------------

local function task_line(task)
	local tags = {}
	for _, tag in ipairs(task.config.tags) do
		table.insert(tags, "#" .. tag)
	end
	return task.config.name .. (#tags > 0 and (" " .. table.concat(tags, " ")) or "")
end

function M.toggletasks_spawn()
	local ok_discovery, discovery = pcall(require, "toggletasks.discovery")
	if not ok_discovery then
		return
	end

	local tasks = discovery
		.tasks()
		:filter(function(task)
			return not task:is_running()
		end)
		:to_list()

	if #tasks == 0 then
		vim.notify("No tasks found", vim.log.levels.WARN, { title = "toggletasks" })
		return
	end

	local lines, by_line = {}, {}
	for _, task in ipairs(tasks) do
		local line = task_line(task)
		table.insert(lines, line)
		by_line[line] = task
	end

	local function spawn_and_open(dir)
		return function(selected)
			for _, l in ipairs(selected) do
				local task = by_line[l]
				if task then
					task:spawn()
					if dir then
						task.term:change_direction(dir)
					end
					task.term:open()
				end
			end
		end
	end

	fzf_lua.fzf_exec(lines, {
		prompt = "Spawn tasks> ",
		fzf_opts = { ["--multi"] = true },
		actions = {
			["default"] = spawn_and_open(), -- spawn + open in default direction
			["ctrl-s"] = spawn_and_open("horizontal"),
			["ctrl-v"] = spawn_and_open("vertical"),
			["ctrl-t"] = spawn_and_open("tab"),
			["ctrl-f"] = spawn_and_open("float"),
		},
	})
end

function M.toggletasks_select()
	local ok_task, Task = pcall(require, "toggletasks.task")
	if not ok_task then
		return
	end

	local tasks = Task.get_all()
	if #tasks == 0 then
		vim.notify("No running tasks", vim.log.levels.WARN, { title = "toggletasks" })
		return
	end

	local lines, by_line = {}, {}
	for _, task in ipairs(tasks) do
		local line = task_line(task)
		table.insert(lines, line)
		by_line[line] = task
	end

	fzf_lua.fzf_exec(lines, {
		prompt = "Select tasks> ",
		fzf_opts = { ["--multi"] = true },
		actions = {
			["default"] = function(selected)
				for _, l in ipairs(selected) do
					local task = by_line[l]
					if task then
						task.term:open()
					end
				end
			end,
			-- <C-x> kills the task
			["ctrl-x"] = function(selected)
				for _, l in ipairs(selected) do
					local task = by_line[l]
					if task then
						task:shutdown()
					end
				end
			end,
			-- <C-r> respawns the task
			["ctrl-r"] = function(selected)
				for _, l in ipairs(selected) do
					local task = by_line[l]
					if task then
						task:respawn()
					end
				end
			end,
		},
	})
end

return M
