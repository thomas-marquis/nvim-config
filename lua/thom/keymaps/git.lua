local M = {}

M.setup_keymaps = function()
	vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
	vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
	vim.keymap.set("n", "<leader>gy", ":Gdiffsplit<CR>", {})
	vim.keymap.set("n", "<leader>gl", ":Git log --oneline<CR>", {})
end

return M
