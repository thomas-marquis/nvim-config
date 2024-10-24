local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
    vim.notify("An error occurred during luasnip plugin loading")
    return
end

ls.config.setup({
    updateevents = "TextChanged,TextChangedI",
})

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

ls.add_snippets("cpp", require("thom.snipets.cpp"))
ls.add_snippets("go", require("thom.snipets.go"))

return ls
