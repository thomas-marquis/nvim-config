return {
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python",
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        lazy = false,
        branch = "regexp",
        config = function()
            require("venv-selector").setup({
                settings = {
                    search = {
                        pyenv = {
                            command = "$FD '/bin/python$' ~/.pyenv/versions --full-path --color never -E pkgs/ -E envs/ -L -u",
                        },
                    },
                },
            })
        end,
        keys = {
            { "<leader>vv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" },
            { "<leader>cv", false },
        },
    },
    {
        "nvimdev/dashboard-nvim",
        optional = true,
        opts = function(_, opts)
            local venvs = {
                desc = "Select Python Venv",
                group = "DiagnosticHint",
                action = "VenvSelect",
                key = "v",
            }

            venvs.desc = venvs.desc .. string.rep(" ", 43 - #venvs.desc)
            venvs.key_format = "  %s"

            table.insert(opts.config.center, 3, venvs)
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "linux-cultist/venv-selector.nvim" },
        config = function()
            local venv_selector = require("venv-selector")
            local base_env_path = venv_selector.venv()
            require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "venv/bin/python"))
            -- if base_env_path == nil then
            --   vim.notify("[DAP Python] Please select a virtual environment first")
            --   return
            -- else
            --   require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "venv/bin/python"))
            -- end
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            local util = require("lspconfig.util")
            local root_files = {
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                "pyrightconfig.json",
                ".git",
                "main.py",
            }
            opts.servers["pyright"] = vim.tbl_extend("force", opts.servers["pyright"] or {}, {
                root_dir = function(fname)
                    return util.root_pattern(unpack(root_files))(fname)
                end,
            })
        end,
    },
}
