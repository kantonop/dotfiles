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
        '<leader>ai',
        function()
          require('sidekick.cli').toggle { name = 'codex', focus = true }
        end,
        desc = '[A][I] Toggle Codex',
      },
    },
  },
}
