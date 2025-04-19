return {
  'rmagatti/auto-session',
  lazy = false,
  init = function()
    vim.opt.sessionoptions = table.concat({
      'blank',
      'buffers',
      'curdir',
      'folds',
      'help',
      'tabpages',
      'winsize',
      'winpos',
      'terminal',
      'localoptions',
    }, ',')
  end,
  opts = {
    auto_restore = false,
    suppressed_dirs = {
      '~/',
      '~/Desktop/',
      '~/Documents/',
      '~/Downloads/',
    },
    session_lens = {
      mappings = {
        delete_session = { 'i', '<C-d>' },
      },
    },
  },
}
