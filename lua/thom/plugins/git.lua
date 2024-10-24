return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()

            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>",
                { desc = "Git preview teh diffs for the current changed lines of code" })
            vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>",
                { desc = "Toggle git blame for the current line" })
            vim.keymap.set("n", "<leader>gy", ":Gdiffsplit<CR>", { desc = "Git diff the current file" })
            vim.keymap.set(
                "n",
                "<leader>gl",
                ":Git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all<CR>",
                { desc = "Git log" }
            )
        end,
    },
    {
        "tpope/vim-fugitive",
    },
}
