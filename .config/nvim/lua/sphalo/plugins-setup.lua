local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd [[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]]

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return require("packer").startup(function(use)
  -- packer
  use "wbthomason/packer.nvim"

  -- lua functions that many plugins use
  use "nvim-lua/plenary.nvim"

  -- colorschemes
  -- -- use("bluz71/vim-nightfly-guicolors")
  -- -- use("ellisonleao/gruvbox.nvim")
  use "lunarvim/darkplus.nvim"
  use "navarasu/onedark.nvim"

  -- comment gcc
  use "numToStr/Comment.nvim"

  -- neovim tree file explore
  use "nvim-tree/nvim-tree.lua"

  -- icons for nvim tree
  use "nvim-tree/nvim-web-devicons"

  -- status bar
  use "nvim-lualine/lualine.nvim"

  -- fuzzy finding w/ telescope
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } -- dependency for better sorting performance
  use { "nvim-telescope/telescope.nvim", branch = "0.1.x" } -- fuzzy finder

  -- autocompletion
  use "hrsh7th/nvim-cmp" -- completion plugin
  use "hrsh7th/cmp-buffer" -- source for text in buffer
  use "hrsh7th/cmp-path" -- source for file system paths

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "saadparwaiz1/cmp_luasnip" -- for autocompletion
  use "rafamadriz/friendly-snippets" -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use "williamboman/mason.nvim" -- in charge of managing lsp servers, linters & formatters
  use "williamboman/mason-lspconfig.nvim" -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use "neovim/nvim-lspconfig" -- easily configure language servers
  use "hrsh7th/cmp-nvim-lsp" -- for autocompletion
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  }

  --- enhanced lsp uis
  use "onsails/lspkind.nvim" -- vs-code like icons for autocompletion

  -- formating and linting
  use "jose-elias-alvarez/null-ls.nvim"
  use "jayp0521/mason-null-ls.nvim"

  -- treesitter configuration
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      -- { "ikatyang/tree-sitter-markdown" },
      { "markedjs/marked" }, -- markdown
      { "markdown-it/markdown-it" }, -- markdown parser
    },
  }

  -- auto closing
  use "windwp/nvim-autopairs" -- autoclose parens, brackets, quotes, etc...
  use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" } -- autoclose tags

  -- doc string generator
  use {
    "danymat/neogen",
    config = function()
      require("neogen").setup {}
    end,
    requires = "nvim-treesitter/nvim-autopairs",
    tag = "*",
  }

  -- toggle terminal
  use "akinsho/toggleterm.nvim"

  -- gitsigns
  use "lewis6991/gitsigns.nvim"

  -- add/delete/change surroundings
  use "tpope/vim-surround"

  -- tmux & split window navigation
  use "christoomey/vim-tmux-navigator"

  -- interacting with GPT models from OpenAI
  use "Bryley/neoai.nvim"
  use "MunifTanjim/nui.nvim" -- nui dependency

  -- github copilot
  use "github/copilot.vim"

  -- vim indent guiides
  use {
    "lukas-reineke/indent-blankline.nvim",
  }

  -- neorg (org-mode for neovim)
  use {
    "nvim-neorg/neorg",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.itero"] = {}, -- Fast list/heading continuation
          ["core.integrations.treesitter"] = {}, --
          ["core.neorgcmd"] = {}, --
          ["core.mode"] = {}, --
          ["core.summary"] = {}, -- Loads summary
          ["core.journal"] = {}, --
          ["core.qol.toc"] = {}, --
          ["core.qol.todo_items"] = {}, --
          ["core.keybinds"] = {
            config = {
              default_keybinds = true,
              neorg_leader = " ",
            },
          }, -- Loads core.keybinds module, which provides keybinds for all the below modules
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                work = "~/repos/neorg/work",
                personal = "~/repos/neorg/personal",
                school = "~/repos/neorg/school",
                projects = "~/repos/neorg/projects",
              },
              default_workspace = "projects",
            },
          },
        },
      }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }
  -- markdown preview
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  }

  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
