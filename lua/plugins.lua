local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'nvim-lua/plenary.nvim',

  -- Colorscheme
  'EdenEast/nightfox.nvim',

  -- LSP
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  'jose-elias-alvarez/typescript.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'jay-babu/mason-null-ls.nvim',

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',

  -- Text
  'windwp/nvim-autopairs',
  'mg979/vim-visual-multi',
  'gelguy/wilder.nvim',
  'tpope/vim-surround',
  ({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }),

  -- Lualine
  "kyazdani42/nvim-web-devicons",
  ({
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  }),

  -- Teleskop
  ({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  }),

  -- tmux & split window navigation
  ("szw/vim-maximizer"), -- maximizes and restores current window

  -- git
  'tpope/vim-fugitive',
  ({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "right_align",
          delay = 100,
        },
      })
    end,
  }),

  -- LSP again
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'onsails/lspkind-nvim',

  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  'windwp/nvim-ts-autotag',
  'p00f/nvim-ts-rainbow',
  'axelvc/template-string.nvim',

  -- Style
  { 'j-hui/fidget.nvim',     branch = 'legacy' },

  -- Move in visual mode
  { 'echasnovski/mini.move', branch = 'stable' },

  -- Typescript helper
  'marilari88/twoslash-queries.nvim',

}

require("lazy").setup(plugins, opts)
