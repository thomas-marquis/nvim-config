local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL
-- Moving between splits
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

k("n", "<leader>e", ":NvimTreeFocus<CR>", opts)

-- Resize with arrows
k("n", "<C-Up>", ":resize -2<CR>", opts)
k("n", "<C-Down>", ":resize +2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
k("n", "<S-l>", ":bnext<CR>", opts)
k("n", "<S-h>", ":bprevious<CR>", opts)
k("n", "bd", ":bprevious<bar>:bdelete #<CR>", opts)

-- Outline
k("n", "<leader>o", ":LspSymbols<CR>", opts)

-- Move text up and down
k("n", "<A-j>", ":m .+1<CR>==", opts)
k("n", "<A-k>", ":m .-2<CR>==", opts)

-- VISUAL
k("v", "<", "<gv^", opts)
k("v", ">", ">gv^", opts)

k("v", "y", "ygv", opts)

-- Move text up and down
k("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
k("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
k("v", "p", '"_dP', opts)

