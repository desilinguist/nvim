local status_ok, persisted = pcall(require, "persisted")
if not status_ok then
	return
end

persisted.setup({ autoload = true })
