local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

k("n", "<leader>ut", ":TestNearest<CR>", opts)
k("n", "<leader>uy", ":TestFile<CR>", opts)
k("n", "<leader>ua", ":TestSuite<CR>", opts)
k("n", "<leader>ul", ":TestLast<CR>", opts)
