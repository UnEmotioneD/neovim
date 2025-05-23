return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local diagnostic = vim.diagnostic.config
    local isText = true

    -- Global diagnostic configuration
    diagnostic({
      virtual_text = isText,
      float = { border = 'single' },
    })

    local function toggle_inline_diagnostics()
      isText = not isText
      diagnostic({
        virtual_text = isText,
      })
    end

    local function toggle_diagnostics_style()
      if isText == true then
        diagnostic({
          virtual_lines = { current_line = true },
        })
      else
        diagnostic({
          virtual_lines = false,
        })
      end
      diagnostic({ virtual_text = not isText })
      isText = not isText
    end

    -- Centralized on_attach function for setting up buffer-local key mappings
    local on_attach = function(ev)
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
        { mode = 'n', lhs = '<leader>fci', rhs = ':Telescope lsp_incoming_calls<CR>', desc = '[f]ind [c]alls [i]ncoming' },
        { mode = 'n', lhs = '<leader>fco', rhs = ':Telescope lsp_outgoing_calls<CR>', desc = '[f]ind [c]alls [o]utgoing' },

        { mode = 'n', lhs = '<leader>rn', rhs = vim.lsp.buf.rename, desc = 'Smart re[n]ame' },
        { mode = 'n', lhs = '<leader>rs', rhs = ':LspRestart<CR>', desc = 'LSP re[s]tart' },

        { mode = 'n', lhs = '[d', rhs = function() vim.diagnostic.jump({ count = -1 }) end, desc = 'Go to prev diagnostic' },
        { mode = 'n', lhs = ']d', rhs = function() vim.diagnostic.jump({ count = 1 }) end, desc = 'Go to next diagnostic' },
        { mode = 'n', lhs = '<leader>dl', rhs = vim.diagnostic.open_float, desc = '[d]iagnostics [l]ine' },
        { mode = 'n', lhs = '<leader>db', rhs = ':Telescope diagnostics bufnr=0<CR>', desc = '[d]iagnostics [b]uffer' },
        { mode = 'n', lhs = '<leader>di', rhs = toggle_inline_diagnostics, desc = 'toggle [i]nline-diagnostics' },
        { mode = 'n', lhs = '<leader>ds', rhs = toggle_diagnostics_style, desc = 'toggle [d]iagnostics [s]tyle' },
        -- stylua: ignore end
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
    -- Fix encoding issues: multiple different client offset_encodings detected for buffer (c, cpp file)
    local capabilities_utf_16 = vim.tbl_deep_extend('force', {}, capabilities, {
      offsetEncoding = { 'utf-16' },
    })

    -- Use native vim.lsp.config API to configure servers
    local lsp = vim.lsp.config
    lsp('typos_lsp', {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd_env = { RUST_LOG = 'error' },
      init_options = {
        config = vim.fn.expand('~/.config/nvim/typos/typos.toml'),
        diagnosticSeverity = 'Hint',
      },
    })
    lsp('lua_ls', {
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
    lsp('clangd', {
      on_attach = on_attach,
      capabilities = capabilities_utf_16,
      filetypes = { 'c', 'cpp' },
    })
    lsp('ruff', {
      on_attach = function(client)
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.completionProvider = false
      end,
      filetypes = { 'python' },
    })
    lsp('emmet_ls', {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'html', 'css', 'javascriptreact' },
    })
  end,
}
