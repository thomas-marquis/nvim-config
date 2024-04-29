local status_ok, outline = pcall(require, "outline")
if not status_ok then
  vim.notify("An error occured during loading outline")
  return
end

outline.setup({})
