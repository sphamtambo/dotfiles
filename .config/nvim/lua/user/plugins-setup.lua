local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {

  -- lua functions that many plugins
  "nvim-lua/plenary.nvim",

  -- colorschemes
  -- -- ("bluz71/vim-nightfly-guicolors")
  -- -- ("ellisonleao/gruvbox.nvim")
  "lunarvim/darkplus.nvim",
  "navarasu/onedark.nvim",

  -- comment gcc
  "numToStr/Comment.nvim",

  -- neovim tree file explore
  "nvim-tree/nvim-tree.lua",

  -- icons for nvim tree
  "nvim-tree/nvim-web-devicons",

  -- status bar
  "nvim-lualine/lualine.nvim",

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

  -- autocompletion
  "hrsh7th/nvim-cmp", -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path", -- source for file system paths

  -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "saadparwaiz1/cmp_luasnip", -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
  "hrsh7th/cmp-nvim-lsp", -- for autocompletion
  {
    "nvimdev/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
      -- remember to TS Install markdown && markdown_inline
    },
  },

  --- enhanced lsp uis
  "onsails/lspkind.nvim", -- vs-code like icons for autocompletion

  -- formating and linting
  "jose-elias-alvarez/null-ls.nvim",
  "jayp0521/mason-null-ls.nvim",

  -- treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    -- requires = {
    -- { "ikatyang/tree-sitter-markdown" },
    { "markedjs/marked" }, -- markdown
    { "markdown-it/markdown-it" }, -- markdown parser
  },

  -- auto closing
  -- "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

  -- autoclose tags
  { "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter" } },

  -- doc string generator
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },

  -- toggle terminal
  "akinsho/toggleterm.nvim",

  -- gitsigns
  "lewis6991/gitsigns.nvim",

  -- add/delete/change surroundings
  "tpope/vim-surround",

  -- tmux & split window navigation
  "christoomey/vim-tmux-navigator",

  -- interacting with GPT models from OpenAI
  "Bryley/neoai.nvim",
  "MunifTanjim/nui.nvim", -- nui dependency

  -- github copilot
  "github/copilot.vim",

  -- vim indent guiides
  "lukas-reineke/indent-blankline.nvim",

  -- neorg (org-mode for neovim)
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
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
  },

  -- markdown preview
  "iamcco/markdown-preview.nvim",

  -- debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui" },
      { "theHamsta/nvim-dap-virtual-text" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "mfussenegger/nvim-dap-python" },
    },
  },
}
