return {
    {
        "nvim-lua/popup.nvim",
        lazy = false,
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = false,
    },
    -- {
    --     "craftzdog/solarized-osaka.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },
    -- {
    --     "scottmckendry/cyberdream.nvim",
    --     lazy = false,
    --     priority = 1000,    
    -- },
    {
        'nvimdev/dashboard-nvim',
        -- enable = false,
        event = 'VimEnter',
        config = function()
          require('dashboard').setup {
            theme = "hyper", -- doom | hyper
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { desc = "󰊳 Packer Sync", group = "@property", action = "PackerSync", key = "u" },
                    {
                        icon = "",
                        icon_hl = "@variable",
                        desc = "Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },
                    {
                        desc = "| Tree",
                        group = "DiagnosticHint",
                        action = "NvimTreeToggle",
                        key = "n",
                    },
                    {
                        desc = "| Branches",
                        group = "DiagnosticHint",
                        action = "Telescope git_branches",
                        key = "b",
                    },
                    {
                        desc = "| Commits",
                        group = "DiagnosticHint",
                        action = "Telescope git_commits",
                        key = "c",
                    },
                    {
                        desc = "| Terminal",
                        group = "DiagnosticHint",
                        action = "ToggleTerm",
                        key = "t",
                    },
                    {
                        desc = "| VirtualEnvs",
                        group = "DiagnosticHint",
                        action = "VenvSelect",
                        key = "v",
                    },
                },
            },
          }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons', "nvim-telescope/telescope.nvim" }
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
			require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
		end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
          "SmiteshP/nvim-navic",
          "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "xiyaowong/transparent.nvim",
    },
    {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                },
            })
        end
    },
}
