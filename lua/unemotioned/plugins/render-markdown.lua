return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = 'echasnovski/mini.nvim',
  opts = {
    enabled = false, -- render by default
    ---@type 'none' | 'lazy' | 'obsidian'
    preset = 'lazy',
    anti_conceal = {
      above = 0, -- Number of lines above cursor to show.
      below = 0, -- Number of lines below cursor to show.
    },
    latex = {
      enabled = false,
    },
  },
}
