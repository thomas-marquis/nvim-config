local colorscheme = "cyberdream"

if colorscheme == "cyberdream" then
	require("cyberdream").setup({
		-- Enable transparent background
		transparent = true,

		-- Enable italics comments
		italic_comments = true,

		-- Replace all fillchars with ' ' for the ultimate clean look
		hide_fillchars = false,

		-- Modern borderless telescope theme
		borderless_telescope = true,

		-- Set terminal colors used in `:terminal`
		terminal_colors = true,

		theme = {
			variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
			-- highlights = {
			-- 	-- Highlight groups to override, adding new groups is also possible
			-- 	-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
			--
			-- 	-- Example:
			-- 	-- Comment = { fg = "#696969", bg = "NONE", italic = true },
			--
			-- 	-- Complete list can be found in `lua/cyberdream/theme.lua`
			-- },
		},
	})
elseif colorscheme == "neosolarized" then
	require("neosolarized").setup({
		comment_italics = true,
		background_set = false,
	})
end

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	vim.notify("Color scheme" .. colorscheme .. " not found! Maybe you have to install the plugin")
	return
end
