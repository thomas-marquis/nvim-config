local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

k("n", "<leader>vs", "<cmd>VenvSelect<cr>", opts)
k("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", opts)
