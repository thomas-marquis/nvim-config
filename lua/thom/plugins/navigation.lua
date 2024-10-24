return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            }

            vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFocus<CR>", {desc = "NvimTree: Focus"})
            vim.api.nvim_set_keymap("n", "<leader>z", ":NvimTreeFindFile<CR>", {desc = "NvimTree: Find File"})
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            local k = vim.keymap.set

            k("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
            k("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
            k("n", "<C-k>", api.node.show_info_popup, opts("Info"))
            k("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
            k("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
            k("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
            k("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
            k("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
            k("n", "<CR>", api.node.open.edit, opts("Open"))
            k("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
            k("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
            k("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
            k("n", ".", api.node.run.cmd, opts("Run Command"))
            k("n", "-", api.tree.change_root_to_parent, opts("Up"))
            k("n", "a", api.fs.create, opts("Create File Or Directory"))
            k("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
            k("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
            k("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
            k("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
            k("n", "c", api.fs.copy.node, opts("Copy"))
            k("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
            k("n", "gk", api.node.navigate.git.prev, opts("Prev Git"))
            k("n", "gj", api.node.navigate.git.next, opts("Next Git"))
            k("n", "d", api.fs.remove, opts("Delete"))
            k("n", "D", api.fs.trash, opts("Trash"))
            k("n", "E", api.tree.expand_all, opts("Expand All"))
            k("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
            k("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
            k("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
            k("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
            k("n", "f", api.live_filter.start, opts("Live Filter: Start"))
            k("n", "g?", api.tree.toggle_help, opts("Help"))
            k("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
            k("n", "ge", api.fs.copy.basename, opts("Copy Basename"))
            k("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
            k("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
            k("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
            k("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
            k("n", "L", api.node.open.toggle_group_empty, opts("Toggle Group Empty"))
            k("n", "M", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
            k("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
            k("n", "o", api.node.open.edit, opts("Open"))
            k("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
            k("n", "p", api.fs.paste, opts("Paste"))
            k("n", "P", api.node.navigate.parent, opts("Parent Directory"))
            k("n", "q", api.tree.close, opts("Close"))
            k("n", "r", api.fs.rename, opts("Rename"))
            k("n", "R", api.tree.reload, opts("Refresh"))
            k("n", "s", api.node.run.system, opts("Run System"))
            k("n", "S", api.tree.search_node, opts("Search"))
            k("n", "u", api.fs.rename_full, opts("Rename: Full Path"))
            k("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
            k("n", "W", api.tree.collapse_all, opts("Collapse"))
            k("n", "x", api.fs.cut, opts("Cut"))
            k("n", "y", api.fs.copy.filename, opts("Copy Name"))
            k("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
            k("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
            k("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
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
                    },
                },
                pickers = {
                    planets = {
                        show_pluto = true,
                    },
                },
            })

            vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", {desc = "Telescope: Live Grep"})
            vim.keymap.set("v", "<leader>tg", function()
                local tb = require("telescope.builtin")
                local text = vim.getVisualSelection()
                tb.live_grep({ default_text = text })
            end, {desc = "Telescope: Live Grep (Visual)"})
            vim.keymap.set(
                "n",
                "<leader>tf",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
                {desc = "Telescope: Find Files"}
            )
            vim.keymap.set("n", "<leader>tb", "<cmd>Telescope git_branches<cr>", {desc = "Telescope: Git Branches"})
            vim.keymap.set("n", "<leader>tc", "<cmd>Telescope git_commits<cr>", {desc = "Telescope: Git Commits"})
            vim.keymap.set("n", "<leader>ti", "<cmd>Telescope lsp_incoming_calls<cr>", {desc = "Telescope: LSP Incoming Calls"})
            vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics bufnr=0<cr>", {desc = "Telescope: Diagnostics"})
            vim.keymap.set("n", "<leader>tk", "<cmd>Telescope keymaps<cr>", {desc = "Telescope: Keymaps"})
            vim.keymap.set("n", "<leader>tm", "<cmd>lua require'telescope.builtin'.man_pages({sections = { 'ALL' }})<cr>", {desc = "Telescope: search in man pages"})
        end,
    },
}
