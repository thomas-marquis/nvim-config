local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

return {
	setup_keymaps = function()
		-- Exécuter tous les tests
		map("n", "<leader>ua", '<cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>', opts)

		-- Exécuter les tests dans le fichier actuel
		map("n", "<leader>uf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)

		-- Exécuter le test sous le curseur
		map("n", "<leader>ut", '<cmd>lua require("neotest").run.run()<CR>', opts)

		-- Arrêter l'exécution des tests
		map("n", "<leader>uq", '<cmd>lua require("neotest").run.stop()<CR>', opts)

		-- Afficher les résultats des tests
		map("n", "<leader>us", '<cmd>lua require("neotest").summary.toggle()<CR>', opts)

		-- Ouvrir la fenêtre flottante des résultats des tests
		map("n", "<leader>uo", '<cmd>lua require("neotest").output.open({ enter = true })<CR>', opts)
	end,
	summary_mapping = {
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
}
