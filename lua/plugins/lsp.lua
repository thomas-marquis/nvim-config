return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" }
      keys[#keys + 1] = { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" }
      keys[#keys + 1] = { "K", "<cmd>lua vim.lsp.buf.hover()<CR>" }
      keys[#keys + 1] = { "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>" }
      keys[#keys + 1] = { "gr", "<cmd>lua vim.lsp.buf.references()<CR>" }
      keys[#keys + 1] = { "gl", "<cmd>lua vim.diagnostic.open_float()<CR>" }
      keys[#keys + 1] = { "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>" }
      keys[#keys + 1] = { "<leader>li", "<cmd>LspInfo<cr>" }
      keys[#keys + 1] = { "<leader>lI", "<cmd>LspInstallInfo<cr>" }
      keys[#keys + 1] = { "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>" }
      keys[#keys + 1] = { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>" }
      keys[#keys + 1] = { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>" }
      keys[#keys + 1] = { "gR", "<cmd>lua vim.lsp.buf.rename()<cr>" }
      keys[#keys + 1] = { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>" }
      keys[#keys + 1] = { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>" }
    end,
  },
}
