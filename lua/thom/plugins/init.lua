local lazy = require("lazy")

lazy.setup {
    require("thom.plugins.ui"),
    require("thom.plugins.markdown"),
    require("thom.plugins.completion"),
    require("thom.plugins.lsp"),
    require("thom.plugins.python"),
    require("thom.plugins.outline"),
    require("thom.plugins.fold"),
    require("thom.plugins.git"),
    require("thom.plugins.terminal"),
}
