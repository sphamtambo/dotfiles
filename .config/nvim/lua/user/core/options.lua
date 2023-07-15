local opt = vim.opt -- for conciseness

-- show matching
opt.showmatch = true

-- save undo history even after closed the file
opt.undofile = true

-- set history save
opt.history = 10000

-- use linux system clipboard
opt.clipboard = "unnamedplus,unnamed"

-- mouse
opt.mouse = "a"

-- line numbers
opt.relativenumber = true
opt.number = true

-- scroll
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append "@-@"

-- dont redraw while executing macros
opt.lazyredraw = true

-- tabs and indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

-- line wrapping
opt.wrap = true
opt.textwidth = 79
opt.colorcolumn = "80"

-- display file info
-- opt.title = true

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- delete word
opt.iskeyword:append "-"

-- fat cursor
opt.guicursor = ""

-- fast update time
opt.updatetime = 50
