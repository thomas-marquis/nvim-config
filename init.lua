require "thom.options"
require "thom.plugins"
require "thom.colorscheme"
require "thom.cmp"
require "thom.keymaps"
require "thom.lsp"
require "thom.toggleterm"
require "thom.bufferline"
require "thom.navigator"

-- nvim-tree:
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- autoclose
require("autoclose").setup()

-- clipboard TODO
vim.api.nvim_set_option("clipboard", "unnamed") 

