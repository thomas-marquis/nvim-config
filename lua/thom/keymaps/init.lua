local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local _ = require("thom.keymaps.nvim-tree")
local _ = require("thom.keymaps.vim-test")
local _ = require("thom.keymaps.venv-select")
local _ = require("thom.keymaps.fold")

-- NORMAL
-- Move
k("n", "<leader>j", "15j", opts)
k("n", "<leader>k", "15k", opts)

-- Moving between splits
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
k("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
k("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
k("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
k("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
k("n", "<S-l>", "<cmd>bnext<CR>", opts)
k("n", "<S-h>", "<cmd>bprevious<CR>", opts)
k("n", "bd", "<cmd>bprevious<bar>:bdelete #<CR>", opts)

-- Telescope
k(
	"n",
	"<leader>tf",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
k("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)

-- Outline
k("n", "<leader>oo", "<cmd>Outline<CR>", opts)

-- Move text up and down
k("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
k("n", "<A-k>", "<cmd>m .-2<CR>==", opts)

-- VISUAL
k("v", "<", "<gv^", opts)
k("v", ">", ">gv^", opts)
k("v", "y", "ygv", opts)

-- Move text up and down
k("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
k("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
k("v", "p", '"_dP', opts)

-- INSERT
k("i", "<A-h>", "<Left>", opts)
k("i", "<A-j>", "<Down>", opts)
k("i", "<A-k>", "<Up>", opts)
k("i", "<A-l>", "<Right>", opts)

k("i", "<A-e>", "<C-Right>", opts)
k("i", "<A-b>", "<C-Left>", opts)

k("i", "<A-L>", "<End>", opts)
