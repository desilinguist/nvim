local signature_status_ok, signature = pcall(require, "lsp_signature")
if not signature_status_ok then
	return
end

signature.setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
})
