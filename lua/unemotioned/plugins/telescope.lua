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
          prompt_position = 'bottom', ---@type 'bottom' | 'top'
        },
        layout_strategy = 'horizontal', ---@type 'horizontal' | 'vertical'
        sorting_strategy = 'descending', ---@type 'ascending' | 'descending'

        mappings = {
          i = {
            ['<C-h>'] = actions.select_horizontal,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<C-w>'] = actions.which_key,
            ['<C-x>'] = nil, -- disable default keymap to open in horizontal split
          },
        },
        -- files to not search
        file_ignore_patterns = {
          '%.git/',
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
