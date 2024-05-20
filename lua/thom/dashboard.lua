require("dashboard").setup({
	theme = "hyper", -- doom | hyper
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = "󰊳 Packer Sync", group = "@property", action = "PackerSync", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Tree",
				group = "DiagnosticHint",
				action = "NvimTreeToggle",
				key = "t",
			},
		},
	},
})
