return {
    -- {
    --     "linux-cultist/venv-selector.nvim",
    --     dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    --     opts = {
    --         auto_refresh = true,
    --         name = { "venv", ".venv" },
    --     },
    --     event = "VeryLazy",
    --     keys = {
    --         { "<leader>vs", "<cmd>VenvSelect<cr>",       desc = "Select python virtualenv" },
    --         { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Retrieve the venv from a cache (the one previously used for the same project directory)" },
    --     },
    -- },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
          "neovim/nvim-lspconfig",
          "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
          { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        lazy = false,
        branch = "regexp", -- This is the regexp branch, use this for the new version
        config = function()
            require("venv-selector").setup()
        end,
        keys = {
            { "<leader>vs", "<cmd>VenvSelect<cr>",       desc = "Select python virtualenv" },
            { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Retrieve the venv from a cache (the one previously used for the same project directory)" },
        },
    }
}
