return {
  'barrett-ruth/live-server.nvim',
  event = 'VeryLazy',
  cmd = {
    'LiveServerStart',
    'LiveServerStop',
  },
  build = 'pnpm add -g live-server',
  config = true,
}
