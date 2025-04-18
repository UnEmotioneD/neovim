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
      { '<leader>c', group = '[C]onform' },
      { '<leader>d', group = '[D]elete' },
      { '<leader>e', group = '[E]xplorer' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>fc', group = '[C]alls' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]ive-server' },
      { '<leader>m', group = '[M]arkdown' },
      { '<leader>n', group = '[N]o' },
      { '<leader>s', group = '[S]plit' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>v', group = '[V]irtual' },
      { '<leader>w', group = 'Session' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>/', group = 'Search' },
      { '<leader><Space>', group = 'Harpoon' },
    },

    win = {
      ---@type string 'single' | 'double' | 'solid' | 'shadow' | 'rounded' | 'none'
      border = 'single',
    },
  },
}
