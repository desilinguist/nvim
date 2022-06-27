-- setup nvim-ts-autotags
local status_ok, autotags = pcall(require, "nvim-ts-autotags")
if not status_ok then
	return
end

autotags.setup()
