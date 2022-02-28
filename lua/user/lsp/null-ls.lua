local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({
			command = "/Users/nmadnani/anaconda/bin/black",
			extra_args = { "--fast", "--line-length", "100" },
		}),
		formatting.isort.with({
			command = "/Users/nmadnani/anaconda/bin/isort",
		}),
		diagnostics.flake8.with({
			command = "/Users/nmadnani/anaconda/bin/flake8",
		}),
		diagnostics.pydocstyle.with({
			command = "/Users/nmadnani/anaconda/bin/pydocstyle",
		}),
		formatting.stylua,
	},
})
