local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
-- local code_actions = null_ls.builtins.code_actions

-- are we local or on the ETS servers
local machine = os.getenv("NVIM_MACHINE")
local linter_path
if machine == "ets" then
	linter_path = "/opt/python/linters/bin/"
elseif machine == "ec2" then
	linter_path = "/home/ec2-user/miniconda/bin/"
else
	linter_path = "/Users/nmadnani/anaconda/envs/linters/bin/"
end

local nim_pretty_path = "/Users/nmadnani/nim-1.6.10/bin/"

null_ls.setup({
	debug = false,
	sources = {
		formatting.black.with({
			command = linter_path .. "black",
			extra_args = { "--line-length", "100" },
		}),
		formatting.isort.with({
			command = linter_path .. "isort",
		}),
		formatting.nimpretty.with({
			command = nim_pretty_path .. "nimpretty",
		}),
		diagnostics.flake8.with({
			command = linter_path .. "flake8",
		}),
		diagnostics.pydocstyle.with({
			command = linter_path .. "pydocstyle",
		}),
        diagnostics.jsonlint,
		formatting.beautysh.with({
			command = linter_path .. "beautysh",
		}),
		formatting.prettier.with({
			filetypes = { "html", "javascript", "typescript", "css", "scss", "less" },
		}),
		formatting.stylua,
		formatting.fixjson,
        formatting.yamlfmt,
        formatting.xmlformat,
	},
})
