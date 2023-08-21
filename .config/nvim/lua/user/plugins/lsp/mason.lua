-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

-- list of servers for mason to install
mason_lspconfig.setup {
  ensure_installed = {
    "pyright",
    "clangd",
    "lua_ls",
    "bashls",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}

-- list of formaters ans linters for mason null ls to install
mason_null_ls.setup {
  ensure_installed = {
    "clang-format",
    "stylua",
    "black",
    "isort",
    "flake8",
    "mypy",
    "selene",
    "bebugpy",
    "codelldb",
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
}
