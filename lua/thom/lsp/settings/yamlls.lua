return {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	},
	on_attach = function(client, bufnr)
		if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
			vim.diagnostic.enable(false)
		end
	end,
}
