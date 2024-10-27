local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TESTS
map("n", "<leader>ua", '<cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>', { desc = "Run all tests" })
map(
  "n",
  "<leader>uf",
  '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
  { desc = "Run tests in current file" }
)
map("n", "<leader>ut", '<cmd>lua require("neotest").run.run()<CR>', { desc = "Run test under cursor" })
map("n", "<leader>uq", '<cmd>lua require("neotest").run.stop()<CR>', { desc = "Stop running tests" })
map("n", "<leader>us", '<cmd>lua require("neotest").summary.toggle()<CR>', { desc = "Toggle test summary" })
map("n", "<leader>uo", '<cmd>lua require("neotest").output.open({ enter = true })<CR>', { desc = "Open test output" })

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

map("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("v", "<leader>tg", function()
  local tb = require("telescope.builtin")
  local text = vim.getVisualSelection()
  tb.live_grep({ default_text = text })
end, opts)
map(
  "n",
  "<leader>tf",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)
map("n", "<leader>tb", "<cmd>Telescope git_branches<cr>", opts)
map("n", "<leader>tc", "<cmd>Telescope git_commits<cr>", opts)
map("n", "<leader>ti", "<cmd>Telescope lsp_incoming_calls<cr>", opts)
map("n", "<leader>td", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
map("n", "<leader>tk", "<cmd>Telescope keymaps<cr>", opts)
map("n", "<leader>tm", "<cmd>lua require'telescope.builtin'.man_pages({sections = { 'ALL' }})<cr>", opts)

-- search
map("n", "<A-n>", "<cmd>noh<cr>", opts)

-- Outline
map("n", "<leader>oo", "<cmd>Outline<CR>", opts)

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
