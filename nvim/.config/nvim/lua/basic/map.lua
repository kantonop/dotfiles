-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- always center when moving to next search match
vim.keymap.set({ 'n', 'v' }, 'n', 'nzz', { desc = '[n]ext search and center' })
vim.keymap.set({ 'n', 'v' }, 'N', 'Nzz', { desc = '[N] previous search and center' })

-- always center when moving up/down half pages
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { desc = 'half page down and center' })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { desc = 'half page up and center' })

-- black python formatter
vim.keymap.set({ 'n', 'v' }, '<leader>fp', ':!black %<CR>', { silent = true, desc = '[F]ormat [P]ython File' })

-- open explore
vim.keymap.set('n', '<leader>ef', vim.cmd.Ex, { desc = '[E]xplore [F]iles' })

-- copy to and from clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', {desc = '[Y]ank to Clipboard Register'})
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', {desc = '[P]aste from Clipboard Register'})
