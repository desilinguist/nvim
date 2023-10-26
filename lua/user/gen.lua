local status_ok, gen = pcall(require, "gen")
if not status_ok then
	return
end

-- customize the model
gen.model = "openhermes2-mistral"

-- add keymaps


-- add new prompts here
