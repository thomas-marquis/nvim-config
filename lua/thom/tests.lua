local keymaps = require("thom.keymaps.tests")

require("neotest").setup({
	adapters = {
		require("neotest-go")({
			experimental = {
				test_table = true,
			},
			args = { "-count=1", "-timeout=60s" },
			recursive_run = true,
		}),
		require("neotest-python")({
			runner = "pytest",
			pytest_discover_instances = false,
			python = function()
				local base_env_path = require("venv-selector").get_active_venv()
				if base_env_path == nil then
					vim.notify("Please select a virtual environment first")
					return
				else
					return base_env_path .. "/bin/python"
				end
			end,
			-- is_test_file = function(file_path)
			--   return string.match(file_path)
			-- end,
		}),
	},
	strategies = {
		integrated = {
			width = 250,
		},
	},
	status = {
		virtual_text = true,
		signs = true,
	},
	summary = {
		animated = true,
		enabled = true,
		expand_errors = true,
		follow = true,
		mappings = keymaps.summary_mapping,
		open = "botright vsplit | vertical resize 80",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "neotest-*",
	callback = function(opts)
		vim.keymap.set("n", "q", function()
			vim.api.nvim_win_close(0, true)
		end, { buffer = opts.buf })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "neotest-output-panel",
	-- group = group,
	callback = function()
		vim.cmd("norm G")
	end,
})
