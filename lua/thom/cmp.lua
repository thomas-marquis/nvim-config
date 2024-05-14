local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	vim.notify("An error occurred during cmp plugin loading")
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify("An error occurred during luasnip plugin loading")
	return
end

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

local ls = luasnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local ls_extras = require("luasnip.extras")
local r = ls_extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
	s(
		"#guard_h",
		fmt(
			[[
        #ifndef INCLUDE_{}_
        #define INCLUDE_{}_

        {}

        #endif // INCLUDE_{}_
        ]],
			{ i(1), r(1), i(0), r(1) }
		)
	),
})

local K = require("thom.keymaps.cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	mapping = K.mapping,

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},

	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},

	experimental = {
		ghost_text = true,
		native_menu = false,
	},
})
