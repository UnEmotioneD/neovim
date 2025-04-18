return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local isText = true
    -- Global diagnostic configuration
    vim.diagnostic.config({
      virtual_text = isText,
      severity_sort = true,
      float = { border = 'single' },
    })
    -- Toggle inline diagnostic
    local function inline_toggle()
      isText = not isText
      vim.diagnostic.config({
        virtual_text = isText,
      })
    end
    -- Toggle diagnostic style
    local diagnostic_toggle = function()
      if isText == true then
        vim.diagnostic.config({
          virtual_lines = { current_line = true },
        })
      else
        vim.diagnostic.config({
          virtual_lines = false,
        })
      end
      vim.diagnostic.config({ virtual_text = not isText })
      isText = not isText
    end

    -- Centralized on_attach function for setting up buffer-local key mappings
    local on_attach = function(ev)
      -- Enable inlay hints by default
      if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
        vim.lsp.inlay_hint.enable(true)
      end

      local opts = { buffer = ev.buf, silent = true }
      local mappings = {
        -- stylua: ignore start
        { mode = 'n', lhs = 'K', rhs = function() vim.lsp.buf.hover({ border = 'single' }) end, desc = 'Documentation for Cursor' },

        { mode = 'n', lhs = 'gi', rhs = ':Telescope lsp_implementations<CR>', desc = 'LSP implementations' },
        { mode = 'n', lhs = 'gr', rhs = ':Telescope lsp_references<CR>', desc = 'LSP references' },
        { mode = 'n', lhs = 'gt', rhs = ':Telescope lsp_type_definitions<CR>', desc = 'LSP type definitions' },
        { mode = 'n', lhs = 'gd', rhs = ':Telescope lsp_definitions<CR>', desc = 'LSP definitions' },
        { mode = 'n', lhs = 'gD', rhs = vim.lsp.buf.declaration, desc = 'Go to Declaration' },

        { mode = 'n', lhs = '<leader>fs', rhs = ':Telescope lsp_document_symbols<CR>', desc = '[f]ind buffer [s]ymbols' },
        { mode = 'n', lhs = '<leader>fS', rhs = ':Telescope lsp_workspace_symbols<CR>', desc = '[f]ind workspace [s]ymbols' },
        { mode = 'n', lhs = '<leader>fi', rhs = ':Telescope lsp_incoming_calls<CR>', desc = '[i]ncoming calls' },
        { mode = 'n', lhs = '<leader>fo', rhs = ':Telescope lsp_outgoing_calls<CR>', desc = '[o]utgoing calls' },

        { mode = 'n', lhs = '<leader>d', rhs = vim.diagnostic.open_float, desc = 'Line Diagnostics' },
        { mode = 'n', lhs = '<leader>D', rhs = ':Telescope diagnostics bufnr=0<CR>', desc = 'Buffer Diagnostics' },
        { mode = 'n', lhs = '<leader>rn', rhs = vim.lsp.buf.rename, desc = 'Smart Rename' },
        { mode = 'n', lhs = '<leader>rs', rhs = ':LspRestart<CR>', desc = 'Restart LSP' },
        { mode = 'n', lhs = '[d', rhs = function() vim.diagnostic.jump({ count = -1 }) end, desc = 'Go to prev diagnostic' },
        { mode = 'n', lhs = ']d', rhs = function() vim.diagnostic.jump({ count = 1 }) end, desc = 'Go to next diagnostic' },
        { mode = 'n', lhs = '<leader>td', rhs = inline_toggle, desc = '[t]oggle inline [d]iagnostic' },
        -- stylua: ignore end
        { mode = 'n', lhs = '<leader>ts', rhs = diagnostic_toggle, desc = '[t]oggle diagnostic [s]tyle' },
        {
          mode = 'n',
          lhs = '<leader>th',
          rhs = function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
          end,
          desc = '[t]oggle inlay-[h]int',
        },
      }

      for _, map in ipairs(mappings) do
        vim.keymap.set(map.mode, map.lhs, map.rhs, vim.tbl_extend('force', opts, { desc = map.desc }))
      end
    end

    -- Enhance LSP capabilities for autocompletion
    local capabilities = vim.tbl_deep_extend('force', cmp_nvim_lsp.default_capabilities(), {
      textDocument = {
        completion = {
          editsNearCursor = true,
        },
      },
    })

    -- fix warning: multiple different client offset_encodings detected for buffer (c, cpp file)
    local capabilities_utf_16 = vim.tbl_deep_extend('force', {}, capabilities, {
      offsetEncoding = { 'utf-16' },
    })

    -- Set up Mason LSP config handlers with centralized on_attach and capabilities
    mason_lspconfig.setup_handlers({
      -- Default handler for all servers
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      -- Server-specific configurations:
      ['typos_lsp'] = function()
        lspconfig.typos_lsp.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          cmd_env = { RUST_LOG = 'error' },
          init_options = {
            config = vim.fn.expand('~/.config/nvim/typos/typos.toml'),
            ---@type 'Error' | 'Warning' | 'Hint' | 'Info'
            diagnosticSeverity = 'Hint',
          },
        })
      end,
      ['lua_ls'] = function()
        lspconfig.lua_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
                disable = { 'missing-fields' },
              },
              completion = { callSnippet = 'Replace' },
            },
          },
        })
      end,
      ['clangd'] = function()
        lspconfig.clangd.setup({
          on_attach = on_attach,
          capabilities = capabilities_utf_16,
          filetypes = { 'c', 'cpp' },
        })
      end,
      ['ruff'] = function()
        lspconfig.ruff.setup({
          on_attach = function(client)
            -- Disable hover/completion from ruff to avoid duplication with pyright
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.completionProvider = false
          end,
          capabilities = capabilities,
          filetypes = { 'python' },
        })
      end,
      ['emmet_ls'] = function()
        lspconfig.emmet_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { 'html', 'css', 'javascriptreact' },
        })
      end,
    })
  end,
}
