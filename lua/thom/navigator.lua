require("navigator").setup {
  mason = true,
  debug = true,
  keymaps = {
    { key = 'gK',        func = vim.lsp.buf.definition, doc = 'definition' },
    { key = "<leader>o", func = "document_symbol()" },
  },
}
