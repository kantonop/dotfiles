return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('tokyonight-night')
    end,
    keys = {
      { '<leader>d', '<cmd>colorscheme tokyonight-night<CR>', mode = { 'n', 'v' }, desc = 'Use [d]ark colorscheme (tokyonight-night)' },
      { '<leader>l', '<cmd>colorscheme tokyonight-day<CR>', mode = { 'n', 'v' }, desc = 'Use [l]ight colorscheme (tokyonight-day)' },
    },
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
    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
  },
}
