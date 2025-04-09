return {
  'rmagatti/auto-session',
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
