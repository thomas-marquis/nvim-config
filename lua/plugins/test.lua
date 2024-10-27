return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-golang"] = {
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s" },
          recursive_run = true,
        },
        ["neotest-python"] = {
          runner = "pytest",
          pytest_discover_instances = false,
          python = function()
            local base_env_path = require("venv-selector").get_active_venv()
            if base_env_path == nil then
              vim.notify("Please select a virtual environment first")
              return
            else
              return base_env_path .. "/bin/python"
            end
          end,
          -- is_test_file = function(file_path)
          --   return string.match(file_path)
          -- end,
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    opts = function(_, opts)
      opts.summary = vim.tbl_deep_extend("force", opts.summary, {
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
