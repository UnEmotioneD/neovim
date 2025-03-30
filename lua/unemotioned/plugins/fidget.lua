return {
  'j-hui/fidget.nvim',
  opts = {
    progress = {
      poll_rate = 0, -- How and when to poll for progress messages
      suppress_on_insert = false,
      ignore_done_already = true,
      ignore_empty_message = true,
      ignore = {},
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
  },
}
