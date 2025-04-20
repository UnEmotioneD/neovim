return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
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
      { '<leader>d', group = '[D]iagnostic' },
      { '<leader>e', group = '[E]xplorer' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>fc', group = '[C]alls' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]ive-server' },
      { '<leader>m', group = '[M]arkdown' },
      { '<leader>n', group = '[N]eck' },
      { '<leader>r', group = '[R]e' },
      { '<leader>s', group = '[S]plit' },
      { '<leader>w', group = 'Session' },
      { '<leader>x', group = 'Trouble' },
      { '<leader><Space>', group = 'Harpoon' },
    },

    win = {
      ---@type string 'single' | 'double' | 'solid' | 'shadow' | 'rounded' | 'none'
      border = 'single',
    },
  },
}
