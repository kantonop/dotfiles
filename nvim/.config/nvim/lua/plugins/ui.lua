local opts = {
  flavour = 'mocha',
  background = {
    dark = 'mocha',
  },
  integrations = {
    gitsigns = true,
    indent_blankline = { enabled = true },
    mason = true,
    neogit = true,
    telescope = { enabled = true },
  },
}

require('catppuccin').setup(opts)
vim.cmd.colorscheme('catppuccin-mocha')

require('nvim-web-devicons').setup {
  override = {
    zsh = { icon = '', color = '#428850', cterm_color = '65', name = 'Zsh' },
  },
  color_icons = true,
  default = true,
}

require('lualine').setup {
  options = {
    theme = 'catppuccin-nvim',
  },
}

require('ibl').setup {}

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = true,
      never_show_by_pattern = {
        ".git",
      },
    },
    group_empty_dirs = true,
  },
}

for _, mapping in ipairs({
  { '<leader>tt', function() require('neo-tree.command').execute({ toggle = true }) end, desc = '[T]oggle [T]ree' },
}) do
  vim.keymap.set('n', mapping[1], mapping[2], { desc = mapping.desc })
end
