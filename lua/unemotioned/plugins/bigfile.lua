return {
  'LunarVim/bigfile.nvim',
  event = 'BufReadPre',
  opts = {
    filesize = 2, -- MiB
    pattern = { '*' },
    features = {
      'filetype', -- :filetype = ""
      'lsp', -- detach LSP from buffer
      'treesitter',
      'syntax', -- :syntax off
      'vimopts', -- swapfile = false, foldmethod = "manual", undolevels = -1, undoreload = 0, list = false
    },
  },
}
