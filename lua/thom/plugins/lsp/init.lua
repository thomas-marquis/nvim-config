return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            local servers = {
                "clangd",
                "gopls",
                "lua_ls",
                "pyright",
                "yamlls",
                "helm_ls",
                "bufls",
                "dockerls",
                "bashls",
                "helm_ls",
            }
            require("mason").setup {
                log_level = vim.log.levels.INFO,
                max_concurrent_installers = 4,
            }

            local lspconfig = require("mason-lspconfig")
            lspconfig.setup({
                ensure_installed = servers,
                automatic_installation = true,
            })

            local opts = {}
            local handlers = require("thom.plugins.lsp.handlers")
            for _, server in pairs(servers) do
                opts = {
                    on_attach = handlers.on_attach,
                    capabilities = handlers.capabilities,
                }

                server = vim.split(server, "@")[1]

                local require_ok, conf_opts = pcall(require, "thom.lsp.settings." .. server)
                if require_ok then
                    opts = vim.tbl_deep_extend("force", conf_opts, opts)
                end
                lspconfig[server].setup(opts)
            end
        end,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure {
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                delay = 100,
            }
        end,
    },
}
