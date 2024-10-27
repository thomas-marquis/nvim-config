return {
  {
    "linux-cultist/venv-selector.nvim",
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
}
