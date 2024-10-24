local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end

-- search
k("n", "<A-n>", "<cmd>noh<cr>", opts)

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
