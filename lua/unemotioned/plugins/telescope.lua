return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        path_display = { 'smart' },

        layout_config = {
          ---@type string | 'bottom' | 'top'
          prompt_position = 'bottom',
        },
        ---@type string | 'horizontal' | 'vertical'
        layout_strategy = 'horizontal',
        ---@type string | 'ascending' | 'descending'
        sorting_strategy = 'descending',

        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = {},
      },
    })

    telescope.load_extension('fzf')
  end,
}
