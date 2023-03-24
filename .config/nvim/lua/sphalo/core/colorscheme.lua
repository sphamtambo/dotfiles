vim.o.termguicolors = true
-- import plugin safely
local status, _ = pcall(vim.cmd, "colorscheme darkplus")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
