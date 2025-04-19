return {
  'barrett-ruth/live-server.nvim',
  event = 'FileType html',
  build = 'pnpm add -g live-server',
  config = function()
    require('live-server').setup({})
  end,
}
