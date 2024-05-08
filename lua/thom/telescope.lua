local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("An error occured during loading telescope")
	return
end

local K = require("thom.keymaps.telescope")

telescope.setup({
	defaults = {
		mappings = K.mapping,
	},
	pickers = {
		planets = {
			show_pluto = true,
		},
	},
})
