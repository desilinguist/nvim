local status_ok1, mason = pcall(require, "mason")
if not status_ok1 then
	return
end

local status_ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok2 then
	return
end

local servers = {
    -- "basedpyright",
	"bashls",
	"cssls",
	"emmet_ls",
	"esbonio",
	"html",
	"jsonls",
    "lemminx",
	"lua_ls",
	"marksman",
	"nimls",
	"pyright",
	"r_language_server",
    "ruff",
    "taplo",
	"terraformls",
	"tflint",
	"ts_ls",
	"yamlls",
}

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
mason_lspconfig.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "lua_ls" then
		local sumneko_opts = require("user.lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server == "yamlls" then
		local yaml_opts = require("user.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yaml_opts, opts)
	end

	lspconfig[server].setup(opts)
end
