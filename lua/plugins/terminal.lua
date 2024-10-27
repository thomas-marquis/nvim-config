return {
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local venvs = {
        desc = "| Terminal",
        group = "DiagnosticHint",
        action = "ToggleTerm",
        key = "t",
      }
      venvs.desc = venvs.desc .. string.rep(" ", 43 - #venvs.desc)
      venvs.key_format = "  %s"

      table.insert(opts.config.center, 3, venvs)
    end,
  },
}
