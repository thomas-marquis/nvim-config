local colorscheme = "monokai-pro-ristretto"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("Color scheme" .. colorscheme .. " not found! Maybe you have to install the plugin")
  return
end

