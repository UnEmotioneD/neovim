return {
  'j-hui/fidget.nvim',
  opts = {
    progress = {
      poll_rate = 0, -- How and when to poll for progress messages
      suppress_on_insert = false, -- Suppress new messages while in insert mode
      ignore_done_already = false, -- Ignore new tasks that are already complete
      ignore_empty_message = false, -- Ignore new tasks that don't contain a message

      -- Clear notification group when LSP server detaches
      clear_on_detach = function(client_id)
        local client = vim.lsp.get_client_by_id(client_id)
        return client and client.name or nil
      end,

      -- How to get a progress message's notification group key
      notification_group = function(msg)
        return msg.lsp_client.name
      end,
      ignore = {}, -- List of LSP servers to ignore

      -- Options related to Neovim's built-in LSP client
      lsp = {
        progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
        log_handler = false, -- Log `$/progress` handler invocations (for debugging)
      },
    },

    integration = {
      ['nvim-tree'] = {
        enable = true,
      },
    },

    -- Options related to logging
    logger = {
      level = vim.log.levels.WARN, -- Minimum logging level
      max_size = 1024, -- Maximum log file size, in KB
      float_precision = 0.01,
      -- Where Fidget writes its logs to
      path = string.format('%s/fidget.nvim.log', vim.fn.stdpath('cache')),
    },
  },
}
