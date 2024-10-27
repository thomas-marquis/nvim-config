return {
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofmt" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        yaml = { "prettierd" },
        html = { "prettierd" },
        markdown = { "prettierd" },
        css = { "prettierd" },
        sass = { "prettierd" },
        scss = { "prettierd" },
        sql = { "sql_formatter" },
        sh = { "beautysh" },
        bash = { "beautysh" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        buf = { "buf" },
      },
      format_on_save = {
        timeout_ms = 100,
        lsp_fallback = true,
      },
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
        ["clang-format"] = {
          prepend_args = { "-style", "Microsoft" },
        },
        black = {
          prepend_args = { "-l", "120" },
        },
      },
    },
  },
}
