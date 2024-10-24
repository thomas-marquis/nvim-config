return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup {
                size = 20,
                open_mapping = [[<c-t>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                persist_mode = true,
                direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            }

            function _G.set_terminal_keymaps()
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Switch to normal mode in terminal" })
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move to the left window from terminal" })
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]],
                    { desc = "Move to the bottom window from the terminal" })
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move to the top window from the terminal" })
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]],
                    { desc = "Move to the right window from the terminal" })
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Pass terminal in normal mode" })
            end

            vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

            function _LAZYGIT_TOGGLE()
                lazygit:toggle()
            end

            local node = Terminal:new({ cmd = "node", hidden = true })

            function _NODE_TOGGLE()
                node:toggle()
            end

            local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

            function _NCDU_TOGGLE()
                ncdu:toggle()
            end

            local htop = Terminal:new({ cmd = "htop", hidden = true })

            function _HTOP_TOGGLE()
                htop:toggle()
            end

            local python = Terminal:new({ cmd = "python", hidden = true })

            function _PYTHON_TOGGLE()
                python:toggle()
            end
        end,
    }
}
