require("neotest").setup({
	adapters = {
		require("neotest-go"),
		require("neotest-python")({
			runner = "pytest",
			pytest_discover_instances = true,
			python = function()
				return require("venv-selector").get_active_venv()
			end,
		}),
	},
})
