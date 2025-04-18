return {
  'barrett-ruth/live-server.nvim',
  ft = 'html',
  cmd = {
    'LiveServerStart',
    'LiveServerStop',
  },
  build = 'pnpm add -g live-server',
  config = true,
}
