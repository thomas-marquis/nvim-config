return {
  {
    "hedyhli/outline.nvim",
    keys = { { "<leader>oo", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
    opts = {
      symbols = {
        ---@type outline.FilterConfig?
        filter = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          "Package",
          "Property",
          "Struct",
          "Trait",
          "Variable",
        },
      },
      outline_window = {
        position = "right",
        split_command = nil,
        width = 25,
        relative_width = true,
        wrap = false,
        focus_on_open = true,
        auto_close = false,
        auto_jump = false,
        show_numbers = false,
        show_relative_numbers = false,
        ---@type boolean|string?
        show_cursorline = true,
        hide_cursor = false,
        winhl = "",
        jump_highlight_duration = 400,
        center_on_jump = true,
      },
      keymaps = {
        show_help = "?",
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        peek_location = "o",
        goto_and_close = "<S-Cr>",
        restore_location = "<C-g>",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        fold_toggle = "<tab>",
        fold_toggle_all = "<S-tab>",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
        down_and_jump = "<C-j>",
        up_and_jump = "<C-k>",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>tg", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Grep" },
      {
        "<leader>tg",
        function()
          local tb = require("telescope.builtin")
          local text = vim.getVisualSelection()
          tb.live_grep({ default_text = text })
        end,
        mode = "v",
        desc = "Grep",
      },

      { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
      { "<leader>tb", "<cmd>Telescope git_branches<cr>", desc = "Telescope Git Branches" },
      { "<leader>tc", "<cmd>Telescope git_commits<cr>", desc = "Telescope Git Commits" },
      { "<leader>ts", "<cmd>Telescope git_status<CR>", desc = "Telescope git Status" },
      { "<leader>ti", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Telescope LSP Incoming Calls" },
      { "<leader>td", "<cmd>Telescope diagnostics<cr>", desc = "Telescope Diagnostics" },
      { "<leader>tk", "<cmd>Telescope keymaps<cr>", desc = "Telescope Keymaps" },
      {
        "<leader>tm",
        "<cmd>lua require'telescope.builtin'.man_pages({sections = { 'ALL' }})<cr>",
        desc = "Telescope man pages",
      },
    },
    ---@param opts table
    opts = function(_, opts)
      local actions = require("telescope.actions")
      opts.defaults.mappings = vim.tbl_extend("force", opts.defaults.mappings or {}, {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-c>"] = actions.close,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<A-k>"] = actions.preview_scrolling_up,
          ["<A-j>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        },
        n = {
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,
        },
      })
    end,
  },
}
