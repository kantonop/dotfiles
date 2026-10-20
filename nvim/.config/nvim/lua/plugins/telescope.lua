local opts = {
  defaults = { mappings = { i = { ['<C-u>'] = false, ['<C-d>'] = false } } },
}

require('telescope').setup(opts)
if vim.fn.executable('make') == 1 then
  require('telescope').load_extension('fzf')
end

for _, mapping in ipairs({
  { '<leader>sf', function() require('telescope.builtin').git_files() end, desc = '[S]earch [F]iles' },
  { '<leader>se', function() require('telescope.builtin').find_files() end, desc = '[S]earch File [E]xplorer' },
  {
    '<leader>sb',
    function()
      require('telescope.builtin').buffers({
        attach_mappings = function(_, map)
          map({ 'i', 'n' }, '<C-d>', require('telescope.actions').delete_buffer)
          return true
        end,
      })
    end,
    desc = '[S]earch [B]uffers',
  },
  { '<leader>sh', function() require('telescope.builtin').help_tags() end, desc = '[S]earch [H]elp' },
  { '<leader>sw', function() require('telescope.builtin').grep_string() end, desc = '[S]earch current [W]ord' },
  { '<leader>sg', function() require('telescope.builtin').live_grep() end, desc = '[S]earch by [G]rep' },
  { '<leader>sd', function() require('telescope.builtin').diagnostics() end, desc = '[S]earch [D]iagnostics' },
  { '<leader>sr', function() require('telescope.builtin').lsp_references() end, desc = '[S]earch [R]eferences' },
}) do
  vim.keymap.set('n', mapping[1], mapping[2], { desc = mapping.desc })
end
