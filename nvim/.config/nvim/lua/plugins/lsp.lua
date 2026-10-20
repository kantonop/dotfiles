return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {},
  },
  {
    'neovim/nvim-lspconfig',
    -- Configure servers before the first FileType event; defer completion itself.
    lazy = false,
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(event)
          local nmap = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        end,
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('UserLspFormat', { clear = true }),
        callback = function(event)
          local clients = vim.lsp.get_clients({
            bufnr = event.buf,
            method = 'textDocument/formatting',
          })
          if #clients > 0 then
            vim.lsp.buf.format({ bufnr = event.buf, async = false, timeout_ms = 1000 })
          end
        end,
      })

      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
      local servers = {
        gopls = {
          -- gopls expects its settings under this namespace.
          gopls = {
            experimentalPostfixCompletions = true,
            analyses = { unusedparams = true, shadow = true },
            staticcheck = true,
          },
        },
        pyright = {},
        terraformls = {},
        ansiblels = {},
        bashls = {},
        gh_actions_ls = {},
        helm_ls = {
          ['helm-ls'] = {
            yamlls = { path = 'yaml-language-server' },
          },
        },
        yamlls = {},
        vale_ls = {},
        rumdl = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }
      for name, settings in pairs(servers) do
        vim.lsp.config(name, { settings = settings })
      end
      -- ansible-vim uses `ansible` for its Treesitter-backed filetype.
      vim.lsp.config('ansiblels', { filetypes = { 'ansible', 'yaml.ansible' } })
      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
      }
    end,
  },
}
