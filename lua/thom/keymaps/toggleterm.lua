local M = {}

M.keymap_open = [[<c-t>]]

M.keymaps = function()
  local opts = {noremap = true}

  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-t><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-t><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-t><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-t><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-t><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-t><C-n><C-W>l]], opts)
end

return M
