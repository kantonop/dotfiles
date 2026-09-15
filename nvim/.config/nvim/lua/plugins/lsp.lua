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
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          nmap('gr', function() require('telescope.builtin').lsp_references() end, '[G]oto [R]eferences')
          nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
          nmap('<leader>ds', function() require('telescope.builtin').lsp_document_symbols() end, '[D]ocument [S]ymbols')
          nmap('<leader>ws', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, '[W]orkspace [S]ymbols')
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')
          nmap('<leader>ff', vim.lsp.buf.format, '[F]ormat Current [F]ile (with LSP Formatting)')
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
        helm_ls = {
          ['helm-ls'] = {
            yamlls = { path = 'yaml-language-server' },
          },
        },
        yamlls = {},
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
