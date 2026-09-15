return {
  {
    'folke/sidekick.nvim',
    opts = {
      -- Next Edit Suggestions require GitHub Copilot; this setup uses AI CLIs only.
      nes = { enabled = false },
      cli = {
        picker = 'telescope',
        watch = true,
        win = {
          layout = 'right',
          split = { width = 80 },
        },
      },
    },
    keys = {
      {
        '<leader>aa',
        function()
          require('sidekick.cli').toggle { name = 'codex', focus = true }
        end,
        desc = '[A]I Toggle Codex',
      },
      {
        '<leader>as',
        function()
          require('sidekick.cli').select { filter = { installed = true } }
        end,
        desc = '[A]I [S]elect Agent',
      },
      {
        '<leader>ap',
        function()
          require('sidekick.cli').prompt()
        end,
        mode = { 'n', 'x' },
        desc = '[A]I [P]rompt',
      },
      {
        '<leader>af',
        function()
          require('sidekick.cli').send { msg = '{file}' }
        end,
        desc = '[A]I Send [F]ile',
      },
      {
        '<leader>av',
        function()
          require('sidekick.cli').send { msg = '{selection}' }
        end,
        mode = 'x',
        desc = '[A]I Send [V]isual Selection',
      },
      {
        '<leader>ad',
        function()
          require('sidekick.cli').send {
            msg = 'Fix these diagnostics in {file}:\n{diagnostics}',
          }
        end,
        desc = '[A]I Fix [D]iagnostics',
      },
    },
  },
}
