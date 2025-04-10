return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        path_display = { 'smart' },

        layout_config = {
          prompt_position = 'bottom', ---@type string | 'bottom' | 'top'
        },
        layout_strategy = 'horizontal', ---@type string | 'horizontal' | 'vertical'
        sorting_strategy = 'descending', ---@type string | 'ascending' | 'descending'

        mappings = {
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<C-w>'] = actions.which_key,
            ['<C-x>'] = nil, -- disable default keymap to open in horizontal split
            ['<C-h>'] = actions.select_horizontal,
          },
        },
      },

      pickers = {
        find_files = {
          hidden = false,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
  end,
}
