return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      theme = 'hyper',
      disable_move = true,
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          { desc = ' Explorer', group = 'Type', action = 'NvimTreeToggle', key = 'e' },
          { desc = '󰱼 Files', group = 'Type', action = 'Telescope find_files', key = 'f' },
          { desc = ' Words', group = 'Type', action = 'Telescope live_grep', key = 'w' },
          { desc = '󰁯 Session', group = 'Type', action = 'RestoreSession', key = 'r' },
          { desc = ' LazyGit', group = 'Boolean', action = 'LazyGit', key = 'g' },
          { desc = '󰩈 Quit', group = '@property', action = 'wqa', key = 'q' },
        },
        project = { limit = 5, action = 'Telescope find_files cwd=' },
        mru = { limit = 5, cwd_only = true },
      },
    })
  end,
  enabeld = true,
}
