return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-golang"] = {
          go_test_args = { "-count=1", "-timeout=30s" },
          testify_enabled = true,
        },
        ["neotest-python"] = {
          runner = "pytest",
          pytest_discover_instances = true,
          ---@return string?
          python = function()
            local venv_selector = require("venv-selector")
            local base_env_path = venv_selector.venv()
            if base_env_path == nil then
              vim.notify("Please select a virtual environment first")
              return
            else
              return base_env_path .. "/bin/python"
            end
          end,
          ---@param file_path string
          ---@return boolean
          is_test_file = function(file_path)
            local filename = file_path:match("^.+/(.+)$")
            if filename and filename:match("^test.*%.py$") then
              return true
            else
              return false
            end
          end,
        },
      },
    },
    dependencies = {
      "linux-cultist/venv-selector.nvim",
      "nvim-neotest/neotest-python",
      "fredrikaverpil/neotest-golang",
    },
    keys = {
      { "<leader>ts", false },
      { "<leader>u", "", desc = "+test" },
      {
        "<leader>uf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File",
      },
      {
        "<leader>ua",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All Test Files",
      },
      {
        "<leader>ut",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest",
      },
      {
        "<leader>ul",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>us",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary",
      },
      {
        "<leader>uo",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Show Output",
      },
      {
        "<leader>uO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel",
      },
      {
        "<leader>uq",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop",
      },
      {
        "<leader>uw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Toggle Watch",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    ---@param opts neotest.Config
    opts = function(_, opts)
      opts.summary = vim.tbl_deep_extend("force", opts.summary or {}, {
        animated = true,
        enabled = true,
        expand_errors = true,
        follow = true,
        mappings = {
          attach = "a",
          clear_marked = "M",
          clear_target = "T",
          debug = "d",
          debug_marked = "D",
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          help = "?",
          jumpto = "i",
          mark = "m",
          next_failed = "J",
          output = "o",
          prev_failed = "K",
          run = "r",
          run_marked = "R",
          short = "O",
          stop = "u",
          target = "t",
          watch = "w",
        },
        open = "botright vsplit | vertical resize 80",
      })
    end,
  },
}
