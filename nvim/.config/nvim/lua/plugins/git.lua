require('neogit').setup {
  graph_style = 'unicode',
  kind = 'tab',
  integrations = {
    telescope = true,
  },
  auto_refresh = true,
  filewatcher = {
    enabled = true,
    interval = 1000,
  },
  remember_settings = true,
  use_per_project_settings = true,
  prompt_force_push = true,
  prompt_amend_commit = true,
  disable_insert_on_commit = 'auto',
  commit_editor = {
    kind = 'tab',
    show_staged_diff = true,
    staged_diff_split_kind = 'split',
    spell_check = true,
  },
  sections = {
    stashes = { folded = true },
    unpulled_upstream = { folded = true },
    unpulled_pushRemote = { folded = true },
    recent = { folded = true },
    rebase = { folded = true },
  },
}

for _, mapping in ipairs({
  { '<leader>gg', '<cmd>Neogit<CR>', desc = '[G]it [G] Neogit' },
}) do
  vim.keymap.set('n', mapping[1], mapping[2], { desc = mapping.desc })
end

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}
