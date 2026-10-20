-- Native plugin management (Neovim 0.12+):
--   :lua vim.pack.update()  -- review changes, then :write to apply or :quit
--   :lua vim.pack.get()     -- inspect packages
-- Remove a spec here before :lua vim.pack.del({ 'plugin-name' }).
-- Commit nvim-pack-lock.json alongside configuration changes.

if vim.fn.has('nvim-0.12') == 0 then
  error('This configuration requires Neovim 0.12 or newer')
end

-- Keep old Packer packages out of both startup loading and module lookup.
vim.opt.packpath = vim.env.VIMRUNTIME
vim.loader.enable()

local configured = false
local update_treesitter = false

-- Register before add(): installs restored from the lockfile also trigger hooks.
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('UserPackageBuild', { clear = true }),
  callback = function(event)
    local data = event.data
    if data.kind ~= 'install' and data.kind ~= 'update' then
      return
    end
    if data.spec.name == 'telescope-fzf-native.nvim' and vim.fn.executable('make') == 1 then
      local result = vim.system({ 'make' }, { cwd = data.path, text = true }):wait()
      if result.code ~= 0 then
        error('telescope-fzf-native build failed:\n' .. (result.stderr or '') .. (result.stdout or ''))
      end
    elseif data.spec.name == 'nvim-treesitter' then
      -- Installation can yield before packages are on runtimepath. Wait for
      -- setup on first startup; subsequent interactive updates can run now.
      if configured then
        require('nvim-treesitter').update()
      else
        update_treesitter = true
      end
    end
  end,
})

local plugins = {
  { src = 'https://github.com/nvim-lua/plenary.nvim',                    name = 'plenary.nvim',              version = 'master' },
  { src = 'https://github.com/MunifTanjim/nui.nvim',                     name = 'nui.nvim',                  version = 'main' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons',              name = 'nvim-web-devicons',         version = 'master' },
  { src = 'https://github.com/catppuccin/nvim',                          name = 'catppuccin',                version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter',          name = 'nvim-treesitter',           version = 'main' },
  { src = 'https://github.com/tpope/vim-sleuth',                         name = 'vim-sleuth',                version = 'master' },
  { src = 'https://github.com/pearofducks/ansible-vim',                  name = 'ansible-vim',               version = 'master' },
  { src = 'https://github.com/qvalentin/helm-ls.nvim',                   name = 'helm-ls.nvim',              version = 'main' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp',                     name = 'cmp-nvim-lsp',              version = 'main' },
  { src = 'https://github.com/rafamadriz/friendly-snippets',             name = 'friendly-snippets',         version = 'main' },
  { src = 'https://github.com/L3MON4D3/LuaSnip',                         name = 'LuaSnip',                   version = 'master' },
  { src = 'https://github.com/saadparwaiz1/cmp_luasnip',                 name = 'cmp_luasnip',               version = 'master' },
  { src = 'https://github.com/hrsh7th/nvim-cmp',                         name = 'nvim-cmp',                  version = 'main' },
  { src = 'https://github.com/folke/lazydev.nvim',                       name = 'lazydev.nvim',              version = 'main' },
  { src = 'https://github.com/mason-org/mason.nvim',                     name = 'mason.nvim',                version = 'main' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim',           name = 'mason-lspconfig.nvim',      version = 'main' },
  { src = 'https://github.com/j-hui/fidget.nvim',                        name = 'fidget.nvim',               version = 'main' },
  { src = 'https://github.com/neovim/nvim-lspconfig',                    name = 'nvim-lspconfig',            version = 'master' },
  { src = 'https://github.com/numToStr/Comment.nvim',                    name = 'Comment.nvim',              version = 'master' },
  { src = 'https://github.com/m4xshen/autoclose.nvim',                   name = 'autoclose.nvim',            version = 'main' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', name = 'telescope-fzf-native.nvim', version = 'main' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim',            name = 'telescope.nvim',            version = 'master' },
  { src = 'https://github.com/NeogitOrg/neogit',                         name = 'neogit',                    version = 'master' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim',                  name = 'gitsigns.nvim',             version = 'main' },
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim',      name = 'indent-blankline.nvim',     version = 'master' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',              name = 'neo-tree.nvim',             version = 'v3.x' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim',                name = 'lualine.nvim',              version = 'master' },
  { src = 'https://github.com/folke/sidekick.nvim',                      name = 'sidekick.nvim',             version = 'main' },
}

if vim.fn.executable('make') == 0 then
  plugins = vim.tbl_filter(function(plugin)
    return plugin.name ~= 'telescope-fzf-native.nvim'
  end, plugins)
end

-- Use the native load callback to add only the managed path. :packadd would
-- also search old Packer start packages with the same name. Plugin scripts
-- still run after init.lua through Neovim's normal startup loader.
vim.pack.add(plugins, {
  load = function(plugin)
    local paths = vim.opt.runtimepath:get()
    local index = #paths + 1
    for i, path in ipairs(paths) do
      if path:sub(-6) == '/after' then
        index = i
        break
      end
    end
    table.insert(paths, index, plugin.path)
    if vim.fn.isdirectory(plugin.path .. '/after') == 1 then
      paths[#paths + 1] = plugin.path .. '/after'
    end
    vim.opt.runtimepath = paths
  end,
})

require('plugins.ui')
require('plugins.treesitter')
require('plugins.infrastructure')
require('plugins.editor')
require('plugins.completion')
require('plugins.lsp')
require('plugins.telescope')
require('plugins.git')
require('plugins.ai')

configured = true
if update_treesitter then
  require('nvim-treesitter').update()
end
