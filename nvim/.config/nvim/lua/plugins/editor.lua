return {
  { 'numToStr/Comment.nvim', opts = {} },
  -- Load before the first buffer's filetype detection, including on a fresh install.
  { 'tpope/vim-sleuth', lazy = false },
  {
    'm4xshen/autoclose.nvim',
    event = 'InsertEnter',
    opts = { options = { disabled_filetypes = {} } },
  },
}
