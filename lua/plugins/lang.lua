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
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      if vim.fn.has("win32") == 1 then
        require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/pythonw.exe"))
      else
        local venv_selector = require("venv-selector")
        local base_env_path = venv_selector.venv()
        if base_env_path == nil then
          vim.notify("Please select a virtual environment first")
          return
        else
          -- require("dap-python").setup(base_env_path .. "/bin/python")
          require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "venv/bin/python"))
        end
      end
    end,
  },
}
