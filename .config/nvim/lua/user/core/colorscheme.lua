vim.o.termguicolors = true
-- import plugin safely
local status, themes = pcall(vim.cmd, "colorscheme dracula")
if not status then
  print "Colorscheme not found!" -- print error if colorscheme not installed
  return
end
