local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- NORMAL
-- Moving between splits
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

k("n", "<leader>e", ":NvimTreeFocus<CR>", opts)

