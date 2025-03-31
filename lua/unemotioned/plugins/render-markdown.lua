return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    enabled = false, -- render by default
    ---@type string | 'none' | 'lazy' | 'obsidian'
    preset = 'lazy',
    anti_conceal = {
      above = 0, -- Number of lines above cursor to show.
      below = 0, -- Number of lines below cursor to show.
    },
    latex = { enabled = false },
  },
}
