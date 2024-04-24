local status_ok, gen = pcall(require, "gen")
if not status_ok then
	return
end

-- customize the model
-- gen.model = "mistral"
gen.model = "phi3"

-- add keymaps
vim.keymap.set("n", "<leader>I", ":Gen<CR>", { silent = true })
vim.keymap.set("v", "<leader>I", ":Gen<CR>", { silent = true })
