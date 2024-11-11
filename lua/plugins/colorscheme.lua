return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      flavour = "frappe",
      highlight_overrides = {
        latte = function(colors)
          return {
            ["@lsp.type.keyword"] = { fg = colors.lavender },
            Cursor = { bg = colors.lavender },
          }
        end,
      },
    },
  },
}
