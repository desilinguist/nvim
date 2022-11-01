local status_ok, silicon = pcall(require, "silicon")
if not status_ok then
	return
end

silicon.setup({
    font = "FiraCode Nerd Font Mono",
    shadowBlurRadius = 30,
})
