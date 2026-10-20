require('sidekick').setup {
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
}

for _, mapping in ipairs({
  {
    '<leader>ai',
    function()
      require('sidekick.cli').toggle { name = 'codex', focus = true }
    end,
    desc = '[A][I] Toggle Codex',
  },
}) do
  vim.keymap.set('n', mapping[1], mapping[2], { desc = mapping.desc })
end
