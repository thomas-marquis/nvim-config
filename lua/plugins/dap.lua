return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
      },
    },
  },
  -- {
  --   "theHamsta/nvim-dap-virtual-text",
  --   dependencies = {
  --     "jay-babu/mason-nvim-dap.nvim",
  --   },
  --   opts = function(_, opts)
  --     opts.display_callback = function(variable, _, _, _, options)
  --       local truncate_string = function(input, max_length)
  --         if #input > max_length then
  --           return string.sub(input, 1, max_length)
  --         else
  --           return input
  --         end
  --       end
  --
  --       -- by default, strip out new line characters
  --       if options.virt_text_pos == "inline" then
  --         return " = " .. truncate_string(variable.value:gsub("%s+", " "), 100)
  --       else
  --         return variable.name .. " = " .. truncate_string(variable.value:gsub("%s+", " "), 100)
  --       end
  --     end
  --   end,
  -- },
}
