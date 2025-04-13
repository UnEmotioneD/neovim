return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    ---@type false | 'classic' | 'modern' | 'helix'
    preset = 'classic',
    delay = 300,
    plugins = {
      spelling = {
        enabled = true,
        suggestions = 4,
      },
    },
    icons = {
      keys = {
        Esc = '<Esc>',
        BS = '<BS>',
        Space = '<Space>',
      },
    },
    spec = {
      { '<leader>c', group = '[C]ode actions' },
      { '<leader>e', group = '[E]xplorer' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]ive server' },
      { '<leader>m', group = '[M]arkdown' },
      { '<leader>n', group = '[N]o' },
      { '<leader>q', group = '[Q]uit' },
      { '<leader>s', group = '[S]plit' },
      { '<leader>t', group = '[T]ab' },
      { '<leader>u', group = '[U]ndo' },
      { '<leader>v', group = '[V]irtual' },
      { '<leader>w', group = '[W]session' },
      { '<leader>x', group = '[X]trouble' },
      { '<leader>z', group = '[Z]en' },
      { '<leader>/', group = '[/]Search' },
    },

    win = {
      ---@type string 'single' | 'double' | 'solid' | 'shadow'
      border = 'single',
    },
  },
}
