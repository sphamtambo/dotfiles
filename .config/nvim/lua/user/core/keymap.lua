local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }

-- set leader key to space
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------

-- use ii to exit insert mode
keymap.set("i", "ii", "<ESC>", opts)

-- insert mode movements
keymap.set("i", "<C-h>", "<Left>", opts)
keymap.set("i", "<C-j>", "<Down>", opts)
keymap.set("i", "<C-k>", "<Up>", opts)
keymap.set("i", "<C-l>", "<Right>", opts)

-- move highlighted text
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- clear search highlights
keymap.set("n", "<leader><space>", ":nohl<CR>", opts)

-- dont copy highlighted text to clipboard when pasting
keymap.set("v", "p", '"_dP', opts)

-- stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- date
keymap.set("n", "<leader>t", "i<C-r>=strftime('%Y-%m-%d %a %I:%M %p')<CR><ESC>", opts)

-- press * to search for term under cursor in normal mode selection
-- and then press a key below to replace all instances of it the current file
keymap.set("n", "<leader>r", ":%s///g<Left><Left>", opts)
keymap.set("n", "<leader>rc", ":%s///gc<Left><Left><Left>", opts) -- c to confirm individually

-- press * to search for term under cursor visual mode selection
-- and then press a key below to replace all instances of it the current file
keymap.set("v", "<leader>r", ":s///g<Left><Left>", opts)
keymap.set("v", "<leader>rc", ":s///gc<Left><Left><Left>", opts) -- c to confirm individually

-- delete single character without copying into register
keymap.set("n", "x", '"_x', opts)

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", opts) -- increment
keymap.set("n", "<leader>-", "<C-x>", opts) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- lazgit
keymap.set("n", "<leader>gt", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true }, opts) -- create a new lazgit terminal
-- toggle terminal
keymap.set("n", "<leader>py", "<cmd>lua _PYTHON_TOGGLE()<CR>", { noremap = true, silent = true }, opts) -- create a new python terminal
-- htop
keymap.set("n", "<leader>ht", "<cmd>lua _HTOP_TOGGLE()<CR>", { noremap = true, silent = true }, opts) -- create a new htop terminal

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- toggle file explorer

-- neogen
keymap.set("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts) -- class doc string
keymap.set("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts) -- func doc string

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- list available help tags
