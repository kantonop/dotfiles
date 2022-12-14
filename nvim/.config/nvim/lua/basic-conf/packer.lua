return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'}}
  use 'nvim-lualine/lualine.nvim'
  use 'folke/tokyonight.nvim'

  use 'tpope/vim-fugitive'

  use {'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'hashivim/vim-terraform'
  use {'averms/black-nvim', run = ':UpdateRemotePlugins'}

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)
