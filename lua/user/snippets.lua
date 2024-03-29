local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

ls.config.set_config({
	history = true,
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 200,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = false,
	store_selection_keys = "<c-s>",
})

local date = function()
	return { os.date("%Y-%m-%d") }
end

local filename = function()
	return { vim.fn.expand("%:p") }
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
	local file = io.popen(command, "r")
	local res = {}
	for line in file:lines() do
		table.insert(res, line)
	end
	return res
end

require("luasnip.loaders.from_snipmate").load()

ls.add_snippets(nil, {
	all = {
		snip({
			trig = "date",
			namr = "Date",
			dscr = "Date in the form of YYYY-MM-DD",
		}, {
			func(date, {}),
		}),
		snip({
			trig = "pwd",
			namr = "PWD",
			dscr = "Path to current working directory",
		}, {
			func(bash, {}, { user_args = { "pwd" } }),
		}),
		snip({
			trig = "filename",
			namr = "Filename",
			dscr = "Absolute path to file",
		}, {
			func(filename, {}),
		}),
		snip({
			trig = "signature",
			namr = "Signature",
			dscr = "Name and Surname",
		}, {
			text("Sergei Bulavintsev"),
			insert(0),
		}),
	},
	sh = {
		snip("shebang", {
			text({ "#!/bin/sh", "" }),
			insert(0),
		}),
	},
	python = {
		snip("shebang", {
			text({ "#!/usr/bin/env python", "" }),
			insert(0),
		}),
		snip("argparselog", {
			text({
				"import argparse",
				"import logging",
				"",
				"",
				"def main():",
				"",
				"    # set up an argument parser",
				'    parser = argparse.ArgumentParser(prog="foo.py")',
				'    parser.add_argument("--", dest="", help="")',
				"",
				"\t# parse given command line arguments",
				"\targs = parser.parse_args()",
				"",
				"\t# set up the logging",
				"\tlogging.basicConfig(format='%(levelname)s:%(message)s', level=logging.INFO)",
				"",
				"",
				"if __name__ == '__main__':",
				"\tmain()",
				"",
			}),
			insert(0),
		}),
	},
	lua = {
		snip("shebang", {
			text({ "#!/usr/bin/lua", "", "" }),
			insert(0),
		}),
		snip("req", {
			text("require('"),
			insert(1, "Module-name"),
			text("')"),
			insert(0),
		}),
		snip("func", {
			text("function("),
			insert(1, "Arguments"),
			text({ ")", "\t" }),
			insert(2),
			text({ "", "end", "" }),
			insert(0),
		}),
		snip("forp", {
			text("for "),
			insert(1, "k"),
			text(", "),
			insert(2, "v"),
			text(" in pairs("),
			insert(3, "table"),
			text({ ") do", "\t" }),
			insert(4),
			text({ "", "end", "" }),
			insert(0),
		}),
		snip("fori", {
			text("for "),
			insert(1, "k"),
			text(", "),
			insert(2, "v"),
			text(" in ipairs("),
			insert(3, "table"),
			text({ ") do", "\t" }),
			insert(4),
			text({ "", "end", "" }),
			insert(0),
		}),
		snip("if", {
			text("if "),
			insert(1),
			text({ " then", "\t" }),
			insert(2),
			text({ "", "end", "" }),
			insert(0),
		}),
		snip("M", {
			text({ "local M = {}", "", "" }),
			insert(0),
			text({ "", "", "return M" }),
		}),
	},
	go = {
		snip("test", {
			text("func "),
			insert(1, "Name"),
			text("(t *testing.T)"),
			text({ " {", "" }),
			text("\t"),
			insert(0),
			text({ "", "}" }),
		}),
		snip("typei", {
			text("type "),
			insert(1, "Name"),
			text({ " interface {", "" }),
			text("\t"),
			insert(0),
			text({ "", "}" }),
		}),
		snip("types", {
			text("type "),
			insert(1, "Name"),
			text({ " struct {", "" }),
			text("\t"),
			insert(0),
			text({ "", "}" }),
		}),
		snip("func", {
			text("func "),
			insert(1, "Name"),
			text("("),
			insert(2),
			text(")"),
			insert(3),
			text({ " {", "" }),
			text("\t"),
			insert(0),
			text({ "", "}" }),
		}),
		snip("if", {
			text("if "),
			insert(1, "true"),
			text({ " {", "" }),
			text("\t"),
			insert(0),
			text({ "", "}" }),
		}),

		snip("fori", {
			text("for "),
			insert(1, "i := 0"),
			text(";"),
			insert(2, "i < 10"),
			text(";"),
			insert(3, "i++"),
			text({ " {", "" }),
			text("\t"),
			insert(0),
			text({ "", "}" }),
		}),
		snip("forr", {
			text("for "),
			insert(1, "k, v"),
			text(" := range "),
			insert(2, "expr"),
			text({ " {", "" }),
			text("\t"),
			insert(0),
			text({ "", "}" }),
		}),
	},
})
