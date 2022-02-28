local neogen_status_ok, neogen = pcall(require, "neogen")
if not neogen_status_ok then
	return
end

neogen.setup({
	enabled = true,
	snippet_engine = "luasnip",
	languages = {
		python = {
			template = {
				annotation_convention = "numpydoc",
			},
		},
	},
})
