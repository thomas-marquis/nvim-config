return {
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lpconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        opts = {
            auto_refresh = true,
            name = { "venv", ".venv" },
        },
        event = "VeryLazy",
        keys = {
            { "<leader>vs", "<cmd>VenvSelect<cr>",       desc = "Select python virtualenv" },
            { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Retrieve the venv from a cache (the one previously used for the same project directory)" },
        },
    }
}
