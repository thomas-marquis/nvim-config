return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
		},
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)

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
					mappings = {
						attach = "a",
						clear_marked = "M",
						clear_target = "T",
						debug = "d",
						debug_marked = "D",
						expand = { "<CR>", "<2-LeftMouse>" },
						expand_all = "e",
						help = "?",
						jumpto = "i",
						mark = "m",
						next_failed = "J",
						output = "o",
						prev_failed = "K",
						run = "r",
						run_marked = "R",
						short = "O",
						stop = "u",
						target = "t",
						watch = "w",
					},
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

			vim.keymap.set("n", "<leader>ua", '<cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>', {desc = "Execute all tests"})
			vim.keymap.set("n", "<leader>uf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', {desc = "Execute current test file"})
			vim.keymap.set("n", "<leader>ut", '<cmd>lua require("neotest").run.run()<CR>', {desc = "Execute current test"})
			vim.keymap.set("n", "<leader>uq", '<cmd>lua require("neotest").run.stop()<CR>', {desc = "Stop current test execution"})
			vim.keymap.set("n", "<leader>us", '<cmd>lua require("neotest").summary.toggle()<CR>', {desc = "Display tests summary"})
			vim.keymap.set("n", "<leader>uo", '<cmd>lua require("neotest").output.open({ enter = true })<CR>', {desc = "Displau current test result output"})
		end,
	},
}
