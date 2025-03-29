return {
  'barrett-ruth/live-server.nvim',
  build = 'pnpm add -g live-server',
  event = 'VeryLazy',
  cmd = { 'LiveServerStart', 'LiveServerStop' },
  config = true,
}
