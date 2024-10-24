return {
    {
        "github/copilot.vim",
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
          { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
          { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken",
        opts = {
          debug = true,
        },
        config = function()
            vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", {desc = "Toggle Copilot Chat"})
            vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<CR>", {desc = "Explain code with Copilot"})
            vim.keymap.set("v", "<leader>cr", "<cmd>CopilotChatReview<CR>", {desc = "Review code with Copilot"})
            vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatFix<CR>", {desc = "Fix code with Copilot"})
            vim.keymap.set("v", "<leader>co", "<cmd>CopilotChatOptimize<CR>", {desc = "Optimize code with Copilot"})
            vim.keymap.set("v", "<leader>cd", "<cmd>CopilotChatDocs<CR>", {desc = "Get documentation with Copilot"})
            vim.keymap.set("v", "<leader>ct", "<cmd>CopilotChatTests<CR>", {desc = "Run tests with Copilot"})
            vim.keymap.set("v", "<leader>cF", "<cmd>CopilotChatFixDiagnostic<CR>", {desc = "Fix diagnostic with Copilot"})
        end,
    },
}