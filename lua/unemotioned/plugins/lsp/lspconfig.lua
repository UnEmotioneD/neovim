return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    -- Safely require modules
    local ok, lspconfig = pcall(require, 'lspconfig')
    if not ok then
      return
    end

    local mason_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
    if not mason_ok then
      return
    end

    local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if not cmp_ok then
      return
    end

    -- Optional: Check if Telescope is installed for key mappings that depend on it
    local telescope_ok, _ = pcall(require, 'telescope')
    if not telescope_ok then
      vim.notify('Telescope is not installed. Some key mappings might not work as expected.')
    end

    -- Global diagnostic configuration
    vim.diagnostic.config({
      virtual_text = { prefix = '●' },
      severity_sort = true,
      float = { border = 'rounded' },
    })

    -- Set diagnostic signs in the sign column (gutter)
    for type, icon in pairs({ Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    -- Centralized on_attach function for setting up buffer-local key mappings
    local on_attach = function(ev)
      local opts = { buffer = ev.buf, silent = true }
      local mappings = {
        -- stylua: ignore start
        { mode = 'n', lhs = 'gR', rhs = ':Telescope lsp_references<CR>', desc = 'Show LSP references' },
        { mode = 'n', lhs = 'gD', rhs = vim.lsp.buf.declaration, desc = 'Go to declaration' },
        { mode = 'n', lhs = 'gd', rhs = ':Telescope lsp_definitions<CR>', desc = 'Show LSP definitions' },
        { mode = 'n', lhs = 'gi', rhs = ':Telescope lsp_implementations<CR>', desc = 'Show LSP implementations' },
        { mode = 'n', lhs = 'gt', rhs = ':Telescope lsp_type_definitions<CR>', desc = 'Show LSP type definitions' },
        { mode = { 'n', 'v' }, lhs = '<leader>ca', rhs = vim.lsp.buf.code_action, desc = 'See available code actions' },
        { mode = 'n', lhs = '<leader>rn', rhs = vim.lsp.buf.rename, desc = 'Smart rename' },
        { mode = 'n', lhs = '<leader>D', rhs = ':Telescope diagnostics bufnr=0<CR>', desc = 'Show buffer diagnostics' },
        { mode = 'n', lhs = '<leader>d', rhs = vim.diagnostic.open_float, desc = 'Show line diagnostics' },
        { mode = 'n', lhs = '[d', rhs = function() vim.diagnostic.jump({ count = -1 }) end, desc = 'Go to previous diagnostic', },
        { mode = 'n', lhs = ']d', rhs = function() vim.diagnostic.jump({ count = 1 }) end, desc = 'Go to next diagnostic', },
        { mode = 'n', lhs = 'K', rhs = vim.lsp.buf.hover, desc = 'Show documentation for cursor' },
        { mode = 'n', lhs = '<leader>rs', rhs = ':LspRestart<Cr>', desc = 'Restart LSP' },
        -- stylua: ignore end
      }

      for _, map in ipairs(mappings) do
        vim.keymap.set(map.mode, map.lhs, map.rhs, vim.tbl_extend('force', opts, { desc = map.desc }))
      end
    end

    -- Highlight word under cursor
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({
                group = 'lsp-highlight',
                buffer = event2.buf,
              })
            end,
          })
        end
      end,
    })

    -- Enhance LSP capabilities for autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities = {
      textDocument = {
        completion = {
          editsNearCursor = true,
        },
      },
    }

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
            ---@type string | 'Error' | 'Warning' | 'Hint' | 'Info'
            diagnosticSeverity = 'Info',
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
      ['emmet_ls'] = function()
        lspconfig.emmet_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { 'html', 'css', 'javascriptreact' },
        })
      end,
      ['clangd'] = function()
        lspconfig.clangd.setup({
          on_attach = on_attach,
          capabilities = capabilities_utf_16,
          filetypes = { 'c', 'cpp' },
        })
      end,
    })
  end,
}
