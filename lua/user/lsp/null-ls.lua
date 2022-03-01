local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- are we local or on the ETS servers
local machine = os.getenv("NVIM_MACHINE")
local linter_path = "/Users/nmadnani/anaconda/bin/"
if machine == "remote" then
    linter_path = "/opt/python/linters/bin/"
end

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({
			command = linter_path .. "black",
			extra_args = { "--fast", "--line-length", "100" },
		}),
		formatting.isort.with({
			command = linter_path .. "isort",
		}),
		diagnostics.flake8.with({
			command = linter_path .. "flake8",
		}),
		diagnostics.pydocstyle.with({
			command = linter_path .. "pydocstyle",
		}),
		formatting.stylua,
	},
})
