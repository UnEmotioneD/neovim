return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 300,
    icons = {
      keys = {
        Esc = '<Esc>',
        BS = '<BS>',
        Space = '<Space>',
      },
    },
    spec = {
      { '<leader>e', group = '[E]xplorer' },
      { '<leader>d', group = '[D]elete' },
      { '<leader>f', group = '[F]ind' },
      -- { '<leader>g', group = 'Chat [G]pt' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]ive server' },
      { '<leader>m', group = '[M]arkdown' },
      { '<leader>n', group = '[N]eck-Pain' },
      { '<leader>q', group = '[Q]uit' },
      { '<leader>s', group = '[S]plit' },
      { '<leader>t', group = '[T]ab' },
      { '<leader>u', group = '[U]ndo' },
      { '<leader>w', group = '[W]session' },
      { '<leader>x', group = '[X]trouble' },
      { '<leader>/', group = '[/]Search' },
    },

    win = {
      ---@type string | "single" | "double" | "solid" | "shadow"
      border = 'rounded',
    },
  },
}
