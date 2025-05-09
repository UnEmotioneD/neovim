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
    keys = {
      scroll_down = '<C-f>',
      scroll_up = '<C-b>',
    },
    icons = {
      keys = {
        Esc = '<ESC>',
        BS = '<BS>',
        Space = '<SPACE>',
        Tba = '<TAB>',
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
      { '<leader>t', group = 'Toggle', mode = { 'n', 'v' } },
      { '<leader>w', group = 'Session' },
      { '<leader>x', group = 'Trouble' },
      { '<Tab>', group = 'Harpoon' },
    },

    win = {
      ---@type string 'single' | 'double' | 'rounded' | 'none'
      border = 'single',
    },
  },
}
