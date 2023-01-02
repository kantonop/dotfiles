return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- git plugins
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'nvim-lualine/lualine.nvim' -- status line
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'm4xshen/autoclose.nvim' -- Autoclose parentheses and quotes

  -- theme
  use 'navarasu/onedark.nvim'

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
end)
