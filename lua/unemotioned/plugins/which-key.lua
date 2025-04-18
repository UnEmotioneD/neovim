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
        Esc = '<ESC>',
        BS = '<BS>',
        Space = '<SPACE>',
      },
    },
    spec = {
      { '<leader>b', group = '[B]uffer' },
      { '<leader>d', group = '[D]elete' },
      { '<leader>e', group = '[E]xplorer' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]ive server' },
      { '<leader>m', group = '[M]arkdown' },
      { '<leader>n', group = '[N]o' },
      { '<leader>q', group = '[Q]uickfix' },
      { '<leader>s', group = '[S]plit' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>u', group = '[U]ndo' },
      { '<leader>v', group = '[V]irtual' },
      { '<leader>w', group = 'Session' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>z', group = '[Z]en' },
      { '<leader>/', group = '[/]Search' },
      { '<leader><Space>', group = 'Harpoon' },
    },

    win = {
      ---@type 'single' | 'double' | 'solid' | 'shadow'
      border = 'single',
    },
  },
}
