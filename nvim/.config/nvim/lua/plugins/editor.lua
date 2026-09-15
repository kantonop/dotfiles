return {
  {
    'numToStr/Comment.nvim',
    opts = {
      pre_hook = function()
        -- On Neovim 0.12 get_parser() returns nil instead of raising when a
        -- parser is missing. Comment.nvim assumes the older behaviour and
        -- errors before falling back to the buffer's native commentstring.
        if not vim.treesitter.get_parser(0, nil, { error = false }) and vim.bo.commentstring ~= '' then
          return vim.bo.commentstring
        end
      end,
    },
  },
  -- Load before the first buffer's filetype detection, including on a fresh install.
  { 'tpope/vim-sleuth', lazy = false },
  {
    'm4xshen/autoclose.nvim',
    event = 'InsertEnter',
    opts = { options = { disabled_filetypes = {} } },
  },
}
