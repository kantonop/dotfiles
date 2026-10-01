return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'mocha',
      background = {
        dark = 'mocha',
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        neogit = true,
        telescope = { enabled = true },
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    opts = {
      override = {
        zsh = { icon = '', color = '#428850', cterm_color = '65', name = 'Zsh' },
      },
      color_icons = true,
      default = true,
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'catppuccin',
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
  },
}
