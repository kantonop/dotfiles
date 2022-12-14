vim.g.mapleader = " "

-- always center when moving to next search match
vim.keymap.set({"n", "v"}, "n", "nzz")
vim.keymap.set({"n", "v"}, "N", "Nzz")

-- always center when moving up/down half pages
vim.keymap.set({"n", "v"}, "<C-d>", "<C-d>zz")
vim.keymap.set({"n", "v"}, "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>ee", ":Explore<CR>", {silent = true})

-- pane navigation
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", {silent = true})
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", {silent = true})
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", {silent = true})
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", {silent = true})

-- python black
vim.keymap.set("n", "<leader><leader>f", ":! black %<CR>", {silent = true})
