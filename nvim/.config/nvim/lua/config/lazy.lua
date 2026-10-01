if vim.fn.has('nvim-0.12') == 0 then
  error('This configuration requires Neovim 0.12 or newer')
end

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system {
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Failed to install lazy.nvim:\n' .. output)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Lazy resets packpath too, but only after enabling vim.loader. Do it first
-- so the module cache cannot index old Packer packages during Lazy startup.
vim.opt.packpath = vim.env.VIMRUNTIME

require('lazy').setup {
  spec = { { import = 'plugins' } },
  -- Resolve Stow symlinks so updates keep the lockfile in the repository.
  lockfile = vim.fn.resolve(vim.fn.stdpath('config')) .. '/lazy-lock.json',
  install = { colorscheme = { 'catppuccin-mocha' } },
  -- These plugins do not need LuaRocks or a separate Lua installation.
  rocks = { enabled = false },
  checker = { enabled = false },
  change_detection = { notify = false },
}
