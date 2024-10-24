return {
    {
        "hedyhli/outline.nvim",
        lazy = true,
        config = function()
            require("outline").setup()
            vim.keymap.set("n", "<leader>oo", "<cmd>Outline<CR>", { desc = "Toggle outline" })
        end
    },
}
