local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- NORMAL
-- Move
map("n", "<leader>j", "15j", opts)
map("n", "<leader>k", "15k", opts)

-- Moving between splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "bd", "<cmd>bprevious<bar>:bdelete #<CR>", opts)

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
map("n", "<A-n>", "<cmd>noh<cr>", opts)

-- Move text up and down
map("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>==", opts)

-- VISUAL
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)
map("v", "y", "ygv", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "p", '"_dP', opts)

-- INSERT
map("i", "<A-h>", "<Left>", opts)
map("i", "<A-j>", "<Down>", opts)
map("i", "<A-k>", "<Up>", opts)
map("i", "<A-l>", "<Right>", opts)

map("i", "<A-e>", "<C-Right>", opts)
map("i", "<A-b>", "<C-Left>", opts)

map("i", "<A-L>", "<End>", opts)

-- TERMINAL
---- floating terminal
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
map("n", "<C-t>", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<C-T>", function()
  LazyVim.terminal()
end, { desc = "Terminal (cwd)" })

-- Terminal Mappings
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
