local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Error while loading lspconfig")
  return
end

require "thom.lsp.mason"
require("thom.lsp.handlers").setup()
