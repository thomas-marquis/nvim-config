return {
    {
        "hedyhli/outline.nvim",
        lazy = true,
        config = function()
            require("outline").setup()
            vim.api.nvim_buf_set_keymap("n", "<leader>oo", "<cmd>Outline<CR>", { desc = "Toggle outline" })
        end
    },
}
