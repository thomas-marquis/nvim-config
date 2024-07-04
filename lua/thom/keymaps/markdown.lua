local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-p>", "<cmd>MarkdownPreviewToggle<CR>", opts)
