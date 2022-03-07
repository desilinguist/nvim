local status_ok, tidy = pcall(require, "tidy")
if not status_ok then
	return
end

tidy.setup({
	eof_quant = 0,
	fmts = {
		"eof",
		"ws",
	},
})

