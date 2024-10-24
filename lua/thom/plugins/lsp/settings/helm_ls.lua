local nvim_lsp = require("lspconfig")

vim.filetype.add({
	pattern = {
		[".*/templates/.*%.yaml"] = "helm",
		[".*/templates/.*%.tpl"] = "helm",
	},
})

return {
	root_dir = nvim_lsp.util.root_pattern("Chart.yaml", "Chart.yml", "**/Chart.yaml", "**/Chart.yml"),
	filetypes = { "yaml", "helm" },
}
