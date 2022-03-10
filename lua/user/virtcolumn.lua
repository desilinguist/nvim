local status_ok, virtcolumn = pcall(require, "virt-column")
if not status_ok then
	return
end

virtcolumn.setup()
