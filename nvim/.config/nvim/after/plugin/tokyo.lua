-- Default
vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[colorscheme tokyonight-day]]

-- Map keys for quick switch between themes
vim.keymap.set({'n', 'v'}, '<leader>d', ':colorscheme tokyonight-night<CR>', {desc = 'Use [d]ark colorscheme (tokyonight-night)'})
vim.keymap.set({'n', 'v'}, '<leader>l', ':colorscheme tokyonight-day<CR>', {desc = 'Use [l]ight colorscheme (tokyonight-day)'})
