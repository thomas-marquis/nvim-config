return {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		go = { "gofmt" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		yaml = { "prettierd" },
		html = { "prettierd" },
		markdown = { "prettierd" },
		css = { "prettierd" },
		sass = { "prettierd" },
		scss = { "prettierd" },
		sql = { "sql_formatter" },
		sh = { "beautysh" },
		bash = { "beautysh" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		buf = { "buf" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters = {
		["clang-format"] = {
			prepend_args = { "-style", "Microsoft" },
		},
	},
}
