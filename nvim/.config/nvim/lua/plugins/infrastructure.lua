return {
  {
    'qvalentin/helm-ls.nvim',
    ft = 'helm',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      -- Keep the useful filetype, block highlighting, and % navigation without
      -- changing template text presentation through experimental virtual text.
      conceal_templates = { enabled = false },
      indent_hints = { enabled = false },
    },
  },
  {
    'pearofducks/ansible-vim',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('ansible').setup()
    end,
  },
}
