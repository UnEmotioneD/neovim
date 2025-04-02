return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      ---@type string | 'buffers' | 'tabs'
      mode = 'tabs',
      ---@type string | 'slant' | 'slope' | 'thin' | 'thick'
      separator_style = 'slant',
    },
  },
}
