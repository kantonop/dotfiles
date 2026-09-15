return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable('make') == 1,
      },
    },
    opts = {
      defaults = { mappings = { i = { ['<C-u>'] = false, ['<C-d>'] = false } } },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      if vim.fn.executable('make') == 1 then
        require('telescope').load_extension('fzf')
      end
    end,
    keys = {
      { '<leader>sf', function() require('telescope.builtin').git_files() end, desc = '[S]earch [F]iles' },
      { '<leader>se', function() require('telescope.builtin').find_files() end, desc = '[S]earch File [E]xplorer' },
      { '<leader>sb', function() require('telescope.builtin').buffers() end, desc = '[S]earch [B]uffers' },
      { '<leader>sh', function() require('telescope.builtin').help_tags() end, desc = '[S]earch [H]elp' },
      { '<leader>sw', function() require('telescope.builtin').grep_string() end, desc = '[S]earch current [W]ord' },
      { '<leader>sg', function() require('telescope.builtin').live_grep() end, desc = '[S]earch by [G]rep' },
      { '<leader>sd', function() require('telescope.builtin').diagnostics() end, desc = '[S]earch [D]iagnostics' },
    },
  },
}
