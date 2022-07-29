local status_ok, sorter = pcall(require, "sort")
if not status_ok then
	return
end

sorter.setup()
