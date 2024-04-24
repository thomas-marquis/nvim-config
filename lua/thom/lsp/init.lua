local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "thom.lsp.mason"
require("thom.lsp.handlers").setup()
