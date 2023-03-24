-- enable mason
require("mason").setup()

-- list of servers for mason to install
require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
		"bashls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

-- list of formaters ans linters for mason null ls to install
require("mason-null-ls").setup({
	ensure_installed = {
		"stylua",
		"black",
		"isort",
		"flake8",
		"selene",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
