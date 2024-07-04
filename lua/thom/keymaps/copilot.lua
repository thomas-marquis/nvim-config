local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", opts)

map("v", "<leader>ce", "<cmd>CopilotChatExplain<CR>", opts)
map("v", "<leader>cr", "<cmd>CopilotChatReview<CR>", opts)
map("v", "<leader>cf", "<cmd>CopilotChatFix<CR>", opts)
map("v", "<leader>co", "<cmd>CopilotChatOptimize<CR>", opts)
map("v", "<leader>cd", "<cmd>CopilotChatDocs<CR>", opts)
map("v", "<leader>ct", "<cmd>CopilotChatTests<CR>", opts)
map("v", "<leader>cF", "<cmd>CopilotChatFixDiagnostic<CR>", opts)
