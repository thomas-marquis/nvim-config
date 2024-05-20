local venv_selector = require("venv-selector")

venv_selector.setup({
	auto_refresh = true,
	name = { "venv", ".venv" },
})
