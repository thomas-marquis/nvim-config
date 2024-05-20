local M = {}

M.setup_keymaps = function()
	vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
	vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
	vim.keymap.set("n", "<leader>gy", ":Gdiffsplit<CR>", {})
	vim.keymap.set(
		"n",
		"<leader>gl",
		":Git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all<CR>",
		{}
	)
end

return M
