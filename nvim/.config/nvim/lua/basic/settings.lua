-- [[ Setting options ]]
-- See `:help vim.o`

-- Highlight line and column of cursor
--vim.wo.cursorline = true
--vim.wo.cursorcolumn = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- tabs
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Set highlight on search
vim.o.hlsearch = false

-- number of lines to keep when navigating close to edges
vim.o.scrolloff = 8

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.wildmode = 'longest:full'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
