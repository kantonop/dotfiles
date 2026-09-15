return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local treesitter = require('nvim-treesitter')
      treesitter.setup {}
      treesitter.install {
        'bash', 'dockerfile', 'go', 'gomod', 'gotmpl', 'hcl', 'helm', 'jinja',
        'jinja_inline', 'json', 'lua', 'make', 'markdown', 'markdown_inline',
        'python', 'terraform', 'yaml',
      }

      -- main retains separate HCL and Terraform parsers; aliases need registering.
      vim.treesitter.language.register('bash', 'sh')
      vim.treesitter.language.register('terraform', 'terraform-vars')

      vim.api.nvim_create_autocmd({ 'FileType', 'BufWinEnter' }, {
        group = vim.api.nvim_create_augroup('TreesitterHighlight', { clear = true }),
        callback = function(event)
          if vim.bo[event.buf].buftype ~= '' or vim.bo[event.buf].filetype == '' then
            return
          end
          -- Missing parsers are normal while the asynchronous install is running.
          if vim.treesitter.get_parser(event.buf, nil, { error = false }) then
            vim.treesitter.start(event.buf)
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    init = function()
      -- Upstream recommendation: ftplugin-local motions would shadow these maps.
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = { lookahead = true },
        move = { set_jumps = true },
      }

      for key, capture in pairs {
        aa = '@parameter.outer',
        ia = '@parameter.inner',
        af = '@function.outer',
        ['if'] = '@function.inner',
        ac = '@class.outer',
        ic = '@class.inner',
      } do
        vim.keymap.set({ 'x', 'o' }, key, function()
          require('nvim-treesitter-textobjects.select').select_textobject(capture, 'textobjects')
        end, { desc = 'Select ' .. capture })
      end
    end,
  },
}
