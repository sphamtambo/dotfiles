-- import plugin safely
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

--setup
toggleterm.setup({
	size = 10,
	open_mapping = [[<c-\>]], --clr backslash
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

-- termimal window mapping
local keymap = vim.keymap -- for conciseness

function _G.set_terminal_keymaps()
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = 0 }

	-- keybinds
	keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- custom terminal
local Terminal = require("toggleterm.terminal").Terminal

-- htop
local htop = Terminal:new({ cmd = "htop", hidden = true })
function _HTOP_TOGGLE()
	htop:toggle()
end

-- python
local python = Terminal:new({ cmd = "python", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end

-- lazygit
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
