require("thom.options")
require("thom.plugins")
require("thom.colorscheme")
require("thom.cmp")
require("thom.lsp")
require("thom.bufferline")
require("thom.telescope")
require("thom.treesitter")
require("thom.outline")
require("thom.lualine")
require("thom.venv-selector")
require("thom.comments")
require("thom.fold")
require("thom.tests")

require("thom.keymaps")

-- nvim-tree:
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

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
require("ufo").setup({ fold_virt_text_handler = require("thom.fold").handler })
