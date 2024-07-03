local nvim_lsp = require("lspconfig")

return {
	root_dir = nvim_lsp.util.root_pattern("Chart.yaml", "Chart.yml"),
}
